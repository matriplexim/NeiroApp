//
//  CustomTBC.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 21.02.2023.
//

import UIKit

class CustomTBC: UITabBarController {
    
    var customTapBar: TabNavigationMenu!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ClearColor")!
        loadTapBar()
    }
    
    func loadTapBar() {
        let tabItems: [CustomTabItem] = [.main, .search, .person]
        self.setupCustomTabMenu(items: tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        self.selectedIndex = 0
    }
    
    func setupCustomTabMenu(items: [CustomTabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        
        tabBar.isHidden = true
        self.customTapBar = TabNavigationMenu(menuItems: items, frame: frame)
        self.customTapBar.translatesAutoresizingMaskIntoConstraints = false
        self.customTapBar.clipsToBounds = true
        self.customTapBar.itemTapped = self.changeTab
        
        self.view.addSubview(customTapBar)
        
        NSLayoutConstraint.activate([
            self.customTapBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            self.customTapBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            self.customTapBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            self.customTapBar.heightAnchor.constraint(equalToConstant: 150),
            self.customTapBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
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
