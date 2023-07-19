//
//  OtherWelcomeUIView.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/19.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift


class OtherWelcomeItemUIView : UIView {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var uiImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "별 히스토리")
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "라벨"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let disposeBag = DisposeBag()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        bindTapGesture()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        bindTapGesture()
        
    }
    func setupView(){
        addSubview(backView)
        backView.addSubview(uiImage)
        backView.addSubview(label)
        backView.snp.makeConstraints { make in
            make.width.equalTo(super.snp.width)
            make.height.equalTo(backView.snp.width)

        }
        uiImage.snp.makeConstraints { make in
            make.centerX.equalTo(backView)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(uiImage.snp.width)
            make.top.equalToSuperview().inset(10)
            
        }
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(uiImage.snp.bottom).inset(10)
        }
        
    }
    
    private func bindTapGesture() {
        let tapGesture = UITapGestureRecognizer()
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        
        tapGesture.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.handleTap()
            })
            .disposed(by: disposeBag)
    }
    
    private func handleTap() {
      
        print("a")
    }
}
class SinsegaeUIView: UIView {
    private let imageView: UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "신세계")
          return imageView
      }()
      
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.text = "멤버십 혜택의 신세계"
        label.textAlignment = .center
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 12, weight: .light)
        return label
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "신세계 유니버스 클럽가입"
        label.textAlignment = .center
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .bold)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContraint()
            
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func setupContraint(){
        addSubview(imageView)
        addSubview(subLabel)
        addSubview(label)
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(imageView.snp.height)
        }
        subLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(imageView.snp.trailing).offset(20)
        }
        
        label.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(imageView.snp.trailing).offset(20)
        }
    }
}


class OtherWelcomeUIView : UIView {
    let starUIView: OtherWelcomeItemUIView
    let receiptUIView: OtherWelcomeItemUIView
    let myInfoUIView: OtherWelcomeItemUIView
    let accountUIView: OtherWelcomeItemUIView
    let myMenu: OtherWelcomeItemUIView
    
    let sinsegeaUIView: SinsegaeUIView
    lazy var stackView1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starUIView, receiptUIView,UIView()])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    lazy var stackView2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [myInfoUIView, accountUIView, myMenu])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
 
 
    func setupView() {
        
        super.addSubview(stackView2)
        super.addSubview(stackView1)
        super.addSubview(sinsegeaUIView)
        sinsegeaUIView.backgroundColor = .brown
        sinsegeaUIView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView1)
            make.height.equalTo(sinsegeaUIView.snp.width).multipliedBy(0.3)
            make.bottom.equalToSuperview().offset(20)
        }
        stackView2.snp.makeConstraints { make in
            make.width.equalTo(super.snp.width).inset(20)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(stackView2.snp.width).multipliedBy(0.3)
            make.bottom.equalTo(sinsegeaUIView.snp.top).offset(-20)
        }
        stackView1.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(stackView2.snp.height)
            make.width.equalTo(stackView2.snp.width)
            make.bottom.equalTo(stackView2.snp.top).offset(10)
            
        }
    
       }
       
       override init(frame: CGRect) {
           self.starUIView = OtherWelcomeItemUIView()
           self.receiptUIView = OtherWelcomeItemUIView()
           self.myInfoUIView = OtherWelcomeItemUIView()
           self.accountUIView = OtherWelcomeItemUIView()
           self.myMenu = OtherWelcomeItemUIView()
           self.sinsegeaUIView = SinsegaeUIView()
           super.init(frame: frame)
           setupView()
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
   }
