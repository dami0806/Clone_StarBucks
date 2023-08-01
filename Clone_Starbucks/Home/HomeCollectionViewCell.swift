//
//  HomeCollectionViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/27.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .blue
    }
    
}
class HomeFirstCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Home_First")
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.3)
        }
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        imageView.layer.shadowOpacity = 0.4 //0일수록 투명
        imageView.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageView.layer.shadowRadius = 6 //0일수록 반경
        imageView.layer.masksToBounds = false
        
        
    }
}
class HomeSecondCollectionViewCell: UICollectionViewCell {
    //라벨
    //ShopAllProductCollectionViewCell
    let homeDataManager = HomeDataManager()
    var homeDataArray: [HomeRecommandItem] = []
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "고객님을 위한 추천메뉴"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    private func setupUI() {
        homeDataManager.makeHomeData()
        homeDataArray = homeDataManager.getHomeData()
        contentView.addSubview(label)
        contentView.addSubview(collectionView)
        label.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(5)
            
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ShopAllProductCollectionViewCell.self, forCellWithReuseIdentifier: "ShopAllProductCollectionViewCell")
    }
    
    
    
}
extension HomeSecondCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeDataArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopAllProductCollectionViewCell", for: indexPath) as! ShopAllProductCollectionViewCell
        cell.customFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        cell.imageView.image = homeDataArray[indexPath.row].image
        cell.label.text = homeDataArray[indexPath.row].text
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width * 0.45, height: collectionView.bounds.width * 0.45)
    }
    
}


class HomeFourthCollectionViewCell: UICollectionViewCell {
    var homeFourthArray : [UIImage] = [UIImage(named: "Home_Second1")!,UIImage(named: "Home_Second2")!,UIImage(named: "Home_Second3")!,UIImage(named: "Home_Second4")!]
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeFourthDetailCollectionViewCell.self, forCellWithReuseIdentifier: "HomeFourthDetailCollectionViewCell")
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
extension HomeFourthCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeFourthArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFourthDetailCollectionViewCell", for: indexPath) as! HomeFourthDetailCollectionViewCell
        cell.imageView.image = homeFourthArray[indexPath.row]
     
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width * 0.95, height: collectionView.bounds.width * 0.48)
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15

    }
    
}
class HomeWhatsNewCollectionViewCell: UICollectionViewCell{
    let homeDataManager = HomeDataManager()
    var homeWhatsNewDataArray: [HomeWhatsNewItem] = []
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "What's New"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    private lazy var seeAllLabel: UILabel = {
        let label = UILabel()
        label.text = "See all"
        label.textAlignment = .left
        label.textColor = UIColor.starbucksGreen
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(label)
        contentView.addSubview(seeAllLabel)
        contentView.addSubview(collectionView)
        homeDataManager.makeHomeWhatsNewData()
        homeWhatsNewDataArray = homeDataManager.getHomeWhatsNewData()
        label.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
        }
        seeAllLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(-50)
            
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeWhatsNewDetailCollectionViewCell.self, forCellWithReuseIdentifier: "HomeWhatsNewDetailCollectionViewCell")
        
    }
    
    
}
extension HomeWhatsNewCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeWhatsNewDataArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeWhatsNewDetailCollectionViewCell", for: indexPath) as! HomeWhatsNewDetailCollectionViewCell
        
        cell.imageView.image = homeWhatsNewDataArray[indexPath.row].image
        cell.title.text = homeWhatsNewDataArray[indexPath.row].title
        cell.subTitle.text = homeWhatsNewDataArray[indexPath.row].subTitle

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width * 0.7, height: collectionView.bounds.width * 0.46)
    }
    
}

class HomeFifthCollectionViewCell: UICollectionViewCell {
    let homeDataManager = HomeDataManager()
    var homeDataArray: [HomeRecommandItem] = []
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "하루가 달콤해지는 디저트"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    private func setupUI() {
        homeDataManager.makeHomeDessertData()
        homeDataArray = homeDataManager.getHomeDessertData()
        contentView.addSubview(label)
        contentView.addSubview(collectionView)
        label.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(5)
            
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ShopAllProductCollectionViewCell.self, forCellWithReuseIdentifier: "ShopAllProductCollectionViewCell")
    }
    

    
}
extension HomeFifthCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeDataArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopAllProductCollectionViewCell", for: indexPath) as! ShopAllProductCollectionViewCell
        cell.customFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        cell.imageView.image = homeDataArray[indexPath.row].image
        cell.label.text = homeDataArray[indexPath.row].text
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width * 0.45, height: collectionView.bounds.width * 0.45)
    }
    
}
class HomeSixthCollectionViewCell: UICollectionViewCell {
    var homeFourthArray : [UIImage] = [UIImage(named: "Home_Sixth1")!,UIImage(named: "Home_Sixth2")!,UIImage(named: "Home_Sixth3")!,UIImage(named: "Home_Sixth4")!]
//    private lazy var view: UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//contentView.addSubview(view)
//        return view
//    }()
//
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    var totalCellHeight: CGFloat {
        var totalHeight: CGFloat = 300 * (0.5+0.28+0.7+0.5+0.48)
        print(totalHeight)
           let spacingBetweenCells: CGFloat = 15.0
           totalHeight += CGFloat(homeFourthArray.count - 1) * spacingBetweenCells
           return totalHeight
       }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(collectionView)
       
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeFourthDetailCollectionViewCell.self, forCellWithReuseIdentifier: "HomeFourthDetailCollectionViewCell")
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
//        view.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }
    
}
extension HomeSixthCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeFourthArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFourthDetailCollectionViewCell", for: indexPath) as! HomeFourthDetailCollectionViewCell
        cell.imageView.image = homeFourthArray[indexPath.row]
     
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row{
        case 0:
               return CGSize(width: collectionView.bounds.width * 0.95, height: collectionView.bounds.width * 0.5)
        case 1:
               return CGSize(width: collectionView.bounds.width * 0.95, height: collectionView.bounds.width * 0.28)
        case 2:
               return CGSize(width: collectionView.bounds.width * 0.95, height: collectionView.bounds.width * 0.7)
        case 3:
               return CGSize(width: collectionView.bounds.width * 0.95, height: collectionView.bounds.width * 0.5)
           default:
               return CGSize(width: collectionView.bounds.width * 0.95, height: collectionView.bounds.width * 0.48)
           }
  

    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15

    }
    
}


