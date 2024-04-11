//
//  ChampionMainCollectionViewLayoutFactory.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/03/29.
//

import UIKit

struct ChampionMainCollectionViewLayoutFactory {
    typealias SectionType = ChampionMainCollectionViewSectionType

    func createLayout(sectionType: SectionType) -> NSCollectionLayoutSection {
        if sectionType == .mainList {
            return ChampionMainListLayoutProvider().getLayoutSection()
        } else {
            return ChampionMainFavoriteListLayoutProvider().getLayoutSection()
        }
    }
}
