//
//  Units.swift
//  Progress
//
//  Created by xcv on 17/01/2021.
//

import Foundation

class Units {
    static let minutes = ProgressUnit.minutes
    static let pages = ProgressUnit.pages
    static let levels = ProgressUnit.levels
    static let episodes = ProgressUnit.episodes
    static let seasons = ProgressUnit.seasons
    static let other = ProgressUnit.other
    
    static let items = [
        ProgressUnit.minutes,
        ProgressUnit.pages,
        ProgressUnit.levels,
        ProgressUnit.episodes,
        ProgressUnit.seasons,
        ProgressUnit.other
    ]
}

enum ProgressUnit: String {
    case minutes = "minutes"
    case pages = "pages"
    case levels = "levels"
    case episodes = "episodes"
    case seasons = "seasons"
    case other = "other"
}

enum Title {
    case add, edit
}
