//
//  CompositionalLayoutProvider.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/03/08.
//

import UIKit

protocol CompositionalLayoutProvider {

    ///Layout Group을 만들때 필요한 Item을 생성하는 함수입니다.
    func getLayoutItem() -> NSCollectionLayoutItem

    ///Layout Section을 만들때 필요한 Gruop을 생성하는 함수입니다.
    func getLayoutGroup() -> NSCollectionLayoutGroup

    ///Compositional Layout을 만들때 필요한 Section을 생성하는 함수입니다.
    func getLayoutSection() -> NSCollectionLayoutSection

}
