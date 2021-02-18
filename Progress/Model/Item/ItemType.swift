//
//  ItemType.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import Foundation

enum ItemType: String {
    case movie = "movie"
    case book = "book"
    case ebook = "ebook"
    case game = "game"
    case audiobook = "audiobook"
    case other = "other"

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
        case "other": return .other
        default:
            return .other
        }
    }
}
