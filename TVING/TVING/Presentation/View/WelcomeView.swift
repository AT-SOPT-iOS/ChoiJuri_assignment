//
//  WelcomeView.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

import SnapKit
import Then

protocol MainButtonDelegate: AnyObject {
    func navigateToMain()
}

final class WelcomeView: UIView {
    
    weak var delegate: MainButtonDelegate?

    //MARK: - Properties
    private let logoImage = UIImageView()
    private let welcomeLabel = UILabel()
    let mainButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWelcomeText(_ id: String) {
        welcomeLabel.text = "\(id)님\n반가워요!"
    }
}

extension WelcomeView: ViewConfigurable {
    func setStyle() {
        logoImage.do {
            $0.image = .logo
        }
        
        welcomeLabel.do {
//            $0.text = "\(id)님\n반가워요!"
            $0.numberOfLines = 2
            $0.textAlignment = .center
            $0.font = .font(.pretendardBold, ofSize: 23)
            $0.textColor = .gray1
        }
        
        mainButton.do {
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .font(.pretendardSemiBold, ofSize: 14)
            $0.backgroundColor = .accent
            $0.makeCornerRadius(cornerRadius: 3)
        }
    }
    
    func setHierarchy() {
        addSubViews(
            logoImage,
            welcomeLabel,
            mainButton
        )
    }
    
    func setLayout() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(56)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(210)
            $0.width.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(67)
            $0.horizontalEdges.equalToSuperview().inset(77)
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(66)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
