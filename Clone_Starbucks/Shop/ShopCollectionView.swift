//
//  ShopCollectionView.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/13.
//

//import UIKit
//import SnapKit
////MARK: - ShopAddCollectionView
//class ShopAddCollectionView : UICollectionView {
//    private let itemWidthRatio: CGFloat = 0.7
//    private let itemHeightRatio: CGFloat = 0.8
//    
//    private var images: [UIImage] = [UIImage(named: "add1")!,UIImage(named: "add2")!,UIImage(named: "add3")!,UIImage(named: "add4")!,UIImage(named: "add5")!]
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        self.delegate = self
//        self.dataSource = self
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        collectionViewLayout = layout
//    
//    }
//}
//extension ShopAddCollectionView: UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(images.count)
//        return images.count
//      
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopAddCollectionViewCell", for: indexPath) as! ShopAddCollectionViewCell
//        cell.imageView.image = images[indexPath.item]
//                return cell
//    }
//
//}
////MARK: - ShopAllProductsCollectionView
//class ShopAllProductsCollectionView : UICollectionView {
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        self.delegate = self
//        self.dataSource = self
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        collectionViewLayout = layout
//        
//
//    }
//}
//extension ShopAllProductsCollectionView : UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopAllProductCollectionViewCell", for: indexPath) as! ShopAllProductCollectionViewCell
//        return cell
//        
//    }
//}
////MARK: - ShopMobileGiftsCollectionView
//class ShopMobileGiftsCollectionView : UICollectionView{
//    
//}
////MARK: - ShopBestItemsCollectionView
//class ShopBestItemsCollectionView : UICollectionView{
//    
//}
