//
//  ShopTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/13.
//

import UIKit
import RxCocoa
import RxSwift

//MARK: -ShopAddProductsTableViewCell
class ShopAddTableViewCell: UITableViewCell{
    private let collectionView: UICollectionView
    
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        setupViews()
        setupConstraints()
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ShopAddCollectionViewCell.self, forCellWithReuseIdentifier: "ShopAddCollectionViewCell")
        collectionView.showsVerticalScrollIndicator = false
        contentView.addSubview(collectionView)
        
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    
  
}
    // MARK: - UICollectionViewDataSource
    extension ShopAddTableViewCell:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return shopDataArray[0].items.count
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopAddCollectionViewCell", for: indexPath) as! ShopAddCollectionViewCell
            let image = shopDataArray[0].items[indexPath.item].image
            cell.imageView.image = image
            
            return cell
        }
        
        // MARK: - UICollectionViewDelegateFlowLayout
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
               return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
           }
           
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
            return CGSize(width: collectionView.bounds.width * 0.75, height: collectionView.bounds.height)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
              return 0
          }
    }

//MARK: -ShopAllProductsTableViewCell
class ShopAllProductsTableViewCell: UITableViewCell {
    private let collectionView: UICollectionView
    private let shopAllProductsButton = ShopAllProductsButton()
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        setupViews()
        setupConstraints()
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ShopAllProductCollectionViewCell.self, forCellWithReuseIdentifier: "ShopAllProductCollectionViewCell")
        contentView.addSubview(collectionView)
        contentView.addSubview(shopAllProductsButton)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            //make.edges.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.3)
        }
        shopAllProductsButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-13)
        }
        
        
    }
    
  
}
extension  ShopAllProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[1].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopAllProductCollectionViewCell", for: indexPath) as! ShopAllProductCollectionViewCell
        let image = shopDataArray[1].items[indexPath.item].image
        let label = shopDataArray[1].items[indexPath.item].text
        cell.imageView.image = image
        cell.label.text = label
        return cell
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
       }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.width * 0.27, height: collectionView.bounds.height)
    }
    
}


//MARK: -ShopMobileGiftsProductsTableViewCell
class ShopMobileGiftsTableViewCell: UITableViewCell {
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    let imageViewArray: [UIImage] = [UIImage(named: "giftcard")!,UIImage(named: "giftitem")!]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ShopMobileGiftsCollectionViewCell.self, forCellWithReuseIdentifier: "ShopMobileGiftsCollectionViewCell")
        addSubview(collectionView)
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
extension ShopMobileGiftsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[2].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopMobileGiftsCollectionViewCell", for: indexPath) as! ShopMobileGiftsCollectionViewCell
        let image = shopDataArray[2].items[indexPath.item].image
        cell.imageView.image = image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 2.5, bottom: 0, right: 0)
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        let height = collectionView.bounds.height
            return CGSize(width: width, height: height)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -5
    }
    
}

//MARK: -ShopBestItemsTableViewCell
class ShopBestItemsTableViewCell: UITableViewCell {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray
        return collectionView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ShopAllProductCollectionViewCell.self, forCellWithReuseIdentifier: "ShopAllProductCollectionViewCell")
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
extension  ShopBestItemsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopBestItemsProductCollectionViewCell", for: indexPath) as! ShopBestItemsCollectionViewCell
        return cell
    }
    
}

extension ShopBestItemsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}

