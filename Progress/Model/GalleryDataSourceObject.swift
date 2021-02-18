//
//  DataSourceObject.swift
//  Progress
//
//  Created by xcv on 29/11/2020.
//

import Foundation

class GalleryDataSourceObject {
    var sectionName: ItemType
    var items: [Item] = []
    
    init(sectionName: ItemType, items: [Item]) {
        self.sectionName = sectionName
        self.items = items
    }
}

