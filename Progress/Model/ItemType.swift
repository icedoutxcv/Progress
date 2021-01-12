//
//  ItemType.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import Foundation

enum ItemType: String {
    case movie
    case book
    case ebook
    case game
    case audiobook 
    case other

    func categoryName() -> String {
        return "\(self)s"
    }
    
    static func getItemType(from rawType: String) -> Self {
        switch rawType {
        case "movie": return .movie
        case "book": return .book
        case "game": return .game
        case "audiobook": return .audiobook
        case "ebook": return .ebook
        default:
            return .other
        }
    }
}
