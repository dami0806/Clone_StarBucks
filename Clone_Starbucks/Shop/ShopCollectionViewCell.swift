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

class SubShopCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }
    }
    
    func configure(image: String, text: String) {
        imageView.image = UIImage(named: image)
        label.text = text
    }
}


class ShopAddCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
         contentView.addSubview(imageView)
         imageView.snp.makeConstraints { make in
             make.edges.equalToSuperview()
         }
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
