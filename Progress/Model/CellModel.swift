//
//  PreferenceCellModel.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import Foundation
import UIKit

enum OptionListType {
    case colors
    case type
}

struct OptionCellModel {
    let title: String
    var isSelected: Bool

    init(title: String, isSelected: Bool = false) {
        self.title = title
        self.isSelected = isSelected
    }
}

struct CellModel {
    let icon: UIImage
    var title: String
    var subtitle: String
    let type: CellType
    
    enum CellType {
        case title
        case colors
        case types
    }
        
    init(icon: UIImage, title: String, subtitle: String, type: CellType, isSelected: Bool = false) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}
