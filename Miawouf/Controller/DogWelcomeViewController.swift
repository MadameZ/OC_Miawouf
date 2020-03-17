//
//  WelcomeViewController.swift
//  Miawouf
//
//  Created by Caroline Zaini on 16/10/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import UIKit

class DogWelcomeViewController: UIViewController {
    
/*  Declare the welcomeViewController as a target of an unwind segue.
    It'll be use when we come back at the welcome interface.            */
    
    /// On déclare juste la cible de l'unwindSegue puis on control drag le bouton du successViewController vers l'icône "Exit" et on choisi unwidSegue :
    @IBAction func unwindToWelcome(segue:UIStoryboardSegue) {
        // When we ant to do something at the end of the segue.
    }

}
