//
//  ParisCafeTab.swift
//  DeepLinkPractice1
//
//  Created by 강성찬 on 2024-06-27.
//

import Foundation

enum ParisCafeTab {
    case home, search, setting
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .setting:
            return "Setting"
        }
    }
}
