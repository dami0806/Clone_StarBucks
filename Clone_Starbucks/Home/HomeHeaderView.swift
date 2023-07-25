//
//  HomeHeaderView.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/25.
//

import UIKit
import SnapKit

class StickyHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .red
    }
}

