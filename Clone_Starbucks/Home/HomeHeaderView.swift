//
//  HomeHeaderView.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/25.
//

import UIKit
import SnapKit

class StickyHeaderView: UIView {
    //이미지뷰
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")
        addSubview(imageView)
        return imageView
    }()
    
    //뷰안에 버튼3개
    private lazy var uiview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        addSubview(view)
        return view
    }()
    private lazy var whatsNewButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .ultraLight)
        let envelopeImage = UIImage(systemName: "envelope", withConfiguration: symbolConfig)
        button.setImage(envelopeImage, for: .normal)
        button.setTitle("What's New", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        uiview.addSubview(button)
        return button
    }()
    private lazy var couponButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .ultraLight)
        let envelopeImage = UIImage(systemName: "ticket", withConfiguration: symbolConfig)
        button.setImage(envelopeImage, for: .normal)
        button.setTitle("Coupon", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        uiview.addSubview(button)
        return button
    }()
    private lazy var bellButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .ultraLight)
        let bellImage = UIImage(systemName: "bell", withConfiguration: symbolConfig)
        button.setImage(bellImage, for: .normal)
        button.tintColor = .black
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        uiview.addSubview(button)
        return button
    }()
    
    @objc private func buttonTapped() {
        // 버튼이 탭되었을 때의 동작 처리
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        super.backgroundColor = .white
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width).multipliedBy(0.6)
            
        }
        uiview.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
        }
        whatsNewButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(whatsNewButton.snp.height).multipliedBy(2)
        }
        couponButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(whatsNewButton.snp.trailing).offset(10)
            make.width.equalTo(whatsNewButton.snp.height).multipliedBy(2)
        }
        bellButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(bellButton.snp.height)
            make.trailing.equalToSuperview().inset(10)
        }
    }
    func alphaImageView(alpha: CGFloat) {
            imageView.alpha = alpha
        }
}

