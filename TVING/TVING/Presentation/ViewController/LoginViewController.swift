//
//  Untitled.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

import SnapKit

// 상속 -> 뷰 매개변수로 받기
final class LoginViewController: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
