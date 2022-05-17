//
//  RegistrationController.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 12/05/2022.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Password", secureTextEntry: true)
        return textField
    }()
    
    private lazy var fullNameTextField = CustomTextField(placeholder: "FullName")
    
    private lazy var usernameTextField = CustomTextField(placeholder: "Username")
    
    private lazy var signUpButton = CustomButton(title: "Sign Up")
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account? ", secondPart: "Sing Up")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func handleShowLogin() {
        self.navigationController?.popViewController(animated: true)
    }

    
    // MARK: - Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, usernameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        
        
    }
}
