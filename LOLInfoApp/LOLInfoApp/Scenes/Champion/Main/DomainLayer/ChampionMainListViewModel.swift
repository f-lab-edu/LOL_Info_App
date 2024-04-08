//
//  ChampionMainListViewModel.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/03/10.
//

import Foundation

struct ChampionMainListViewModel {
    let nameAndTitleLabelText: String
    let roleLabelText: String
    let imageURLString: String

    init(entity: ChampionMainListEntity.ChampionMainEntity) {
        nameAndTitleLabelText = "\(entity.name) • \(entity.title)"

        roleLabelText = entity.roleGroup
            .map { $0.rawValue }
            .joined(separator: "\(StringConstants.comma) ")

        let url = Bundle.getURLString(key: .squareImageURL)
        let fileExtend = FileExtendsConstants.png
        imageURLString = "\(url)\(entity.id)\(fileExtend)"
    }
}
