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
        // view.backgroundColor = .orange
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5 //0일수록 투명
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 //0일수록 반경
        
        view.layer.masksToBounds = false
        
        return view
    }()
    
    private lazy var uiImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    func setImage(_ image: UIImage?) {
        uiImage.image = image
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        bindTapGesture()
        setImage(UIImage(named: "별 히스토리"))
        setTitle("별 히스토리")
        
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
            make.leading.trailing.equalToSuperview().inset(33)
            make.height.equalTo(uiImage.snp.width)
            make.top.equalToSuperview().inset(23)
            
        }
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(uiImage.snp.bottom).offset(10)
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
    let dataManager = OtherDataManager()
    var othersDataArray: [OtherItem] = []
    
    let starUIView: OtherWelcomeItemUIView
    let receiptUIView: OtherWelcomeItemUIView
    let myInfoUIView: OtherWelcomeItemUIView
    let accountUIView: OtherWelcomeItemUIView
    let myMenu: OtherWelcomeItemUIView
    let sinsegeaUIView: SinsegaeUIView
    let cupImage: UIImageView
    
    
    lazy var stackView1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starUIView, receiptUIView,UIView()])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    lazy var stackView2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [myInfoUIView, accountUIView, myMenu])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    
    func setupSinsegeaUI(){
        sinsegeaUIView.layer.cornerRadius = 20
        sinsegeaUIView.backgroundColor = .white
        sinsegeaUIView.layer.shadowColor = UIColor.lightGray.cgColor
        sinsegeaUIView.layer.shadowOpacity = 0.5 //0일수록 투명
        sinsegeaUIView.layer.shadowOffset = CGSize(width: 0, height: 0)
        sinsegeaUIView.layer.shadowRadius = 5 //0일수록 반경
        
        sinsegeaUIView.layer.masksToBounds = false
        
    }
    func setupView() {
        dataManager.makeOtherWelcomeData()
        
        let itemViews: [OtherWelcomeItemUIView] = [starUIView, receiptUIView, myInfoUIView, accountUIView, myMenu]
        othersDataArray = dataManager.getOtherWelcomeData()

              for (index, itemView) in itemViews.enumerated() {
                  let item = othersDataArray[index]
                  itemView.setImage(item.image)
                  itemView.setTitle(item.text)
              }

        
        super.addSubview(cupImage)
        super.addSubview(stackView2)
        super.addSubview(stackView1)
        super.addSubview(sinsegeaUIView)
        setupSinsegeaUI()
        cupImage.image = UIImage(named: "컵하이")
        sinsegeaUIView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView1)
            make.height.equalTo(sinsegeaUIView.snp.width).multipliedBy(0.25)
            make.bottom.equalToSuperview().inset(20)
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
            make.bottom.equalTo(stackView2.snp.top).offset(-15)
            
        }
        cupImage.snp.makeConstraints { make in
            make.height.equalTo(stackView2.snp.height)
            make.width.equalTo(cupImage.snp.height).multipliedBy(1.2)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(stackView2.snp.top).offset(-10)
        }
    }
    
    override init(frame: CGRect) {
        self.starUIView = OtherWelcomeItemUIView()
        self.receiptUIView = OtherWelcomeItemUIView()
        self.myInfoUIView = OtherWelcomeItemUIView()
        self.accountUIView = OtherWelcomeItemUIView()
        self.myMenu = OtherWelcomeItemUIView()
        self.sinsegeaUIView = SinsegaeUIView()
        self.cupImage = UIImageView()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
