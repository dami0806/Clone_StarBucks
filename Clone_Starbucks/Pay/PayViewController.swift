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
    var twoButtonView : CouponButton

    private lazy var adView : UIView = {
        let view = UIView()
        contentView.addSubview(view)
        view.backgroundColor = .yellow
        
        
        return view
    }()
    private lazy var adImage: UIImageView = {
        let img = UIImage(named: "광고")
        let imgView = UIImageView(image: img)
        
        imgView.contentMode = .scaleAspectFill
        adView.addSubview(imgView)
        return imgView
    }()
    init() {
         // 사용자 정의 뷰 초기화
         twoButtonView = CouponButton(frame: .zero)
         
         // 부모 클래스(UINavigationController)의 초기화자 호출
         super.init(nibName: nil, bundle: nil)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        setNaviItem()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureItems()
        makeUI()
        self.scrollView.delegate = self
        title = "Pay"
        changeTitleMode(fontSize: 32)
        dataManager.makeCardsData() // 데이터 초기화
        cardsDataArray = dataManager.getCardData()
    }
    func makeUI(){
        contentView.addSubview(twoButtonView)

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
            make.height.equalTo(collectionView.snp.width).multipliedBy(1.4)
            
        }
        twoButtonView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(twoButtonView.snp.width).multipliedBy(0.16)
        }
        
        adView.snp.makeConstraints { make in
            make.top.equalTo(twoButtonView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(adView.snp.width).multipliedBy(0.24)
            make.bottom.equalToSuperview()
        }
        adImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    private func setNaviItem() {
        // 네비게이션 바 스타일을 설정
        navigationController?.navigationBar.barStyle = .default
        
        // 네비게이션 바 배경색을 흰색으로 설정
        navigationController?.navigationBar.barTintColor = .white
        
        // 네비게이션 바의 텍스트 컬러를 흰색으로 설정
        navigationController?.navigationBar.tintColor = .black
        
        // 네비게이션 바의 타이틀 텍스트 속성을 설정
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        //네비게이션 바의 그림자 없애기
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func configureItems(){
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(listButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = .gray
        
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

import SwiftUI
struct VCPreViewPayViewController:PreviewProvider {
    static var previews: some View {
        PayViewController().toPreview().previewDevice("iPhone 14 Pro")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}
struct VCPreViewPayViewController2:PreviewProvider {
    static var previews: some View {
        PayViewController().toPreview().previewDevice("iPhone 11")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}




