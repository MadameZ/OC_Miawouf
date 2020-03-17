//
//  DogSuccessViewController.swift
//  Miawouf
//
//  Created by Caroline Zaini on 16/10/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import UIKit

class DogSuccessViewController: UIViewController {

    var dog: Pet!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextLabel()
    }
    
    private func setTextLabel() {
        if let name = dog.name {
            nameLabel.text = "Bienvenue à \(name)!"
        }
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    

    



}
