//
//  OtherWelcomeView.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/16.
//

import Foundation
import UIKit

class OtherWelcomeTableViewCell: UITableViewCell {
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.text = "DAMI08**"
        label.textColor = UIColor.starbucksGreen
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "님"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다!🙌🏻"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
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
        contentView.addSubview(label)
        contentView.addSubview(uiView)
        contentView.addSubview(userLabel)
        contentView.addSubview(welcomeLabel)
        contentView.backgroundColor = UIColor.otherCellGray
       
        userLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview().offset(-15)
            
        }
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(userLabel.snp.trailing).offset(1)
            
        }
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(userLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            
        }
      
        uiView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    
    
    
}
