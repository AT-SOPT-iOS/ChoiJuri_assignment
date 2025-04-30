//
//  WelcomeViewController.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - properties
    private let rootView = WelcomeView()
    private let id: String
    
    // MARK: - init
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    // MARK: - LifeCycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
        bind()
    }
}

// MARK: - functions
extension WelcomeViewController {
    private func setTarget() {
        rootView.mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
    }
    
    private func bind() {
        rootView.setWelcomeText(id)
    }
}

// MARK: - objc
extension WelcomeViewController {
    @objc
    private func mainButtonTapped() {
        guard let navigationController else { return }
        
        navigationController.popViewController(animated: true)
    }
}
