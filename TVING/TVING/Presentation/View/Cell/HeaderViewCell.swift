//
//  HeaderViewCell.swift
//  TVING
//
//  Created by 최주리 on 5/1/25.
//

import UIKit

final class HeaderViewCell: UICollectionViewCell {
    static let identifier = "HeaderViewWithMoreButton"
    
    let titleLabel = UILabel()
    let moreButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.do {
            $0.font = .font(.pretendardBold, ofSize: 15)
            $0.textColor = .white
        }
        
        moreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
        }
        
        contentView.addSubViews(titleLabel, moreButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.top.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataBind(_ title: String, hasButton: Bool) {
        titleLabel.text = title
        moreButton.isHidden = !hasButton
    }
}
