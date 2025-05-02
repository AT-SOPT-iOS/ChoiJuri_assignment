//
//  AdvertiseCell.swift
//  TVING
//
//  Created by 최주리 on 5/2/25.
//

import UIKit

final class AdvertiseCell: UICollectionViewCell {
    
    static let identifier = "AdvertiseCell"
    
    // MARK: - properties
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.do {
            $0.image = .advertisementBanner
        }
        
        contentView.addSubViews(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

