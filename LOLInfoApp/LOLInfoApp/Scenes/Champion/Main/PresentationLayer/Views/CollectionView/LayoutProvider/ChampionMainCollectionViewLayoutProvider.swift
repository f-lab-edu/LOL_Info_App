//
//  ChampionMainCollectionViewLayoutProvider.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/24.
//

import UIKit

struct ChampionMainCollectionViewLayoutProvider {
    
    // MARK: - Literal
    
    private enum Metric {
        static let basePadding: CGFloat = 8
        static let favoriteItemSize: CGFloat = 1
        static let favoriteItemTopAndBottom: CGFloat = 0
        static let favoriteGroupSize: CGFloat = 100
        static let favoriteSectionToAndBottom: CGFloat = 0
        static let mainItemSize: CGFloat = 1
        static let mainItemTop: CGFloat = 8
        static let mainItemBottom: CGFloat = 0
        static let mainGroupWidth: CGFloat = 1
        static let mainGroupHeight: CGFloat = 70
        static let mainSectionTop: CGFloat = 0
        static let mainSectionBottom: CGFloat = 8
    }
    
    // MARK: - Layout Function
    
    func favoriteSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.favoriteItemSize),
            heightDimension: .estimated(Metric.favoriteItemSize)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.favoriteItemTopAndBottom,
            leading: Metric.basePadding,
            bottom: Metric.favoriteItemTopAndBottom,
            trailing: Metric.basePadding
        )
        
        let grupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(Metric.favoriteGroupSize),
            heightDimension: .estimated(Metric.favoriteGroupSize)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: grupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.favoriteSectionToAndBottom,
            leading: Metric.basePadding,
            bottom: Metric.favoriteSectionToAndBottom,
            trailing: Metric.basePadding
        )
        return section
    }
    
    func mainListSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.mainItemSize),
            heightDimension: .fractionalHeight(Metric.mainItemSize)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.mainItemTop,
            leading: Metric.basePadding,
            bottom: Metric.mainItemBottom,
            trailing: Metric.basePadding
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.mainGroupWidth),
            heightDimension: .estimated(Metric.mainGroupHeight)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.mainSectionTop,
            leading: Metric.basePadding,
            bottom: Metric.mainSectionBottom,
            trailing: Metric.basePadding
        )
        return section
    }
}
