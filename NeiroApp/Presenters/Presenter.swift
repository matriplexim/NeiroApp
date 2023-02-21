//
//  Presenter.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 17.02.2023.
//

import Foundation
import UIKit

protocol PresenterDelegate {
    func showUsers(data: GiphyResponse)
}

class Presenter {
    
    let gifRepository = GifRepository()
    
    var delegate: PresenterDelegate?
    
    func fetchData() {
        gifRepository.getData { [weak self] data in
            self?.delegate?.showUsers(data: data)
        }
    }
}
