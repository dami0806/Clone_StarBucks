//
//  HomeFourthDetailCollectionViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/30.
//

import Foundation
import UIKit
import SnapKit

class HomeFourthDetailCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        imageView.layer.shadowOpacity = 0.5 //0일수록 투명
        imageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        imageView.layer.shadowRadius = 4 //0일수록 반경
        imageView.layer.masksToBounds = false
        contentView.addSubview(imageView)
        
        return imageView
    }()
    // 셀 초기화 및 구성을 위한 메서드입니다.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
       
    }
    
}
class HomeWhatsNewDetailCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
   lazy var title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 1

        return label
    }()
    lazy var subTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    // 셀 초기화 및 구성을 위한 메서드입니다.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(title)
        contentView.addSubview(subTitle)

        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(imageView.snp.width).multipliedBy(0.7)
        }
        title.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(8)
        }
        subTitle.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(title.snp.bottom).offset(5)

        }
    }
    


}
