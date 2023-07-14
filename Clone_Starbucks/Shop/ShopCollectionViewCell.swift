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
    
    var uiView = UIView()
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
      
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImageView()
    }
    private func setupImageView() {
        contentView.addSubview(uiView)
        uiView.addSubview(imageView)
        
        uiView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(uiView)
        }
    }
    func configure(with image: UIImage) {
        imageView.image = image
        
        
    }
}
class ShopAllProductCollectionViewCell: UICollectionViewCell {
    var uiView = UIView()
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()
     lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    override init(frame: CGRect) {
         super.init(frame: frame)
         
        setupImageView()
       
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         
         setupImageView()
     }
    private func setupImageView() {
        contentView.addSubview(uiView)
        uiView.addSubview(imageView)
        uiView.addSubview(label)
        
        uiView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(uiView.snp.centerX)
            make.top.equalTo(uiView.snp.top).inset(5)
            make.width.height.equalTo(uiView.snp.width).multipliedBy(0.8)
            make.height.equalTo(imageView.snp.width)
        }
        layoutIfNeeded()
       
        print(imageView.frame.width)
            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.clipsToBounds = true
            
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.centerX.equalTo(uiView.snp.centerX)

        }
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
