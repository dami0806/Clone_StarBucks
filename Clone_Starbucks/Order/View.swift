//
//  View.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/20.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift

class selectStoreView: UIView {
    
    //주문할 매장을 선택해주세요 버튼
    private lazy var searchShopView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 3
        stackView.backgroundColor = .clear
        return stackView
    }()
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 3
        stackView.backgroundColor = .clear
        return stackView
    }()
    private lazy var searchShopLabel: UILabel = {
        let label = UILabel()
        label.text = "주문할 매장을 선택해 주세요"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    private lazy var chevronDown: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.down")
        view.tintColor = .white
        return view
    }()
    private lazy var searchShopLine : UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    //장바구니 버튼
    private lazy var shoppingbasketView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private lazy var shoppingBacstketstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.spacing = 0
        return stackView
    }()

    private lazy var shoppingbasketLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)

        return label
    }()
    private lazy var shoppingbasketImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "bag")
        view.tintColor = .lightGray
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        super.backgroundColor = UIColor.selectShopBottom
        addSubview(searchShopView)
        addSubview(shoppingbasketView)
        searchShopView.addSubview(stackView)
        labelStackView.addArrangedSubview(searchShopLabel)
        labelStackView.addArrangedSubview( chevronDown)
      //  shoppingbasketView.addSubview(shoppingBacstketstackView)
        shoppingbasketView.addSubview(shoppingbasketImage)
        shoppingbasketView.addSubview(shoppingbasketLabel)
        stackView.addArrangedSubview(labelStackView)
        stackView.addArrangedSubview(searchShopLine)
        chevronDown.snp.makeConstraints { make in
            make.height.equalTo(labelStackView.snp.height).multipliedBy(0.8)
            make.width.equalTo(chevronDown.snp.height)
        }
        searchShopView.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(15)
        }
        searchShopLine.snp.makeConstraints { make in
            make.height.equalTo(0.8)
        }
      
        shoppingbasketView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(searchShopView.snp.trailing).offset(5)
        }
        shoppingbasketLabel.snp.makeConstraints { make in
            make.centerY.equalTo(shoppingbasketView.snp.centerY).offset(3)
            make.centerX.equalTo(shoppingbasketView.snp.centerX)

            
        }
        shoppingbasketImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().inset(7)
            make.width.equalToSuperview().inset(12)
        }

    }
}
