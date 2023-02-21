//
//  TopTabNavigationMenu.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 21.02.2023.
//

import UIKit

class TopTabNavigationMenu: UIView {
    
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(menuItems: [CustomTopTabItem], frame: CGRect) {
        self.init(frame: frame)
        self.layer.backgroundColor = UIColor.black.cgColor
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)
            
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            itemView.tag = i
            self.addSubview(itemView)
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                //itemView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
            ])
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0)
    }
    
    func createTabItem(item: CustomTopTabItem) -> UIView {
        let tabBarItem = UIView(frame: .zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        
        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.textColor = .white
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        
        tabBarItem.layer.backgroundColor = UIColor.red.cgColor
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
        NSLayoutConstraint.activate([
                itemTitleLabel.heightAnchor.constraint(equalToConstant: 30),
                //itemTitleLabel.widthAnchor.constraint(equalToConstant: tabBarItem.bounds.width * 20),
                itemTitleLabel.widthAnchor.constraint(equalTo: tabBarItem.widthAnchor),
                itemTitleLabel.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 60),
            ])
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap)))
        return tabBarItem
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    func activateTab(tab: Int) {
        let tabToActivate = self.subviews[tab]
        let borderLayer = CALayer()
        var borderColor = UIColor()
        switch tab {
        case 0:
            borderColor = .blue
        case 1:
            borderColor = .blue
        default:
            borderColor = .yellow
        }
        borderLayer.backgroundColor = borderColor.cgColor
        borderLayer.cornerRadius = 5
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                tabToActivate.layer.addSublayer(borderLayer)
                tabToActivate.setNeedsLayout()
                tabToActivate.layoutIfNeeded()
            })
            self.itemTapped?(tab)
        }
        self.activeItem = tab
    }
    func deactivateTab(tab: Int) {
        let inactiveTab = self.subviews[tab]
        let layersToRemove = inactiveTab.layer.sublayers!.filter({ $0.name == "active border" })
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                layersToRemove.forEach({ $0.removeFromSuperlayer() })
                inactiveTab.setNeedsLayout()
                inactiveTab.layoutIfNeeded()
            })
        }
    }
    
}
