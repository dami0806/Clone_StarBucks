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
    

    
    private lazy var deliverView: UIView = {
        let view = UIView()
        view.backgroundColor = .starbucksGreen
        view.layer.cornerRadius =  CGFloat(deliverViewHeight/2)
        collectionView.addSubview(view)
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
    

    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        view.addSubview(collectionView)
        return collectionView
    }()
    
       private var stickyHeaderView: StickyHeaderView!
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         // 네비게이션 바 숨기기
        navigationController?.isNavigationBarHidden = true
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeFirstCollectionViewCell.self, forCellWithReuseIdentifier: "HomeFirstCollectionViewCell")
        collectionView.register(HomeSecondCollectionViewCell.self, forCellWithReuseIdentifier: "HomeSecondCollectionViewCell")
        collectionView.register(HomeFourthCollectionViewCell.self, forCellWithReuseIdentifier: "HomeFourthCollectionViewCell")
        collectionView.register(HomeFifthCollectionViewCell.self, forCellWithReuseIdentifier: "HomeFifthCollectionViewCell")
        collectionView.register(HomeSixthCollectionViewCell.self, forCellWithReuseIdentifier: "HomeSixthCollectionViewCell")
        collectionView.register(HomeWhatsNewCollectionViewCell.self, forCellWithReuseIdentifier: "HomeWhatsNewCollectionViewCell")
        
    }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           // 첫 번째 셀을 중간 아래로 이동 (초기 로드 시에도 실행)
           if let firstCell = collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) {
               let yOffset = 300
               firstCell.frame.origin.y = CGFloat(yOffset)
           }
       }
    func makeUI(){
        
        view.addSubview(deliverView)
        stickyHeaderView = StickyHeaderView(frame: .zero)
        view.addSubview(stickyHeaderView)


        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        
  
        stickyHeaderView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
           make.top.equalTo(view)
            make.height.equalTo(300)
            view.layoutIfNeeded()
        }
  
        
    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maxHeaderScroll: CGFloat = 200
    
        let offsetY = scrollView.contentOffset.y
        let alpha = min(1.0, max(0, (maxHeaderScroll - offsetY) / maxHeaderScroll))

       // print(offsetY)// -50
        if offsetY < maxHeaderScroll && offsetY >= -50{
            // 헤더뷰를 스크롤에 따라 움직이도록 처리
            stickyHeaderView.snp.updateConstraints { make in
                            make.top.equalToSuperview().offset(-offsetY)
                        }
            let alpha = min(1.0, max(0, (maxHeaderScroll - offsetY) / maxHeaderScroll))
            stickyHeaderView.alphaImageView(alpha: alpha)
        } else if offsetY > maxHeaderScroll{
            // 헤더뷰가 200만큼 올라갔을 때 멈추게
            stickyHeaderView.snp.updateConstraints { make in
                          make.top.equalToSuperview().offset(-maxHeaderScroll)
                      }
            stickyHeaderView.alphaImageView(alpha: 0)
        }else {
            stickyHeaderView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(50)
                      }
            stickyHeaderView.alphaImageView(alpha: 1)
        }
        view.layoutIfNeeded()
        
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 6
      }

      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 1
      }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCollectionViewCell", for: indexPath) as! HomeFirstCollectionViewCell
            return cell
        } else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSecondCollectionViewCell", for: indexPath) as! HomeSecondCollectionViewCell
            return cell
        }
     
        else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFourthCollectionViewCell", for: indexPath) as! HomeFourthCollectionViewCell
            return cell
        }
        else if indexPath.section == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeWhatsNewCollectionViewCell", for: indexPath) as! HomeWhatsNewCollectionViewCell
            return cell
        }
       
        else if indexPath.section == 4{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFifthCollectionViewCell", for: indexPath) as! HomeFifthCollectionViewCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSixthCollectionViewCell", for: indexPath) as! HomeSixthCollectionViewCell
            return cell
        }
  
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 0.3)
        } else if indexPath.section == 1 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 0.6)
        }    else if indexPath.section == 2 {
            let cellHeight = collectionView.bounds.width * 0.52
            return CGSize(width: collectionView.bounds.width, height:  cellHeight*4)
        }
        else if indexPath.section == 3 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 0.9)
        }
        else if indexPath.section == 4 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 0.6)
        }else {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 0.6)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
               case 0:
                   return UIEdgeInsets(top: CGFloat(300), left: 0, bottom: 0, right: 0)
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    
               default:
                   return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
               }
           }
}
