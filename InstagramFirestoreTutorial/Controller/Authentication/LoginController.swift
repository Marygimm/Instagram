//
//  LoginController.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 12/05/2022.
//

import UIKit

protocol AuthenticationDelegate: AnyObject {
    func authenticationDidCompleted()
}

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var viewModel = LoginViewModel()
    weak var delegate: AuthenticationDelegate?
    
    private lazy var iconImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Instagram_logo_white"))
        image.contentMode = .scaleAspectFill
        return image
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
    
    private lazy var loginButton: UIButton = {
        let button = CustomButton(title: "Log in")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleShowResetPassword), for: .touchUpInside)
        button.attributedTitle(firstPart: "Forgot your password? ", secondPart: "Get help signing in")
        return button
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an account? ", secondPart: "Sing Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNotificationOnbservers()
    }
    
    // MARK: - Actions
    
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        controller.delegate = delegate
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text?.lowercased(), let password = passwordTextField.text else { return }
        AuthService.logUserIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to log user in\(error.localizedDescription)")
                return
            }
            self.delegate?.authenticationDidCompleted()
        }
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        updateForm()
    }
    
    @objc func handleShowResetPassword() {
        let controller = ResetPasswordController()
        controller.delegate = self
        controller.email = emailTextField.text
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationController?.navigationBar.barStyle = .black
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,
                                                       loginButton, forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
    }
    
    func configureNotificationOnbservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange(sender:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange(sender:)), for: .editingChanged)
    }
}

// MARK: - FormViwModel

extension LoginController: FormViwModel {
    func updateForm() {
        loginButton.isEnabled = viewModel.formIsValid
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
}

// MARK: - ResetPasswordControllerDelegate


extension LoginController: ResetPasswordControllerDelegate {
    func controllerDidResetPasswordLink(_ controller: ResetPasswordController) {
        navigationController?.popViewController(animated: true)
        showMessage(withTitle: "Success", messagem: "We sent a link to your email to reset your password")
    }
    
    
}
