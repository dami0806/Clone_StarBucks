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
            make.edges.equalToSuperview()
        }
        
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
        
        return CGSize(width: collectionView.bounds.width * 0.4, height: collectionView.bounds.width * 0.4)
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
        label.text = "주말에는 스타벅스 브런치와 함께"
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
        
        return CGSize(width: collectionView.bounds.width * 0.4, height: collectionView.bounds.width * 0.4)
    }
    
}
class HomeSixthCollectionViewCell: UICollectionViewCell {
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

