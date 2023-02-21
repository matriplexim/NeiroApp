//
//  SecondVC.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 17.02.2023.
//

import UIKit
import SDWebImage

class ExportVC: UIViewController {
    
    var urlImage = ""
    let dismissBtn  = UIButton(type: .system)
    let shareBtn    = UIButton(type: .system)
    let imageView   = SDAnimatedImageView()
    let cancelBtn   = UIButton(type: .system)
    let copyGifBtn  = UIButton(type: .system)
    let copyLinkBtn = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .black
        configDismissBtn()
        configShareBtn()
        configImageView()
        configCancelBtn()
        configGifBtn()
        configLinkBtn()
    }
    
    private func configDismissBtn() {
        view.addSubview(dismissBtn)
        dismissBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissBtn.tintColor = .white
        dismissBtn.addTarget(self, action: #selector(onTapDismissBtn), for: .touchUpInside)
        dismissBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            dismissBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
    
    private func configShareBtn() {
        view.addSubview(shareBtn)
        shareBtn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareBtn.tintColor = .white
        shareBtn.addTarget(self, action: #selector(onTapShareBtn), for: .touchUpInside)
        shareBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shareBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            shareBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    private func configImageView() {
        view.addSubview(imageView)
        imageView.sd_setImage(with: URL(string: urlImage))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: dismissBtn.bottomAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configCancelBtn() {
        
    }
    
    private func configGifBtn() {
        
    }
    
    private func configLinkBtn() {
        
    }
    
    @objc func onTapDismissBtn() {
        self.dismiss(animated: true)
    }
    
    @objc func onTapShareBtn() {
        print("share button tapped")
    }

}
