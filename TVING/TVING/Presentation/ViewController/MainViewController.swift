//
//  MainViewController.swift
//  TVING
//
//  Created by 최주리 on 4/30/25.
//

import UIKit

enum MainSection: Int, CaseIterable {
    case main = 0
    case today
    case live
    case advertise
    case sports
}

final class MainViewController: UIViewController {
    
    private let todayList = TodayModel.mock()
    private let liveList = LiveModel.mock()
    private let sportsList = SportsModel.mock()
    
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
            TodayCell.self,
            forCellWithReuseIdentifier: TodayCell.identifier
        )
        rootView.collectionView.register(
            MainImageCell.self,
            forCellWithReuseIdentifier: MainImageCell.identifier
        )
        rootView.collectionView.register(
            LiveCell.self,
            forCellWithReuseIdentifier: LiveCell.identifier
        )
        rootView.collectionView.register(
            AdvertiseCell.self,
            forCellWithReuseIdentifier: AdvertiseCell.identifier
        )
        rootView.collectionView.register(
            SportsBoxCell.self,
            forCellWithReuseIdentifier: SportsBoxCell.identifier
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
        case .live:
            return liveList.count
        case .advertise:
            return 1
        case .sports:
            return sportsList.count
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
                withReuseIdentifier: TodayCell.identifier,
                for: indexPath
            ) as? TodayCell
            else { return UICollectionViewCell() }
            cell.dataBind(todayList[indexPath.row])
            
            return cell
        case .live:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LiveCell.identifier,
                for: indexPath
            ) as? LiveCell
            else { return UICollectionViewCell() }
            cell.dataBind(liveList[indexPath.row])
            
            return cell
        case .advertise:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdvertiseCell.identifier,
                for: indexPath
            ) as? AdvertiseCell
            else { return UICollectionViewCell() }
            
            return cell
        case .sports:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SportsBoxCell.identifier,
                for: indexPath
            ) as? SportsBoxCell
            else { return UICollectionViewCell() }
            cell.dataBind(sportsList[indexPath.row])
            
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
            case .live:
                headerView.dataBind("실시간 인기 LIVE", hasButton: true)
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
