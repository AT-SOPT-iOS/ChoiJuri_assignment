//
//  LifeCell.swift
//  TVING
//
//  Created by 최주리 on 5/2/25.
//

import UIKit

final class LifeCell: UICollectionViewCell {
    
    static let identifier = "LifeCell"
    
    // MARK: - properties
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubViews(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(85)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LifeCell {
    func dataBind(_ data: LifeModel) {
        imageView.image = data.image
    }
}
