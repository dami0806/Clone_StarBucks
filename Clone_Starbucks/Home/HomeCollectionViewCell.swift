//
//  HomeCollectionViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/27.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
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
        contentView.backgroundColor = .blue
    }
    


}