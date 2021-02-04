//
//  FormModel.swift
//  Progress
//
//  Created by xcv on 25/12/2020.
//

import Foundation
import UIKit

class FormModel {
    var title = CellModel(icon: UIImage(), title: "Name", subtitle: "", type: .title)
    var colors = CellModel(icon: UIImage(systemName: "eyedropper")!, title: "Color", subtitle: ItemColor.stringColor(from: .blue), type: .colors)
    var types = CellModel(icon: UIImage(systemName: "tray")!, title: "Type", subtitle: ItemType.book.rawValue, type: .types)
    var progress = CellModel(subtitle: Units.items[0].name, type: .textFields, textFieldFirst: "", textFieldSecond: "")
    var notes = CellModel(type: .notes, text: "")

    func models() -> [CellModel] {
        return [title, colors, types,  progress, notes]
    }
}

enum FormType {
    case new, old
}

struct GalleryModel {
    var objects: [DataSourceObject] = []
}
