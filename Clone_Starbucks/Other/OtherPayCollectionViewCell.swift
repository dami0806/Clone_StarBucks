//
//  OtherPayCollectionViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/16.
//

import UIKit
import SnapKit

class OtherPayCollectionViewCell : UICollectionViewCell {
    let dataManager = OtherDataManager()
    var othersDataArray: [OtherSection] = []
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        contentView.addSubview(label)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    func setup(){
        dataManager.makeOtherData()
        othersDataArray = dataManager.getOtherData()
        contentView.addSubview(imageView)
        contentView.backgroundColor = .clear
        imageView.snp.makeConstraints { make in
            
            make.top.bottom.equalToSuperview().inset(14.5)
            make.width.equalTo(imageView.snp.height)
            make.leading.equalToSuperview().inset(20)
            
        }
        titleLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(imageView.snp.trailing).offset(20)
            make.centerY.equalTo(imageView.snp.centerY)
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with image: UIImage, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
}
