//
//  HomeViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UIScrollViewDelegate{
    final let deliverViewHeight = 60
    final let deliverViewWeight = 180
    
    private var previousOffset: CGFloat = 0
    private var previousContentOffset: CGPoint = .zero
    
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        scrollView.delegate = self
        view.addSubview(scrollView)
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        scrollView.addSubview(contentView)
        return contentView
    }()
    
    private lazy var deliverView: UIView = {
        let view = UIView()
        view.backgroundColor = .starbucksGreen
        view.layer.cornerRadius =  CGFloat(deliverViewHeight/2)
        contentView.addSubview(view)
        return view
    }()
    private lazy var stackView: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.alignment = .center
        st.spacing = 3
        st.distribution = .equalSpacing
        deliverView.addSubview(st)
        return st
    }()
    
    private lazy var deliverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "deliverImage")
        imageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(imageView)
        return imageView
    }()
    private lazy var deliverLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivers"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(label)
        return label
    }()
    
    
    private lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        contentView.addSubview(view)
        return view
    }()
    private lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        contentView.addSubview(view)
        return view
    }()
    private lazy var view3: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        contentView.addSubview(view)
        
        return view
    }()
    private lazy var view4: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        contentView.addSubview(view)
        return view
    }()
    private lazy var view5: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        contentView.addSubview(view)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        self.scrollView.delegate = self
    }
    
    func makeUI(){
        view.addSubview(deliverView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView) // 내용 뷰의 너비를 스크롤 뷰와 동일하게 설정
        }
        deliverView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30) // 오른쪽으로 20만큼 여백
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(deliverViewWeight) // 너비 설정
            make.height.equalTo(deliverViewHeight) // 높이 설정
            deliverView.clipsToBounds = true //잘라내기
            
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(deliverView).inset(10)
            make.leading.trailing.equalTo(deliverView).inset(30)

        }
        
        deliverImage.snp.makeConstraints { make in
          make.width.height.equalTo(deliverViewHeight-20)
        }
        deliverLabel.isHidden = false
        
        
        
        view1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(300)
            make.top.leading.trailing.equalToSuperview()
        }
        view2.snp.makeConstraints { make in
            make.top.equalTo(view1.snp.bottom)
            make.height.equalTo(200)
            make.leading.trailing.equalToSuperview()
        }
        view3.snp.makeConstraints { make in
            make.top.equalTo(view2.snp.bottom)
            make.height.equalTo(200)
            make.leading.trailing.equalToSuperview()
        }
        view4.snp.makeConstraints { make in
            make.top.equalTo(view3.snp.bottom)
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview()
        }
        view5.snp.makeConstraints { make in
            make.top.equalTo(view4.snp.bottom)
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > previousContentOffset.y { // 스크롤이 내려갔을 때 작아짐
            deliverView.snp.updateConstraints { make in
                make.width.equalTo(deliverViewHeight)
            
            }
            
            stackView.snp.remakeConstraints { make in
                //make.edges.equalTo(deliverView).inset(10)
                make.center.equalTo(deliverView.snp.center)
                
            }
            deliverImage.snp.remakeConstraints{make in
                make.width.height.equalTo(deliverViewHeight-20)
               // make.center.equalTo(deliverView.snp.center)
                
                
            }
            deliverLabel.isHidden = true
            
            
        } else if scrollView.contentOffset.y < previousContentOffset.y { // 스크롤이 위로 올라갔을 때
            deliverView.snp.updateConstraints { make in
                make.width.equalTo(deliverViewWeight)
            }
            stackView.snp.remakeConstraints { make in
                make.center.equalTo(deliverView.snp.center)
            }
            
            deliverImage.snp.remakeConstraints{make in
      
                make.width.height.equalTo(deliverViewHeight-20)
                
            }
            deliverLabel.isHidden = false
        }
        UIView.animate(withDuration: 0.16) {
            self.view.layoutIfNeeded()
        }
        previousContentOffset = scrollView.contentOffset // 이전 컨텐트 오프셋 업데이트
    }
    
}
