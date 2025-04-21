//
//  Untitled.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

import SnapKit

final class LoginViewController: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.delegate = self
        rootView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
}

extension LoginViewController {
    @objc
    func loginButtonTapped() {
        guard let id = rootView.idTextField.text else { return }
        rootView.delegate?.navigateToWelcomeView(id)
    }
}

extension LoginViewController: LoginButtonDelegate {
    func navigateToWelcomeView(_ id: String) {
        let welcomeViewController = WelcomeViewController(id: id)
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
