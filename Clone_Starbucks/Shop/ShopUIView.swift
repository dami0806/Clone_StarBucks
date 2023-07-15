//
//  ShopUIView.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/15.
//

import UIKit
import RxCocoa
import RxSwift
//MARK: - HeaderView
class ShopTableHeaderView: UITableViewHeaderFooterView{
    private let titleLabel = UILabel()
    private let button = UIButton()
    
    private let disposeBag = DisposeBag()
    private let buttonTapSubject = PublishSubject<Void>()
    var buttonTapObservable: Observable<Void> {
        return buttonTapSubject.asObservable()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // 타이틀 레이블 설정
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        contentView.addSubview(titleLabel)
        
        // 버튼 설정
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
     

        button.tintColor = .black
        contentView.addSubview(button)
        
        // 버튼 탭 이벤트를 buttonTapSubject에 바인딩
        button.rx.tap
            .bind(to: buttonTapSubject)
            .disposed(by: disposeBag)
        
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
       
    }
}
//MARK: -Footer
class ShopAllProductsButton: UIButton{
    private let containerView = {
       let view = UIView()
        return view
    }()
    private let roundedView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
         return view
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "쇼핑하러 가기"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        setupViews()
        setupConstraints()

        }

       
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
            setupConstraints()

            
        }

    private func setupViews(){
        addSubview(containerView)
        containerView.addSubview(roundedView)
        roundedView.addSubview(label)
        
    }
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        roundedView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            
            
        }
        label.snp.makeConstraints { make in
            make.center.equalTo(roundedView.snp.center)
        }
    }
    
}


