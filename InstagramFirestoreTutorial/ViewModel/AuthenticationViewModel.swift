//
//  AuthenticationViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 17/05/2022.
//

import Foundation
import UIKit

protocol FormViwModel {
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
    var buttonBackgroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}

struct LoginViewModel: AuthenticationViewModel {
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

struct RegistrationViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    var fullName: String?
    var username: String?
    var profileImage: UIImage?
    
    var formIsValid: Bool {
        guard let emailValue = email, let passwordValue = password, let fullNameValue = fullName, let usernameValue = username, let _ = profileImage else { return false }
        return !emailValue.isEmpty && !passwordValue.isEmpty && !fullNameValue.isEmpty && !usernameValue.isEmpty
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? UIColor.blue : UIColor.systemPurple.withAlphaComponent(0.3)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}
