//
//  ResetPasswordController.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 03/08/2022.
//

import UIKit

protocol ResetPasswordControllerDelegate: AnyObject {
    func controllerDidResetPasswordLink(_ controller: ResetPasswordController)
}

class ResetPasswordController: UIViewController {
    
    //MARK: - Properties
    private var viewModel = ResetPasswordViewModel()
    
    var email: String?
    
    weak var delegate: ResetPasswordControllerDelegate?
    
    private lazy var emailTextField = CustomTextField(placeholder: "Email")
    private lazy var iconImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Instagram_logo_white"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var resetPassowrdButton: CustomButton = {
        let customButton = CustomButton(title: "Reset Password")
        customButton.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        return customButton
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        emailTextField.text = email
        viewModel.email = email
        
        updateForm()
        
        emailTextField.addTarget(self, action: #selector(textDidChange(sender:)), for: .editingChanged)
        
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor, paddingTop: 16, paddingLeft: 16)
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, resetPassowrdButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    //MARK: - Actions
    
    
    @objc func handleResetPassword() {
        guard let email = emailTextField.text else { return }
        self.showLoader(true)
        AuthService.resetPassword(withEmail: email) { error in
            if let error = error {
                self.showMessage(withTitle: "Error", messagem: error.localizedDescription)
                self.showLoader(false)
                return
            }
            
            self.delegate?.controllerDidResetPasswordLink(self)
        }
        
    }
    @objc func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
        updateForm()
    }
    
}

// MARK: - FormViwModel

extension ResetPasswordController: FormViwModel {
    func updateForm() {
        resetPassowrdButton.isEnabled = viewModel.formIsValid
        resetPassowrdButton.backgroundColor = viewModel.buttonBackgroundColor
        resetPassowrdButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
}
