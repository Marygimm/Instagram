//
//  CustomTextField.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 13/05/2022.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String, secureTextEntry: Bool = false) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        //same height of textField
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        isSecureTextEntry = secureTextEntry
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
