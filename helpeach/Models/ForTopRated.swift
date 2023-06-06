//
//  ForTopRated.swift
//  helpeach
//
//  Created by Igor Astsatryan on 18.05.23.
//

import Foundation

enum CellModel {
    case collectionView(models: [CollectionTableCellModel], rows: Int)
    case list(models: [ListCellModel])
}

struct ListCellModel {
    let title: String
}

struct CollectionTableCellModel {
    let title: String
    let imageName: String
}
