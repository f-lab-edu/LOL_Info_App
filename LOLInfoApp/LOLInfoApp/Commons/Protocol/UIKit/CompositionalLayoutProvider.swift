//
//  CompositionalLayoutProvider.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/03/08.
//

import UIKit

protocol CompositionalLayoutProvider {
    /// Compositional Layout을 만들때 필요한 Section을 생성하는 함수입니다.
    func getLayoutSection() -> NSCollectionLayoutSection

    /// SectionHeader를 생성하는 함수입니다.
    func getSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem

    /// Layout Section을 만들때 필요한 Gruop을 생성하는 함수입니다.
    func getLayoutGroup() -> NSCollectionLayoutGroup

    /// Layout Group을 만들때 필요한 Item을 생성하는 함수입니다.
    func getLayoutItem() -> NSCollectionLayoutItem
}
