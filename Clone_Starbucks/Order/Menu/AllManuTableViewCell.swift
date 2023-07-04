//
//  AllManuTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/04.
//

import UIKit
import SnapKit

class AllManuTableViewCell: UITableViewCell {
    let image = UIImageView()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 7
        return stackView
    }()
     lazy var nameKo: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
     lazy var nameEn: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setUI()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI(){
          contentView.addSubview(image)
          contentView.addSubview(stackView)
          stackView.addArrangedSubview(nameKo)
          stackView.addArrangedSubview(nameEn)
          
          image.snp.makeConstraints { make in
              make.centerY.equalToSuperview()
              make.leading.equalToSuperview().inset(15)
              make.top.bottom.equalToSuperview().inset(15)
              make.width.equalTo(image.snp.height)
          }
          
          stackView.snp.makeConstraints { make in
              make.centerY.equalToSuperview()
              make.leading.equalTo(image.snp.trailing).offset(12)
             
          }
       
        nameEn.snp.makeConstraints { make in
            make.leading.equalTo(nameKo.snp.leading)
        }
      }
      
      override func layoutSubviews() {
          super.layoutSubviews()
          image.layer.cornerRadius = image.frame.width / 2
          image.clipsToBounds = true
      }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
