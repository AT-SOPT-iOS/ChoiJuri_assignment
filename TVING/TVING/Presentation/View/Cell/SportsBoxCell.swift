//
//  SportsBoxCell.swift
//  TVING
//
//  Created by 최주리 on 5/1/25.
//

import UIKit

final class SportsBoxCell: UICollectionViewCell {
    
    static let identifier = "SportsBoxCell"
    
    // MARK: - properties
    let backView = UIView()
    let imageView = UIImageView()
    
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

extension SportsBoxCell {
    func dataBind(_ data: SportsModel) {
        imageView.image = data.image
    }
}

// MARK: - protocol
extension SportsBoxCell: ViewConfigurable {
    func setStyle() {
        backView.do {
            $0.backgroundColor = .gray5
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 4)
        }
    }
    
    func setHierarchy() {
        contentView.addSubViews(backView, imageView)
    }
    
    func setLayout() {
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(6)
            $0.leading.equalTo(backView.snp.leading).offset(11)
            $0.width.equalTo(68)
            $0.height.equalTo(34)
        }
    }
}
