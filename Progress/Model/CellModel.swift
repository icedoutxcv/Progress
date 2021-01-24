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
    var textFieldFirst: String
    var textFieldSecond: String
    let type: CellType
    
    enum CellType {
        case title
        case colors
        case types
        case textFields
    }
        
    init(icon: UIImage = UIImage(), title: String = "", subtitle: String = "", type: CellType, isSelected: Bool = false, textFieldFirst: String = "", textFieldSecond: String = "") {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.textFieldFirst = textFieldFirst
        self.textFieldSecond = textFieldSecond
    }
}
