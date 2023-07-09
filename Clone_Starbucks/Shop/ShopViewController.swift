//
//  ShopViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit
import SnapKit
class ShopViewController: UIViewController {
    let dataManager = ShopDataManager()
    var shopsDataArray: [ShopSection] = []
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .white
            collectionView.showsVerticalScrollIndicator = false
            return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupUI()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: "ShopCollectionViewCell")
        
        dataManager.makeCardsData()
        shopsDataArray = dataManager.getShopData()
        print(shopsDataArray)
    }
    private func setupUI(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            
        }
    }
    
    
    
}
extension ShopViewController: UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return shopsDataArray.count
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return shopsDataArray[section].items.count
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionViewCell", for: indexPath) as! ShopCollectionViewCell
        return cell
    }
    
    
    
}
import SwiftUI
struct VCPreViewShopViewController:PreviewProvider {
    static var previews: some View {
        ShopViewController().toPreview().previewDevice("iPhone 14 Pro")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}
struct VCPreViewShopViewController2:PreviewProvider {
    static var previews: some View {
        ShopViewController().toPreview().previewDevice("iPhone 11")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}

