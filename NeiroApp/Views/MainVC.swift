//
//  ViewController.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 17.02.2023.
//

import UIKit
import SDWebImage

class MainVC: UIViewController {
    
    let presenter = Presenter()
    var gifData = [Gif]()
    lazy var collection = CustomCollection(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    //let gradient = GradientView(frame: CGRect(x: 0, y: 0, width: 500, height: 150))
    //let tabBar = UIView()
    //let homebtn = UIButton(type: .system)
    //let persbtn = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter.delegate = self
        presenter.fetchData()
    }
    
    private func configUI() {
        view.backgroundColor = .black
        configCollectionUI()
        //configGradient()
    }
    
    private func configCollectionUI() {
        collection.delegate   = self
        collection.dataSource = self
        view.addSubview(collection)
        let customLayout = CustomLayout()
        customLayout.delegate = self
        collection.collectionViewLayout = customLayout
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
//    private func configGradient() {
//        view.addSubview(gradient)
//        gradient.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            gradient.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            gradient.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            gradient.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            gradient.heightAnchor.constraint(equalToConstant: 150)
//        ])
//    }
    
}

extension MainVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ExportVC()
        vc.modalPresentationStyle = .fullScreen
        vc.urlImage = gifData[indexPath.item].images.original.url
        self.present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        guard gifData.count != 0 else {
            return cell
        }
        let urlGif = URL(string: gifData[indexPath.item].images.downsized.url)
        cell.imageView.sd_setImage(with: urlGif)
        return cell
    }
    
}

extension MainVC: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeOfImageAtIndexPath indexPath: IndexPath) -> CGSize {
        let itemHeightInt = Int(gifData[indexPath.item].images.downsized.height) ?? 100
        let itemHeight = CGFloat(itemHeightInt)
        return CGSize(
            width: self.view.bounds.width * 0.487,
            height: itemHeight
        )
    }
}

extension MainVC: PresenterDelegate {
    
    func showUsers(data: GiphyResponse) {
        self.gifData = data.data
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.collection.reloadData()
        }
    }
}

