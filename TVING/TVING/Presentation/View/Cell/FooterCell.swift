//
//  FooterCell.swift
//  TVING
//
//  Created by 최주리 on 5/2/25.
//

import UIKit

final class FooterCell: UICollectionViewCell {
    static let identifier = "FooterCell"
    
    let backView = UIView()
    let noticeTitleLabel = UILabel()
    let noticeContentLabel = UILabel()
    let arrowImageView = UIImageView()
    
    let labels = UILabel()
    
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

extension FooterCell: ViewConfigurable {
    func setStyle() {
        backView.do {
            $0.backgroundColor = .gray5
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 5)
        }
        
        noticeTitleLabel.do {
            $0.text = "공지"
            $0.font = .font(.pretendardMedium, ofSize: 11)
            $0.textColor = .gray3
        }
        
        noticeContentLabel.do {
            $0.text = "티빙 계정 공유 정책 추가 안내"
            $0.font = .font(.pretendardMedium, ofSize: 11)
            $0.textColor = .gray1
        }
        
        arrowImageView.do {
            $0.image = .arrowRight
        }
        
        labels.do {
            $0.text = "고객문의∙이용약관∙개인정보처리방침\n사업자정보∙인재채용"
            $0.font = .font(.pretendardMedium, ofSize: 11)
            $0.textColor = .gray2
            $0.numberOfLines = 2
        }
    }
    
    func setHierarchy() {
        contentView.addSubViews(
            backView,
            noticeTitleLabel,
            noticeContentLabel,
            arrowImageView,
            labels
        )
    }
    
    func setLayout() {
        backView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(50)
        }
        
        noticeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(16)
            $0.leading.equalTo(backView.snp.leading).offset(17)
        }
        
        noticeContentLabel.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(16)
            $0.leading.equalTo(noticeTitleLabel.snp.trailing).offset(8)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(16)
            $0.trailing.equalTo(backView.snp.trailing).offset(-16)
            $0.size.equalTo(18)
        }
        
        labels.snp.makeConstraints {
            $0.top.equalTo(backView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}

