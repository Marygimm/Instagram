//
//  AuthenticationViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 17/05/2022.
//

import Foundation
import UIKit

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        guard let emailValue = email, let passwordValue = password else { return false }
        return !emailValue.isEmpty && !passwordValue.isEmpty
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? UIColor.blue : UIColor.systemPurple.withAlphaComponent(0.3)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
    
}

struct RegistrationViewModel {
    var email: String?
    var password: String?
    var fullName: String?
    var username: String?
}
