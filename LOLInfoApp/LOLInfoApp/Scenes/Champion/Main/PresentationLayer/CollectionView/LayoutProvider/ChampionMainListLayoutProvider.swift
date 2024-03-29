//
//  ChampionMainListLayoutProvider.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/03/08.
//
// swiftlint:disable nesting

import UIKit

// MARK: - Literal

struct ChampionMainListLayoutProvider {

    private enum Metric {
        enum Item {
            static let size = 1.0
            static let topAndBottom = 0.0
            static let side = 16.0
        }

        enum Group {
            static let width = 1.0
            static let height = 70.0
        }

        enum Section {
            static let top = 0.0
            static let side = 0.0
            static let bottom = 8.0
        }

        enum Header {
            static let width = 1.0
            static let height = 50.0
        }
    }

}

// MARK: - Layout Function

extension ChampionMainListLayoutProvider: CompositionalLayoutProvider {
    func getLayoutItem() -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.Item.size),
            heightDimension: .fractionalHeight(Metric.Item.size)
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
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metric.Group.width),
            heightDimension: .estimated(Metric.Group.height)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        return group
    }

    func getLayoutSection() -> NSCollectionLayoutSection {
        let group = getLayoutGroup()
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.Section.top,
            leading: Metric.Section.side,
            bottom: Metric.Section.bottom,
            trailing: Metric.Section.side
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
