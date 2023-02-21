//
//  GradientView.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 19.02.2023.
//

import UIKit

class GradientView: UIView {
    
    let button    = UIButton(type: .system)
    let homeImg   = UIImageView()
    let searchImg = UIImageView()
    let personImg = UIImageView()
    let homeTag   = UIView()
    let searchTag = UIView()
    let personTag = UIView()
    let homeBtn   = UIButton()
    let searchBtn = UIButton()
    let personBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configGradient() {
        layer.addSublayer(createGradient(firstColor: UIColor(named: "ClearColor")!, secondColor: UIColor.black, frame: bounds))
        
        addSubview(homeImg)
        addSubview(searchImg)
        addSubview(personImg)
        
        addSubview(homeTag)
        addSubview(searchTag)
        addSubview(personTag)
        
        homeImg.image   = UIImage(systemName: "house")
        searchImg.image = UIImage(systemName: "magnifyingglass")
        personImg.image = UIImage(systemName: "person")
        
        homeImg.tintColor   = .blue
        searchImg.tintColor = .red
        personImg.tintColor = .yellow
        
        homeTag.backgroundColor   = .blue
        searchTag.backgroundColor = .clear
        personTag.backgroundColor = .clear
        
        homeTag.layer.cornerRadius   = 5
        searchTag.layer.cornerRadius = 5
        personTag.layer.cornerRadius = 5
        
        addSubview(homeBtn)
        addSubview(searchBtn)
        addSubview(personBtn)
        
        homeBtn.tag   = 1
        searchBtn.tag = 2
        personBtn.tag = 3
        
        homeBtn.addTarget(self, action: #selector(onTapHomeBtn), for: .touchUpInside)
        searchBtn.addTarget(self, action: #selector(onTapSearchBtn), for: .touchUpInside)
        personBtn.addTarget(self, action: #selector(onTapPersonBtn), for: .touchUpInside)
        
        homeImg.translatesAutoresizingMaskIntoConstraints   = false
        searchImg.translatesAutoresizingMaskIntoConstraints = false
        personImg.translatesAutoresizingMaskIntoConstraints = false
        
        homeTag.translatesAutoresizingMaskIntoConstraints   = false
        searchTag.translatesAutoresizingMaskIntoConstraints = false
        personTag.translatesAutoresizingMaskIntoConstraints = false
        
        homeBtn.translatesAutoresizingMaskIntoConstraints   = false
        searchBtn.translatesAutoresizingMaskIntoConstraints = false
        personBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchImg.widthAnchor.constraint(equalToConstant: 40),
            searchImg.heightAnchor.constraint(equalToConstant: 40),
            searchImg.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            searchImg.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            homeImg.widthAnchor.constraint(equalToConstant: 40),
            homeImg.heightAnchor.constraint(equalToConstant: 40),
            homeImg.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            homeImg.trailingAnchor.constraint(equalTo: searchImg.leadingAnchor, constant: -70),
            
            personImg.widthAnchor.constraint(equalToConstant: 40),
            personImg.heightAnchor.constraint(equalToConstant: 40),
            personImg.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            personImg.leadingAnchor.constraint(equalTo: searchImg.trailingAnchor, constant: 70),
            
            searchTag.widthAnchor.constraint(equalToConstant: 10),
            searchTag.heightAnchor.constraint(equalToConstant: 10),
            searchTag.topAnchor.constraint(equalTo: searchImg.bottomAnchor, constant: 10),
            searchTag.centerXAnchor.constraint(equalTo: searchImg.centerXAnchor),
            
            homeTag.widthAnchor.constraint(equalToConstant: 10),
            homeTag.heightAnchor.constraint(equalToConstant: 10),
            homeTag.topAnchor.constraint(equalTo: homeImg.bottomAnchor, constant: 10),
            homeTag.centerXAnchor.constraint(equalTo: homeImg.centerXAnchor),
            
            personTag.widthAnchor.constraint(equalToConstant: 10),
            personTag.heightAnchor.constraint(equalToConstant: 10),
            personTag.topAnchor.constraint(equalTo: personImg.bottomAnchor, constant: 10),
            personTag.centerXAnchor.constraint(equalTo: personImg.centerXAnchor),
            
            homeBtn.topAnchor.constraint(equalTo: homeImg.topAnchor),
            homeBtn.leadingAnchor.constraint(equalTo: homeImg.leadingAnchor),
            homeBtn.trailingAnchor.constraint(equalTo: homeImg.trailingAnchor),
            homeBtn.bottomAnchor.constraint(equalTo: homeImg.bottomAnchor),
            
            searchBtn.topAnchor.constraint(equalTo: searchImg.topAnchor),
            searchBtn.leadingAnchor.constraint(equalTo: searchImg.leadingAnchor),
            searchBtn.trailingAnchor.constraint(equalTo: searchImg.trailingAnchor),
            searchBtn.bottomAnchor.constraint(equalTo: searchImg.bottomAnchor),
            
            personBtn.topAnchor.constraint(equalTo: personImg.topAnchor),
            personBtn.leadingAnchor.constraint(equalTo: personImg.leadingAnchor),
            personBtn.trailingAnchor.constraint(equalTo: personImg.trailingAnchor),
            personBtn.bottomAnchor.constraint(equalTo: personImg.bottomAnchor)
        ])
    }
    
    private func createGradient(firstColor: UIColor, secondColor: UIColor, frame: CGRect) -> CAGradientLayer {
        let gradient    = CAGradientLayer()
        gradient.frame  = frame
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        return gradient
    }
    
    @objc func onTapHomeBtn() {
        let sender = self.homeBtn
        let tag = sender.tag
        print(tag)
    }
    
    @objc func onTapSearchBtn() {
        let sender = self.searchBtn
        let tag = sender.tag
        print(tag)
    }
    
    @objc func onTapPersonBtn() {
        let sender = self.personBtn
        let tag = sender.tag
        print(tag)
    }
    
}
