//
//  CustomCompositionalLayout.swift
//  TVING
//
//  Created by 최주리 on 5/1/25.
//

import UIKit

struct CustomCompositionalLayout {
    static func createLayout() -> UICollectionViewCompositionalLayout  {
        return UICollectionViewCompositionalLayout { (sectionNumber, _ environment) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0: mainMovieSection
            case 1: todaySection
            case 2: todaySection
            case 3: todaySection
            case 4: todaySection
            case 5: todaySection
            default: todaySection
            }
        }
    }
    
    static var mainMovieSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(580)
            ),
            subitems: [item]
        )
    
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    static var todaySection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets.leading = 10
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .absolute(146)
            ),
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(30)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

#Preview {
    MainViewController()
}
