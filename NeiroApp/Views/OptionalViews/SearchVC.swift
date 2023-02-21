//
//  SearchVC.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 20.02.2023.
//

import UIKit

class SearchVC: UIViewController {
    
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .red
        view.addSubview(titleLabel)
        titleLabel.text = "Search View Controller"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
