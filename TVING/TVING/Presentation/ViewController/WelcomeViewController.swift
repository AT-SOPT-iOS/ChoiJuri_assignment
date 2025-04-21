//
//  WelcomeViewController.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

final class WelcomeViewController: UIViewController {
    private let rootView = WelcomeView()
    private let id: String
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
        
        rootView.setWelcomeText(id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.delegate = self
        rootView.mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
    }
}

extension WelcomeViewController {
    @objc
    private func mainButtonTapped() {
        navigateToMain()
    }
}

extension WelcomeViewController: MainButtonDelegate {
    func navigateToMain() {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        }
    }
}
