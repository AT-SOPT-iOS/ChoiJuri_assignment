//
//  LoginView.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    
    // MARK: - properties
    private let titleLabel = UILabel()
    let idTextField = UITextField()
    let idDeleteButton = UIButton()
    let passwordTextField = UITextField()
    let passwordDeleteButton = UIButton()
    let showPasswordButton = UIButton()
    let loginButton = UIButton()
    private let findIDButton = UIButton()
    private let divider = UIView()
    private let findPasswordButton = UIButton()
    private let makeAccountLabel = UILabel()
    private let makeAccountButton = UIButton()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - protocol
extension LoginView: ViewConfigurable {
    func setStyle() {
        backgroundColor = .black
        
        titleLabel.do {
            $0.text = "TIVING ID 로그인"
            $0.font = .font(.pretendardMedium, ofSize: 23)
            $0.textColor = .gray1
        }
        
        idTextField.do {
            $0.setPlaceholder(
                placeholder: "아이디",
                fontColor: .gray2,
                font: .font(.pretendardSemiBold, ofSize: 15)
            )
            $0.backgroundColor = .gray4
            $0.addPadding(left: 22)
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 3)
            $0.textColor = .gray2
            $0.tag = 0
        }
        
        idDeleteButton.do {
            $0.setImage(.xCircle, for: .normal)
            $0.isHidden = true
        }
        
        passwordTextField.do {
            $0.setPlaceholder(
                placeholder: "비밀번호",
                fontColor: .gray2,
                font: .font(.pretendardSemiBold, ofSize: 15)
            )
            $0.backgroundColor = .gray4
            $0.addPadding(left: 22)
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 3)
            $0.textColor = .gray2
            $0.isSecureTextEntry = true
            $0.tag = 1
        }
        
        passwordDeleteButton.do {
            $0.setImage(.xCircle, for: .normal)
            $0.isHidden = true
        }
        
        showPasswordButton.do {
            $0.setImage(.eye2, for: .normal)
            $0.isHidden = true
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .font(.pretendardSemiBold, ofSize: 14)
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 3)
            $0.makeBorder(width: 1, color: .gray4)
            $0.isEnabled = false
        }
        
        findIDButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .font(.pretendardSemiBold, ofSize: 14)
        }
        
        divider.do {
            $0.backgroundColor = .gray4
        }
        
        findPasswordButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .font(.pretendardSemiBold, ofSize: 14)
            
        }
        
        makeAccountLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.font = .font(.pretendardSemiBold, ofSize: 14)
            $0.textColor = .gray3
        }
        
        makeAccountButton.do {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .font(.pretendardSemiBold, ofSize: 14)
            $0.setUnderLine()
        }
    }
    
    func setHierarchy() {
        addSubViews(
            titleLabel,
            idTextField,
            idDeleteButton,
            passwordTextField,
            passwordDeleteButton,
            showPasswordButton,
            loginButton,
            findIDButton,
            divider,
            findPasswordButton,
            makeAccountLabel,
            makeAccountButton
        )
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.horizontalEdges.equalToSuperview().inset(110)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        idDeleteButton.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.top).offset(18)
            $0.trailing.equalTo(idTextField.snp.trailing).inset(20)
            $0.size.equalTo(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordDeleteButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top).offset(18)
            $0.trailing.equalTo(passwordTextField.snp.trailing).inset(50)
            $0.size.equalTo(20)
        }
        
        showPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top).offset(18)
            $0.trailing.equalTo(passwordTextField.snp.trailing).inset(20)
            $0.size.equalTo(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
            
        }
        
        findIDButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(85)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.leading.equalTo(findIDButton.snp.trailing).offset(50)
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
        
        findPasswordButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(85)
        }
        
        makeAccountLabel.snp.makeConstraints {
            $0.top.equalTo(findIDButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(51)
        }
        
        makeAccountButton.snp.makeConstraints {
            $0.top.equalTo(findIDButton.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(65)
            $0.height.equalTo(20)
        }
    }
}


#Preview {
    LoginViewController()
}

