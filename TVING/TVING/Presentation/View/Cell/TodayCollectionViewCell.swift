//
//  TodayCollectionViewCell.swift
//  TVING
//
//  Created by 최주리 on 5/1/25.
//

import UIKit

final class TodayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TodayCollectionViewCell"
    
    // MARK: - properties
    let numberLabel = UILabel()
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

extension TodayCollectionViewCell {
    func dataBind(_ data: TodayModel) {
        imageView.image = data.image
        numberLabel.text = String(data.number)
    }
}

// MARK: - protocol
extension TodayCollectionViewCell: ViewConfigurable {
    func setStyle() {
        numberLabel.do {
            $0.textColor = .white
            $0.font = .italicSystemFont(ofSize: 50)
        }
    }
    
    func setHierarchy() {
        contentView.addSubViews(numberLabel, imageView)
    }
    
    func setLayout() {
        numberLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(numberLabel.snp.trailing)
        }
    }
}
