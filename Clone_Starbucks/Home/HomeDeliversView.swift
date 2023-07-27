////
////  HomeDeliversView.swift
////  Clone_Starbucks
////
////  Created by 박다미 on 2023/07/27.
////
//
//import Foundation
//import UIKit
//import SnapKit
//
//class deliverView:UIView{
//    private lazy var deliverView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .starbucksGreen
//        view.layer.cornerRadius =  CGFloat(deliverViewHeight/2)
//        collectionView.addSubview(view)
//        return view
//    }()
//    private lazy var stackView: UIStackView = {
//        let st = UIStackView()
//        st.axis = .horizontal
//        st.alignment = .center
//        st.spacing = 3
//        st.distribution = .equalSpacing
//        deliverView.addSubview(st)
//        return st
//    }()
//    
//    private lazy var deliverImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "deliverImage")
//        imageView.contentMode = .scaleAspectFit
//        stackView.addArrangedSubview(imageView)
//        return imageView
//    }()
//    private lazy var deliverLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Delivers"
//        label.textColor = UIColor.white
//        label.font = UIFont.boldSystemFont(ofSize: 19)
//        label.setContentHuggingPriority(.required, for: .vertical)
//        label.setContentCompressionResistancePriority(.required, for: .vertical)
//        stackView.addArrangedSubview(label)
//        return label
//    }()
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        func makeUI(){
//            
//        }
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//            
//        }
//        func makeUI(){
//            view.addSubview(deliverView)
//            
//            
//            deliverView.snp.makeConstraints { make in
//                make.trailing.equalToSuperview().inset(30) // 오른쪽으로 20만큼 여백
//                make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
//                make.width.equalTo(deliverViewWeight) // 너비 설정
//                make.height.equalTo(deliverViewHeight) // 높이 설정
//                deliverView.clipsToBounds = true //잘라내기
//                
//            }
//            
//            stackView.snp.makeConstraints { make in
//                make.top.bottom.equalTo(deliverView).inset(10)
//                make.leading.trailing.equalTo(deliverView).inset(30)
//                
//            }
//            
//            deliverImage.snp.makeConstraints { make in
//                make.width.height.equalTo(deliverViewHeight-20)
//            }
//            deliverLabel.isHidden = false
//            
//            
//        }
//    }
