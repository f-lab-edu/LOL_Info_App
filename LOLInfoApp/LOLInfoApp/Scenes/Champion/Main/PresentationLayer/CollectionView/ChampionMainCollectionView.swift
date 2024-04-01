//
//  ChampionMainCollectionView.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/28.
//

import UIKit

final class ChampionMainCollectionView: UICollectionView {

    // MARK: - typealias

    typealias SectionType = ChampionMainCollectionViewSectionType

    // MARK: - LifeCycle

    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        setCompositionalLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout Function

extension ChampionMainCollectionView {
    private func setCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { (section, _) in
            let sectionType = SectionType(rawValue: section) ?? .favoriteList
            let layoutFactory = ChampionMainCollectionViewLayoutFactory()
            return layoutFactory.createLayout(sectionType: sectionType)
        }
        setCollectionViewLayout(layout, animated: true)
    }
}
