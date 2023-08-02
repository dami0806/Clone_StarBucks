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
        contentView.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private lazy var cardNameImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        return imageView
    }()
    
    
    //3.카드포인트
    
    private lazy var cardPointImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        return imageView
    }()
    
    private lazy var cardPoint: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        contentView.addSubview(label)
        return label
    }()
    
    //4.바코드
    private lazy var barcordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
        label.textColor = UIColor.greenText
        label.text = "2:00"
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
    private var timer: Timer?
      private var remainingTimeInSeconds: Int = 120 {
          didSet {
              updateTimeLabel()
          }
      }

      private func startTimer() {
          timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
      }

      private func stopTimer() {
          timer?.invalidate()
          timer = nil
      }

      @objc private func updateTime() {
          remainingTimeInSeconds -= 1
          if remainingTimeInSeconds <= 0 {
                     // 타이머가 00:00이 되었을 때, 타이머를 멈추고 "타이머끝" 라벨을 표시
                     stopTimer()
              //버튼이랑 라벨 넣기
                     timeLabel.text = "타이머끝"
                 } else {
                     // 시간을 표시하는 레이블 업데이트
                     let minutes = remainingTimeInSeconds / 60
                     let seconds = remainingTimeInSeconds % 60
                     timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
                 }
             

      }

      private func updateTimeLabel() {
          let minutes = remainingTimeInSeconds / 60
          let seconds = remainingTimeInSeconds % 60
          timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
      }
    private func setupUI() {
        // UICollectionView의 배경색 설정
        contentView.backgroundColor = .blue

        // UICollectionView의 layer에 그림자 추가
        contentView.layer.shadowColor = UIColor.lightGray.cgColor   // 그림자의 색상
        contentView.layer.shadowOffset = CGSize(width: 0, height: 6)   // 그림자의 오프셋 (가로, 세로)
        contentView.layer.shadowRadius = 4   // 그림자의 반경 (그림자의 흐림 정도)
        contentView.layer.shadowOpacity = 0.3   // 그림자의 불투명도 (0 ~ 1 사이)
        contentView.layer.masksToBounds = false   // 그림자가 UICollectionView 경계를 벗어나도록 함

        //1.카드이미지
        cardImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentView).offset(10)
            make.width.equalToSuperview().inset(15)
            make.height.equalTo(cardImageView.snp.width).multipliedBy(0.75)
            
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
            make.leading.trailing.equalToSuperview().inset(15)
            
            make.height.equalTo(barcordImageView.snp.width).multipliedBy(0.2)
        //    make.height.equalTo(100)

        }
        
        //5.카드번호
        cardNum.snp.makeConstraints { make in
            make.top.equalTo(barcordImageView.snp.bottom).offset(3)
         
            make.centerX.equalToSuperview()
        }
        
        //6.바코드 유효시간
        validNumSt.snp.makeConstraints { make in
            make.top.equalTo(cardNum.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        //7.버튼 두개
        buttonSt.snp.makeConstraints { make in
            make.top.equalTo(validNumSt.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(3)
            make.height.equalTo(barcordImageView.snp.height)
    
        }
        //7-1.자동충전
        autoRecharge.snp.makeConstraints { make in
            
            
        }
        //7-2.일반충전
        normalRecharge.snp.makeConstraints { make in
           
            
        }
        
        
    }
    func configure(with card: Cards) {
        cardImageView.image = card.cardImage
        cardName.text = card.cardName
        cardNameImg.image = UIImage(named: "카드명")
        cardPointImg.image = UIImage(named: "가격")
        cardPoint.text = "\(formatNumberWithComma(card.point)) 원"
        barcordImageView.image = UIImage(named: "바코드")
        cardNum.text = card.cardNum
        validNumLabel.text = "바코드 유효시간"
        timeLabel.text = "2:00"
        startTimer()
        autoRecharge.image = UIImage(named: "자동충전")
        normalRecharge.image = UIImage(named: "일반충전")
        
    }
}
