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
    let uiView: OtherWelcomeUIView
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.uiView = OtherWelcomeUIView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func setupViews() {
       
        contentView.addSubview(uiView)
        uiView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
       // contentView.backgroundColor = .blue
        
    }
    
 
    
  
}
