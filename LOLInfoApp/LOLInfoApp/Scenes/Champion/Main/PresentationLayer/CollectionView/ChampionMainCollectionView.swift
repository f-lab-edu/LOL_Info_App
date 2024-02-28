//
//  ChampionMainCollectionView.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/28.
//

import UIKit

final class ChampionMainCollectionView: UICollectionView {
    
    // MARK: - SectionType
    
    enum SectionType: Int  {
        case favoriteList
        case mainList
    }
    
    // MARK: - LifeCycle
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        setCompositionalLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Function
    
    private func setCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { (section, _) in
            let sectionType = SectionType(rawValue: section) ?? .favoriteListSection
            let layoutProvider = ChampionMainCollectionViewLayoutProvider()
            return layoutProvider.getLayout(sectionType: sectionType)
        }
        setCollectionViewLayout(layout, animated: true)
    }
    
}
