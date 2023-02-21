//
//  CustomTabItem.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 21.02.2023.
//

import UIKit

enum CustomTabItem: String, CaseIterable {
    case main = "main"
    case search = "search"
    case person = "person"
    
    var viewController: UIViewController {
        switch self {
        case .main:
            return CustomTopTBC()
        case .search:
            return SearchVC()
        case .person:
            return PersonVC()
        }
    }
    
    var icon: UIImage {
        switch self {
        case .main:
            return UIImage(systemName: "house")!
        case .search:
            return UIImage(systemName: "magnifyingglass")!
        case .person:
            return UIImage(systemName: "person")!
        }
    }
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
    
    var color: UIColor {
        switch self {
        case .main:
            return .blue
        case .search:
            return .red
        case .person:
            return .yellow
        }
    }
}
