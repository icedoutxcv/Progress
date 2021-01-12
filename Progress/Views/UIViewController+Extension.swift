//
//  UIViewController+Extension.swift
//  Progress
//
//  Created by xcv on 09/01/2021.
//

import Foundation
import UIKit

extension UIViewController {
    var isDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }

}
