//
//  DetailKindTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/08.
//

import UIKit
import SnapKit

class DetailKindTableViewCell: UITableViewCell {

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
    lazy var price: UILabel = {
       let label = UILabel()
       label.textAlignment = .center
       label.font = UIFont.boldSystemFont(ofSize: 15)
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
        stackView.addArrangedSubview(price)
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
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        image.layer.cornerRadius = image.frame.width / 2
        image.clipsToBounds = true
    }
}
