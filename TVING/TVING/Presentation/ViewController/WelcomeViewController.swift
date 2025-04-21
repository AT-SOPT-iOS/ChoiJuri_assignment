//
//  WelcomeViewController.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

final class WelcomeViewController: UIViewController {
    private let rootView = WelcomeView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
