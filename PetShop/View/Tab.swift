//
//  Tab.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/6/4.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case diary = "diary"
    case calendar = "Calendar"
    case setting = "Setting"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .diary:
            return "dog"
        case .calendar:
            return "calendar.badge.clock"
        case .setting:
            return "person.fill"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
