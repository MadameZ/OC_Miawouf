//
//  CatSuccessViewController.swift
//  Miawouf
//
//  Created by Caroline Zaini on 17/10/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import UIKit

class CatSuccessViewController: UIViewController {

    var cat: Pet!
    @IBOutlet weak var nameCatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCatTextLabel()
    }
    
    private func setCatTextLabel() {
        if let catName = cat.name {
            nameCatLabel.text = "Bienvenue à \(catName)!"
        }
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    

    



}
