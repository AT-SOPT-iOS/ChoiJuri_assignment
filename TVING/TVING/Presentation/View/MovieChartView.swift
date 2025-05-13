//
//  MovieChartView.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import UIKit

final class MovieChartView: UIView {
    
    //MARK: - UI Properties
    private let titleLabel = UILabel()
    let movieTableView = UITableView()
    
    //MARK: - Initializer
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

//MARK: - Protocol
extension MovieChartView: ViewConfigurable {
    func setStyle() {
        backgroundColor = .white
        
        titleLabel.do {
            $0.text = "오늘의 영화"
            $0.textColor = .gray5
            $0.font = .font(.pretendardBold, ofSize: 20)
        }
    }
    
    func setHierarchy() {
        self.addSubViews(titleLabel, movieTableView)
    }
    
    func setLayout() {
        let safeArea = self.safeAreaLayoutGuide
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.horizontalEdges.equalToSuperview().inset(50)
        }
        
        movieTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
