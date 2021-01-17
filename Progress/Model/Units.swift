//
//  Units.swift
//  Progress
//
//  Created by xcv on 17/01/2021.
//

import Foundation

struct Units {
   static let items = [
        ProgressUnit(name: "minutes"),
        ProgressUnit(name: "pages"),
        ProgressUnit(name: "levels"),
        ProgressUnit(name: "episodes"),
        ProgressUnit(name: "seasons"),
        ProgressUnit(name: "other unit")
    ]
}

struct ProgressUnit {
    let name: String
}
