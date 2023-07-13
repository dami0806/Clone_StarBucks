//
//  ShopCollectionViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/13.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift



class ShopAddCollectionViewCell: UICollectionViewCell {
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            
        }
    }
    override init(frame: CGRect) {
         super.init(frame: frame)
         
         setupCell()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         
         setupCell()
     }
     
     private func setupCell() {
         backgroundColor = .red
     }
 
    
}
class ShopAllProductCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
         super.init(frame: frame)
         
         setupCell()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         
         setupCell()
     }
     
     private func setupCell() {
         backgroundColor = .gray
     }
 }



class ShopMobileGiftsCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupCell()
}

required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setupCell()
}

private func setupCell() {
    backgroundColor = .yellow
}
}
class ShopBestItemsCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
         super.init(frame: frame)
         
         setupCell()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         
         setupCell()
     }
     
     private func setupCell() {
         backgroundColor = .red
     }
 }
