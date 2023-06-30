//
//  PayCollectionViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/06/29.
//

import UIKit
import SnapKit


class PayCollectionViewCell: UICollectionViewCell {
    
    
    // 1.이미지 설정
    private lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        return imageView
    }()

    //2. 카드이름
    private lazy var cardName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .blue
        contentView.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private lazy var cardNameImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        contentView.addSubview(imageView)
        return imageView
    }()
    
    
    //3.카드포인트
    
    private lazy var cardPointImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        contentView.addSubview(imageView)
        return imageView
    }()
    
    private lazy var cardPoint: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        contentView.addSubview(label)
        return label
    }()
    
    //4.바코드
    private lazy var barcordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        return imageView
    }()
    
    //5.카드번호
    private lazy var cardNum: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(label)
        return label
    }()
    //6.바코드 유효시간
    private lazy var validNumSt : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.backgroundColor = .orange
        contentView.addSubview(stackView)
        return stackView
    }()
    private lazy var validNumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        validNumSt.addArrangedSubview(label)
        return label
    }()
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        validNumSt.addArrangedSubview(label)
        return label
    }()
    //7.버튼 두개
    private lazy var buttonSt : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        contentView.addSubview(stackView)
        return stackView
    }()
    private lazy var autoRecharge: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        buttonSt.addArrangedSubview(imageView)
        return imageView
    }()
    private lazy var normalRecharge: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        buttonSt.addArrangedSubview(imageView)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        //1.카드이미지
        cardImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentView).offset(10)
            make.height.equalTo(200)
            make.width.equalTo(350)
            
        }
        
        //2.카드이름
        
        cardName.snp.makeConstraints { make in
            make.top.equalTo(cardImageView.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
            
            
        }
        
        //2_1.카드이름
        cardNameImg.snp.makeConstraints { make in
            make.centerY.equalTo(cardName)
          make.width.height.equalTo(cardPoint.snp.height)
            
            make.leading.equalTo(cardName.snp.trailing)
            
        }
        
        //3_1 카드포인트
        cardPointImg.snp.makeConstraints { make in
            make.top.equalTo(cardName.snp.bottom)
            make.trailing.equalTo(cardPoint.snp.leading)
            make.width.height.equalTo(cardPoint.snp.height)
        }
        cardPoint.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(cardPointImg)
        }
        
        //4.바코드
        barcordImageView.snp.makeConstraints { make in
            make.top.equalTo(cardPoint.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview().offset(10)
            make.height.equalTo(100)
        //    make.height.equalTo(100)

        }
        
        //5.카드번호
        cardNum.snp.makeConstraints { make in
            make.top.equalTo(barcordImageView.snp.bottom).offset(3)
            //            make.height.equalTo(200)
            //            make.width.equalTo(350)
            make.centerX.equalToSuperview()
        }
        
        //6.바코드 유효시간
        validNumSt.snp.makeConstraints { make in
            make.top.equalTo(cardNum.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        //7.버튼 두개
        buttonSt.snp.makeConstraints { make in
            make.top.equalTo(validNumSt.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
            //     make.bottom.equalToSuperview()
            // make.height.equalTo(50)
            //    make.width.equalTo(100)
        }
        //7-1.자동충전
        autoRecharge.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            
        }
        //7-2.일반충전
        normalRecharge.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            
        }
        
        
    }
    
    func configure(with card: Cards) {
        cardImageView.image = card.cardImage
        cardName.text = card.cardName
        cardNameImg.image = UIImage(named: "카드명")
        cardPointImg.image = UIImage(named: "가격")
        cardPoint.text = "\(card.point) 원"
        barcordImageView.image = UIImage(named: "바코드")
        cardNum.text = card.cardNum
        validNumLabel.text = "바코드 유효시간"
        timeLabel.text = "10:00"
        autoRecharge.image = UIImage(named: "자동충전")
        normalRecharge.image = UIImage(named: "일반충전")
        
    }
}
