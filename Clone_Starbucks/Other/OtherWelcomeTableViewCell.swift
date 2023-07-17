//
//  OtherWelcomeView.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/16.
//

import Foundation
import UIKit

class OtherWelcomeTableViewCell: UITableViewCell {
    // 셀의 구성 요소들
    let image = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 셀의 구성 요소 초기화 및 설정
        // ...
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
       

        contentView.backgroundColor = .blue
        
    }
    
    func configure(with item: ShopItem) {
        // 셀의 내용을 설정
        image.image = item.image
        titleLabel.text = item.text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 셀이 재사용되기 전에 초기화 작업 수행
        image.image = nil
        titleLabel.text = nil
    }
    
}
