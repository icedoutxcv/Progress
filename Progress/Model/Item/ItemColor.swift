//
//  Color.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import Foundation
import UIKit

enum Color: String {
    case blue, green, indigo, orange, pink, purple, red, teal, yellow
}

class ItemColor {
    static func stringColor(from color: Color) -> String {
        switch color {
        case .blue: return "blue"
        case .green: return "green"
        case .indigo: return "indigo"
        case .orange: return "orange"
        case .pink: return "pink"
        case .purple: return "purple"
        case .red: return "red"
        case .teal: return "teal"
        case .yellow: return "yellow"
        }
    }
    
    static func codedString(from string: String) -> String {
        switch string {
        case "blue": return  UIColor.systemBlue.codedString!
        case "green": return UIColor.systemGreen.codedString!
        case "indigo": return UIColor.systemIndigo.codedString!
        case "orange": return  UIColor.systemOrange.codedString!
        case "pink": return UIColor.systemPink.codedString!
        case "purple": return UIColor.systemPurple.codedString!
        case "red": return UIColor.systemRed.codedString!
        case "teal": return UIColor.systemTeal.codedString!
        case "yellow": return UIColor.systemYellow.codedString!
        default:
            return UIColor.systemBlue.codedString!
        }
    }
}
