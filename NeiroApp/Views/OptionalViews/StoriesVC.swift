//
//  StoriesVC.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 21.02.2023.
//

import UIKit

class StoriesVC: UIViewController {
    
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .red
        view.addSubview(titleLabel)
        titleLabel.text = "Stories View Controller"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
