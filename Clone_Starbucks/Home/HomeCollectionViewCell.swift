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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .brown
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
class HomeThirdCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .red
    }
    


}
class HomeFourthCollectionViewCell: UICollectionViewCell {
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

