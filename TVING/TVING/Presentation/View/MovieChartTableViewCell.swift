//
//  MovieChartTableViewCell.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import UIKit

final class MovieChartTableViewCell: UITableViewCell, ReuseIdentifiable {
    
    // MARK: - UI Properties
    private let titleLabel = UILabel()
    private let rankLabel = UILabel()
    private let openDateLabel = UILabel()
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieChartTableViewCell {
    func dataBind(_ movie: Movie) {
        titleLabel.text = movie.name
        rankLabel.text = movie.rank
        openDateLabel.text = movie.openDate
    }
}

// MARK: - Protocol
extension MovieChartTableViewCell: ViewConfigurable {
    func setStyle() {
        titleLabel.do {
            $0.font = .font(.pretendardSemiBold, ofSize: 20)
            $0.textColor = .black
        }
        
        rankLabel.do {
            $0.font = .font(.pretendardBold, ofSize: 26)
            $0.textColor = .black
        }
        
        openDateLabel.do {
            $0.font = .font(.pretendardLight, ofSize: 16)
            $0.textColor = .black
        }
        
    }
    
    func setHierarchy() {
        contentView.addSubViews(
            titleLabel,
            rankLabel,
            openDateLabel
        )
    }
    
    func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
        }
        
        openDateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
        }
    }
}
