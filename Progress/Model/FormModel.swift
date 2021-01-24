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
    var progress = CellModel(type: .textFields, textFieldFirst: "", textFieldSecond: "")

    func models() -> [CellModel] {
        return [title, colors, types,  progress]
    }
}

struct GalleryModel {
    var objects: [DataSourceObject] = []
}
