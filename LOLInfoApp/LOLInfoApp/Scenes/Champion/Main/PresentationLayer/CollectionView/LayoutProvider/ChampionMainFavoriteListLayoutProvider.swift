//
//  ChampionMainFavoriteListLayoutProvider.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/03/08.
//
// swiftlint:disable nesting

import UIKit

// MARK: - Literal

struct ChampionMainFavoriteListLayoutProvider {

    private enum Metric {
        enum Item {
            static let size = 1.0
            static let topAndBottom = 0.0
            static let side = 16.0
        }

        enum Group {
            static let size = 100.0
        }

        enum Section {
            static let inset = 0.0
            static let bottom = 15.0
        }

        enum Header {
            static let width = 1.0
            static let height = 50.0
        }
    }

}

// MARK: - Layout Function

extension ChampionMainFavoriteListLayoutProvider: CompositionalLayoutProvider {

    func getLayoutItem() -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.Item.size),
            heightDimension: .estimated(Metric.Item.size)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.Item.topAndBottom,
            leading: Metric.Item.side,
            bottom: Metric.Item.topAndBottom,
            trailing: Metric.Item.side
        )
        return item
    }

    func getLayoutGroup() -> NSCollectionLayoutGroup {
        let item = getLayoutItem()
        let grupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(Metric.Group.size),
            heightDimension: .estimated(Metric.Group.size)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: grupSize,
            subitems: [item]
        )
        return group
    }

    func getLayoutSection() -> NSCollectionLayoutSection {
        let group = getLayoutGroup()
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.Section.inset,
            leading: Metric.Section.inset,
            bottom: Metric.Section.bottom,
            trailing: Metric.Section.inset
        )
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.Header.width),
            heightDimension: .estimated(Metric.Header.height)
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

// swiftlint:enable nesting
