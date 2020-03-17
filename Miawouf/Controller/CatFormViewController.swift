//
//  CatFormViewController.swift
//  Miawouf
//
//  Created by Caroline Zaini on 17/10/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import UIKit

class CatFormViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties
    var cat: Pet!
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var racePickerView: UIPickerView!
}

// MARK: - Keyboard
extension CatFormViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func dismissKeyboard(_ sender: Any) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
}

// MARK: - PickerView
extension CatFormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK : Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRaces.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }
}

// MARK: - Validate
extension CatFormViewController {
    @IBAction func validate(_ sender: Any) {
        createPetObject()
        checkPetStatus()
    }
    private func createPetObject() {
        let catName = nameTextField.text
        let catPhone = phoneTextField.text
        let catHasMajority = majoritySwitch.isOn
        let catGenderIndex = genderSegmentedControl.selectedSegmentIndex
        let catGender: Pet.Gender = (catGenderIndex == 0) ? .female : .male
        let catRaceIndex = racePickerView.selectedRow(inComponent: 0)
        let catRace = catRaces[catRaceIndex]
        cat = Pet(name: catName, hasMajority: catHasMajority, phone: catPhone, race: catRace, gender: catGender)
        print("le nom du chat : \(catName!)")
    }
    
    private func checkPetStatus() {
        switch cat.status {
        case .accepted:
        performSegue(withIdentifier: "segueCatToSuccess", sender: self)
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
extension CatFormViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCatToSuccess" {
            let successVC = segue.destination as! CatSuccessViewController
            successVC.cat = cat
        }
    }
}


