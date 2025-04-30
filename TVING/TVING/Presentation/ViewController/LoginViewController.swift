//
//  Untitled.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - properties
    private let rootView = LoginView()
    
    // MARK: - LifeCycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setTarget()
    }
}

// MARK: - functions
extension LoginViewController {
    private func setDelegate() {
        rootView.idTextField.delegate = self
    }
    
    // TODO: 함수 정리하기 ..
    private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        rootView.idTextField.addTarget(self, action: #selector(isTextFieldFilled), for: .editingChanged)
        rootView.idTextField.addTarget(self, action: #selector(isIdTextFieldFilled), for: .editingChanged)
        
        rootView.idDeleteButton.addTarget(self, action: #selector(idDeleteButtonTapped), for: .touchUpInside)
        
        rootView.passwordTextField.addTarget(self, action: #selector(isTextFieldFilled), for: .editingChanged)
        rootView.passwordTextField.addTarget(self, action: #selector(isPasswordTextFieldFilled), for: .editingChanged)
        
        rootView.passwordDeleteButton.addTarget(self, action: #selector(passwordDeleteButtonTapped), for: .touchUpInside)
        
        rootView.showPasswordButton.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
    }
}

// MARK: - objc
extension LoginViewController {
    @objc
    private func loginButtonTapped() {
        guard let id = rootView.idTextField.text else { return }
        
        let welcomeViewController = WelcomeViewController(id: id)
        welcomeViewController.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func isTextFieldFilled() {
        guard let id = rootView.idTextField.text else { return }
        guard let password = rootView.passwordTextField.text else { return }
        
        if !id.isEmpty, !password.isEmpty {
            rootView.loginButton.backgroundColor = .accent
            rootView.loginButton.setTitleColor(.white, for: .normal)
            rootView.loginButton.isEnabled = true
        } else {
            rootView.loginButton.backgroundColor = .clear
            rootView.loginButton.setTitleColor(.gray2, for: .normal)
            rootView.loginButton.isEnabled = false
        }
    }
    
    @objc
    private func isIdTextFieldFilled() {
        guard let id = rootView.idTextField.text else { return }
        
        if id.isEmpty {
            rootView.idDeleteButton.isHidden = true
        } else {
            rootView.idDeleteButton.isHidden = false
        }
    }
    
    @objc
    private func isPasswordTextFieldFilled() {
        guard let password = rootView.passwordTextField.text else { return }
        
        if password.isEmpty {
            rootView.passwordDeleteButton.isHidden = true
            rootView.showPasswordButton.isHidden = true
        } else {
            rootView.passwordDeleteButton.isHidden = false
            rootView.showPasswordButton.isHidden = false
        }
    }
    
    @objc
    private func passwordDeleteButtonTapped() {
        rootView.passwordTextField.text = ""
        rootView.passwordDeleteButton.isHidden = true
        rootView.showPasswordButton.isHidden = true
        isTextFieldFilled()
    }
    
    @objc
    private func idDeleteButtonTapped() {
        rootView.idTextField.text = ""
        rootView.idDeleteButton.isHidden = true
        isTextFieldFilled()
    }
    
    @objc
    private func showPasswordButtonTapped() {
        if rootView.passwordTextField.isSecureTextEntry {
            rootView.showPasswordButton.setImage(.eyeSlash, for: .normal)
            rootView.passwordTextField.isSecureTextEntry = false
        } else {
            rootView.showPasswordButton.setImage(.eye2, for: .normal)
            rootView.passwordTextField.isSecureTextEntry = true
        }
    }
}

// MARK: - delegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            rootView.idTextField.layer.borderWidth = 1
            rootView.idTextField.layer.borderColor = UIColor.gray2.cgColor
            rootView.passwordTextField.layer.borderColor = UIColor.clear.cgColor
        } else if textField.tag == 1 {
            rootView.passwordTextField.layer.borderWidth = 1
            rootView.passwordTextField.layer.borderColor = UIColor.gray2.cgColor
            rootView.idTextField.layer.borderColor = UIColor.clear.cgColor
        } else {
            rootView.idTextField.layer.borderColor = UIColor.clear.cgColor
            rootView.passwordTextField.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
