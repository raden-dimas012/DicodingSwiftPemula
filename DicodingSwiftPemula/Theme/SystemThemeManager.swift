//
//  SystemThemeManager.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 27/09/21.
//

import Foundation
import UIKit


class SystemThemeManager{
    static let shared = SystemThemeManager()
    
    func handleTheme(darkMode:Bool,systemMode:Bool) {
        guard !systemMode else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
            return
        }
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
}
