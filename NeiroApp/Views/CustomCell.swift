//
//  CustomCell.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 17.02.2023.
//

import UIKit
import SDWebImage

class CustomCell: UICollectionViewCell {
    
    let colors: [UIColor] = [.cyan, .systemIndigo, .systemPink]
    let cellView = UIView()
    let imageView = SDAnimatedImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI(frame: CGRect) {
        addSubview(cellView)
        cellView.backgroundColor = colors.randomElement()
        cellView.layer.cornerRadius = 5
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: cellView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor)
        ])
    }
}

