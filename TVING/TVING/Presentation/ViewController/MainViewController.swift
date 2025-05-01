//
//  MainViewController.swift
//  TVING
//
//  Created by 최주리 on 4/30/25.
//

import UIKit

enum MainSection: Int, CaseIterable {
    case main = 0
    case today = 1
}

final class MainViewController: UIViewController {
    
    private let todayList = TodayModel.mock()
    
    private let rootView = MainView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
    }
}

extension MainViewController {
    private func setDelegate() {
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }
    
    private func setRegister() {
        rootView.collectionView.register(
            TodayCollectionViewCell.self,
            forCellWithReuseIdentifier: TodayCollectionViewCell.identifier
        )
        rootView.collectionView.register(
            MainImageCell.self,
            forCellWithReuseIdentifier: MainImageCell.identifier
        )
        
        rootView.collectionView.register(HeaderViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderViewCell.identifier)
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MainSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = MainSection(rawValue: section) else { return 0 }
        
        switch section {
        case .main:
            return 1
        case .today:
            return todayList.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let section = MainSection(rawValue: indexPath.section)
        else { return UICollectionViewCell() }
        
        switch section {
        case .main:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainImageCell.identifier,
                for: indexPath
            ) as? MainImageCell
            else { return UICollectionViewCell() }
            
            return cell
        case .today:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TodayCollectionViewCell.identifier,
                for: indexPath
            ) as? TodayCollectionViewCell
            else { return UICollectionViewCell() }
            cell.dataBind(todayList[indexPath.row])
            
            return cell
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderViewCell.identifier,
                for: indexPath
            ) as? HeaderViewCell,
            let section = MainSection(rawValue: indexPath.section)
            else { return UICollectionReusableView() }
            
            switch section {
            case .today:
                headerView.dataBind("오늘의 티빙 TOP 20", hasButton: false)
            default:
                break
            }
            
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
}

#Preview {
    MainViewController()
}
