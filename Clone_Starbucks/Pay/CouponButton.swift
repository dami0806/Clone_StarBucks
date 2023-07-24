//
//  CouponButton.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/24.
//

import Foundation
import UIKit
import SnapKit

class CouponButton:UIView{
    //버튼 두개
    //사이에 세로 라인하나
    private lazy var couponButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Coupon", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(couponButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var eGiftItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("e-Gift Item", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(eGiftItemButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var centerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    private func setupUI(){
        addSubview(couponButton)
        addSubview(eGiftItemButton)
        addSubview(centerLine)
        couponButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)

            make.width.equalTo(couponButton.snp.height).multipliedBy(2.5)

        }
        eGiftItemButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(couponButton.snp.height).multipliedBy(2.5)

        }
        centerLine.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(0.8)
            make.height.equalTo(super.snp.height).dividedBy(5)
        }
    }
    
    @objc private func couponButtonTapped() {
        // 버튼이 탭되었을 때의 동작 처리
    }

    @objc private func eGiftItemButtonTapped() {
        // 버튼이 탭되었을 때의 동작 처리
    }
}
