//
//  MainView.swift
//  TVING
//
//  Created by 최주리 on 4/30/25.
//

import SwiftUI

enum Category: CaseIterable {
    case home
    case drama
    case enter
    case movie
    case sports
    case news
    
    var title: String {
        switch self {
        case .home:
            "홈"
        case .drama:
            "드라마"
        case .enter:
            "예능"
        case .movie:
            "영화"
        case .sports:
            "스포츠"
        case .news:
            "뉴스"
        }
    }
}

final class MainView: UIView {
    
    // MARK: - properties
    private let logoImageView = UIImageView()
    private let searchButton = UIButton()
    private let profileButton = UIButton()
    
    private let categoryStackView = UIStackView()
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: CustomCompositionalLayout.createLayout()
    )
      
    // MARK: - init
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

extension MainView {
    private func setCategories() {
        Category.allCases.forEach { category in
            let categoryView = CategoryTitleView()
            categoryView.dataBind(category.title, selected: category == .home)
            categoryStackView.addArrangedSubview(categoryView)
        }
    }
}

// MARK: - protocol
extension MainView: ViewConfigurable {
    func setStyle() {
        backgroundColor = .black
        
        logoImageView.do {
            $0.image = .logoText
        }
        
        searchButton.do {
            $0.setImage(.search, for: .normal)
        }
        
        profileButton.do {
            $0.setImage(.profile, for: .normal)
        }
        
        categoryStackView.do {
            $0.axis = .horizontal
            $0.spacing = 28
            $0.distribution = .equalSpacing
        }
        
        setCategories()
        
        collectionView.do {
            $0.backgroundColor = .black
        }
    }
    
    func setHierarchy() {
        addSubViews(
            logoImageView,
            searchButton,
            profileButton,
            categoryStackView,
            collectionView
        )
    }
    
    func setLayout() {
        let safeArea = self.safeAreaLayoutGuide
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.leading.equalToSuperview()
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(24)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(24)
            $0.trailing.equalTo(profileButton.snp.leading).offset(-10)
        }
        
        categoryStackView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(18)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(categoryStackView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeArea)
        }
    }
}

fileprivate final class CategoryTitleView: UIView {
    let titleLabel = UILabel()
    let underLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.do {
            $0.font = .font(.pretendardLight, ofSize: 17)
            $0.textColor = .white
        }
        
        underLine.do {
            $0.backgroundColor = .white
        }
        
        addSubViews(titleLabel, underLine)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        underLine.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(titleLabel)
            $0.height.equalTo(3)
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataBind(_ title: String, selected: Bool) {
        titleLabel.text = title
        underLine.isHidden = !selected
    }
}

#Preview {
    MainViewController()
}
