//
//  PayViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit
import SnapKit

class PayViewController: UIViewController, UIScrollViewDelegate {
    let dataManager = DataManager()
    var cardsDataArray: [Cards] = []
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        view.addSubview(scrollView)
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let contentView = UIView()
        scrollView.addSubview(contentView)
        return contentView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
  
        // 셀 등록
        collectionView.register(PayCollectionViewCell.self, forCellWithReuseIdentifier: "payCell")
        contentView.addSubview(collectionView)
        return collectionView
    }()
    
    private lazy var twoButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        contentView.addSubview(view)
        return view
        
        
    }()
    private lazy var adView : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        contentView.addSubview(view)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureItems()
        makeUI()
        self.scrollView.delegate = self
        title = "Pay"
        changeTitleMode()
        dataManager.makeCardsData() // 데이터 초기화
        cardsDataArray = dataManager.getCardData()
      
   
        
    }
    func makeUI(){
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(500)
            
        }
        twoButtonView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(300)
        }
        adView.snp.makeConstraints { make in
            make.top.equalTo(twoButtonView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }
        
    }
  
    private func configureItems(){
        
        self.navigationController?.navigationBar.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(listButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        
    }
    
    @objc func listButtonTapped() {
        // list 버튼이 탭되었을 때 동작할 내용을 구현
        print("List button tapped")
    }
}
    
    // MARK: - UICollectionViewDataSource
    extension PayViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           // print(cardsDataArray)
            return cardsDataArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "payCell", for: indexPath) as! PayCollectionViewCell
            
            // 셀에 데이터 설정
            let cardData = cardsDataArray[indexPath.item]
            cell.configure(with: cardData)
            
            
            return cell
        }
        
        // MARK: - UICollectionViewDelegateFlowLayout
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
              let collectionViewWidth = collectionView.bounds.width - 30
              let cellHeight: CGFloat = collectionView.bounds.height - 40
              
              return CGSize(width: collectionViewWidth, height: cellHeight)
          }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
            }
            
//            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//                return 20
//            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return 10
            }
    
}



