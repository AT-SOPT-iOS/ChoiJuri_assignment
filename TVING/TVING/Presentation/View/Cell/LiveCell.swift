//
//  LiveCell.swift
//  TVING
//
//  Created by 최주리 on 5/1/25.
//

import UIKit

final class LiveCell: UICollectionViewCell {
    
    static let identifier = "LiveCell"
    
    // MARK: - properties
    let imageView = UIImageView()
    let numberLabel = UILabel()
    let companyLabel = UILabel()
    let titleLabel = UILabel()
    let percentLabel = UILabel()
    
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

extension LiveCell {
    func dataBind(_ data: LiveModel) {
        imageView.image = data.image
        numberLabel.text = String(data.number)
        companyLabel.text = data.company
        titleLabel.text = data.title
        percentLabel.text = data.percentage
    }
}

// MARK: - protocol
extension LiveCell: ViewConfigurable {
    func setStyle() {
        numberLabel.do {
            $0.textColor = .white
            $0.font = .italicSystemFont(ofSize: 19)
        }
        
        companyLabel.do {
            $0.textColor = .white
            $0.font = .font(.pretendardMedium, ofSize: 10)
        }
        
        titleLabel.do {
            $0.textColor = .gray2
            $0.font = .font(.pretendardLight, ofSize: 10)
        }
        
        percentLabel.do {
            $0.textColor = .gray2
            $0.font = .font(.pretendardLight, ofSize: 10)
        }
    }
    
    func setHierarchy() {
        contentView.addSubViews(
            imageView,
            numberLabel,
            companyLabel,
            titleLabel,
            percentLabel
        )
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        numberLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(6)
        }
        
        companyLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalTo(numberLabel.snp.trailing).offset(5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(companyLabel.snp.bottom)
            $0.leading.equalTo(numberLabel.snp.trailing).offset(5)
        }
        
        percentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(numberLabel.snp.trailing).offset(5)
        }
    }
}
