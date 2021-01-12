//
//  OptionListModel.swift
//  Progress
//
//  Created by xcv on 25/12/2020.
//

import Foundation

struct OptionListModel {
    var colors = [
        OptionCellModel(title: ItemColor.stringColor(from: .blue)),
        OptionCellModel(title: ItemColor.stringColor(from: .green)),
        OptionCellModel(title: ItemColor.stringColor(from: .indigo)),
        OptionCellModel(title: ItemColor.stringColor(from: .orange)),
        OptionCellModel(title: ItemColor.stringColor(from: .pink)),
        OptionCellModel(title: ItemColor.stringColor(from: .purple)),
        OptionCellModel(title: ItemColor.stringColor(from: .red)),
        OptionCellModel(title: ItemColor.stringColor(from: .teal)),
        OptionCellModel(title: ItemColor.stringColor(from: .yellow))
    ]
    
    var types = [
        OptionCellModel(title: ItemType.audiobook.rawValue),
        OptionCellModel(title: ItemType.ebook.rawValue),
        OptionCellModel(title: ItemType.game.rawValue),
        OptionCellModel(title: ItemType.movie.rawValue),
        OptionCellModel(title: ItemType.book.rawValue)
    ]
    
    func options(option: OptionListType) -> [OptionCellModel] {
        switch option {
        case .colors:
            return colors
        case .type:
            return types
        }
    }
    
    mutating func resetSelectedStatus(type: OptionListType) {
        switch type {
        case .colors:
            colors.mutateEach { $0.isSelected = false}
        case .type:
            types.mutateEach { $0.isSelected = false}
        }
    }
    
    mutating func updateData(selectedOption: String, type: OptionListType) {
        resetSelectedStatus(type: type)
        
        let objects = options(option: type).enumerated()
        
        for (index, object) in objects {
            if object.title == selectedOption {
                switch type {
                case .colors:
                    colors[index].isSelected = true
                case .type:
                    types[index].isSelected = true
                }
            }
        }
    }
}

extension MutableCollection {
    mutating func mutateEach(_ body: (inout Element) throws -> Void) rethrows {
        for index in self.indices {
            try body(&self[index])
        }
    }
}

