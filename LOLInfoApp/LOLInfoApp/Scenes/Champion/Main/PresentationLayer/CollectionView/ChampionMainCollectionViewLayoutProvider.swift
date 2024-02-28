//
//  ChampionMainCollectionViewLayoutProvider.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/02/28.
//

import UIKit

struct ChampionMainCollectionViewLayoutProvider {
    
    // MARK: - typealias
    
    typealias SectionType = ChampionMainCollectionView.SectionType
    
    // MARK: - Literal
    
    private enum Metric {
        static let baseSide: CGFloat = 16
        static let sectionHeaderWidth: CGFloat = 1
        static let sectionHeaderHeight: CGFloat = 50
        
        static let favoriteItemSize: CGFloat = 1
        static let favoriteItemTopAndBottom: CGFloat = 0
        static let favoriteGroupSize: CGFloat = 100
        static let favoriteSectionInset: CGFloat = 0
        static let favoriteSectionBottom: CGFloat = 15
        
        static let mainItemSize: CGFloat = 1
        static let mainItemTopAndBottom: CGFloat = 0
        static let mainGroupWidth: CGFloat = 1
        static let mainGroupHeight: CGFloat = 70
        static let mainSectionTop: CGFloat = 0
        static let mainSectionSide: CGFloat = 0
        static let mainSectionBottom: CGFloat = 8
    }
    
    // MARK: - Get Layout Function
    
    func getLayout(sectionType: SectionType) -> NSCollectionLayoutSection {
        sectionType == .favoriteList ? favoriteListSectionLayout() : mainListSectionLayout()
    }
    
    // MARK: - Helper Function
    
    private func favoriteListSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.favoriteItemSize),
            heightDimension: .estimated(Metric.favoriteItemSize)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.favoriteItemTopAndBottom,
            leading: Metric.baseSide,
            bottom: Metric.favoriteItemTopAndBottom,
            trailing: Metric.baseSide
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
            top: Metric.favoriteSectionInset,
            leading: Metric.favoriteSectionInset,
            bottom: Metric.favoriteSectionBottom,
            trailing: Metric.favoriteSectionInset
        )
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.sectionHeaderWidth),
            heightDimension: .estimated(Metric.sectionHeaderHeight)
        )
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: sectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
    
    private func mainListSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.mainItemSize),
            heightDimension: .fractionalHeight(Metric.mainItemSize)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.mainItemTopAndBottom,
            leading: Metric.baseSide,
            bottom: Metric.mainItemTopAndBottom,
            trailing: Metric.baseSide
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
            leading: Metric.mainSectionSide,
            bottom: Metric.mainSectionBottom,
            trailing: Metric.mainSectionSide
        )
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.sectionHeaderWidth),
            heightDimension: .estimated(Metric.sectionHeaderHeight)
        )
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: sectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
}
