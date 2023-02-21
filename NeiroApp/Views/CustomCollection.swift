//
//  CustomCollection.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 17.02.2023.
//

import UIKit

class CustomCollection: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        customCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCollection() {
        self.frame = .zero
        self.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        self.backgroundColor = .black
        self.showsVerticalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
