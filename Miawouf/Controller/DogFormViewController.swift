//
//  DogFormViewController.swift
//  Miawouf
//
//  Created by Caroline Zaini on 16/10/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import UIKit

class DogFormViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Properties
    /* optional with ! because we doesn't know the value of the property at the loaded of the VC but we know that it'll have a value before we use in prepareForSegue.*/
    var dog: Pet!
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var racePickerView: UIPickerView!
    
}

// MARK: - Keyboard
extension DogFormViewController {
    // Regroup the group of method together in an extension.
    
    // Use when the user tap the return key on the keyboard then the keyboard deasapear.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // It's link with the tap gesture associate with the principal view.
    @IBAction func dismissKeyboard(_ sender: Any) {
        ///lorsqu'on touche le textfield in devient le first responder, pour ne plus l'être resignFirstResponder() et le clavier disparaît.
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
}

// MARK: - PickerView
extension DogFormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // Here is all the implementations of the PickerViewDelegate and PickerViewDataSource.

    // Methodes - DataSource
    // The components are the number of the column of the pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // It's the elements witch are in the column
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
    
    // Metode - Delegate
    // Witch titles we want to use in the rows
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }
}

// MARK: - Validate
extension DogFormViewController {
    // Regroupe all the methods responsable to validate the form.
  
    @IBAction func validate(_ sender: Any) {
        createPetObject()
        // 4. To launch a segue with the code
        checkPetStatus()
    }
    private func createPetObject() {
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMojority = majoritySwitch.isOn
        
        // get the element selected.
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        
        // it's an operator ternaire
        let gender: Pet.Gender = (genderIndex == 0) ? .female : .male
        
        // Replace by the contante at the top.
    /*      var gender: Pet.Gender
            if genderIndex == 0 {
            gender = .female
            } else {
            gender = .male
            } */
        /// 1 colonne => component = 0
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        dog = Pet(name: name, hasMajority: hasMojority, phone: phone, race: race, gender: gender)
    }
    
    
    private func checkPetStatus() {
        switch dog.status {
        case .accepted:
            performSegue(withIdentifier: "segueDogToSuccess", sender: self)
        case .rejected(let error):
            presentAlert(with: error)
        }
    }
    
    private func presentAlert(with error: String) {
        let alertVC =  UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
        
    }
 }

// MARK: - Navigation
extension DogFormViewController {
    // Regroup in an extension, all the methods responsable of the navigation

        // The method prepareFor segue is executed before the transition to the other controller
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // 1. verify the identifier.
            if segue.identifier == "segueDogToSuccess"{
                // 2. take the controller of the destination. as with ! because we're sure this is the one.
                let successVC = segue.destination as! DogSuccessViewController
                // 3. Pass the data (the dog object)
                successVC.dog = dog
            }
        }
    }



    


