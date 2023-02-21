//
//  CustomTopTBC.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 21.02.2023.
//

import UIKit

class CustomTopTBC: UITabBarController {
    
    let scrollView = UIScrollView()
    let hstack = UIStackView()
    var customTapBar: TopTabNavigationMenu!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loadTapBar()
    }
    
    func loadTapBar() {
        let tabItems: [CustomTopTabItem] = [.trendings, .artists, .clips, .stories, .stickers]
        self.setupCustomTabMenu(items: tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        self.selectedIndex = 0
    }
    
    func setupCustomTabMenu(items: [CustomTopTabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        
        tabBar.isHidden = true
        self.customTapBar = TopTabNavigationMenu(menuItems: items, frame: frame)
        self.customTapBar.translatesAutoresizingMaskIntoConstraints = false
        self.customTapBar.clipsToBounds = true
        self.customTapBar.itemTapped = self.changeTab
        
        self.view.addSubview(customTapBar)
        
        NSLayoutConstraint.activate([
            self.customTapBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.customTapBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.customTapBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            self.customTapBar.heightAnchor.constraint(equalToConstant: 100),
            self.customTapBar.topAnchor.constraint(equalTo: self.view.topAnchor)
        ])
        for i in 0 ..< items.count {
            controllers.append(items[i].viewController)
        }
        self.view.layoutIfNeeded()
        completion(controllers)
    }
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
}

