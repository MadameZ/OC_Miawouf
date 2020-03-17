//
//  Pet.swift
//  Miawouf
//
//  Created by Caroline Zaini on 18/10/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import Foundation

struct Pet {
    // Here is the datas contained in the struct.
    enum Gender {
        case male, female
    }
    var name: String?
    var hasMajority: Bool
    var phone: String?
    var race: String?
    var gender: Gender
}

extension Pet {
    // Here is in extension, the logic of the struct.
    enum Status {
        case accepted
        case rejected(String)
    }

    var status: Status {
        if name == nil || name == "" {
            return .rejected("Vous n'avez pas indiqué votre nom !")
        }
        if phone == nil || phone == "" {
            return .rejected("Vous n'avez pas indiqué votre téléphone !")
        }
        if race == nil || race == "" {
            return .rejected("Quel est votre race ?")
        }
        if !hasMajority {
            return .rejected("Les mineurs ne sont pas admis.")
        }
        return .accepted
    }
}

