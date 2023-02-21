//
//  CustomTopTabItem.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 21.02.2023.
//

import UIKit

enum CustomTopTabItem: String, CaseIterable {
    case trendings = "Trendings"
    case artists = "Artists"
    case clips = "Clips"
    case stories = "Stories"
    case stickers = "Stickers"
    
    var viewController: UIViewController {
        switch self {
        case .trendings:
            return MainVC()
        case .artists:
            return ArtistsVC()
        case .clips:
            return ClipsVC()
        case .stories:
            return StoriesVC()
        case .stickers:
            return StickersVC()
        }
    }
    
    var displayTitle: String {
        return self.rawValue//(with: nil)
    }
}

