//
//  OtherUIView.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/17.
//


import UIKit
import SnapKit
import RxCocoa
import RxSwift
class OtherTableHeaderView: UITableViewHeaderFooterView{
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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
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
        
    }
    
    func configure(title: String) {
        titleLabel.text = title
       
    }
}
