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
class ShopAddTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let collectionView: UICollectionView
    
    private let dummySubData = [
        ["SubImage1", "SubText1"],
        ["SubImage2", "SubText2"],
        ["SubImage3", "SubText3"],
        ["SubImage4", "SubText4"],
        ["SubImage5", "SubText5"],
        ["SubImage6", "SubText6"],
        ["SubImage7", "SubText7"],
        ["SubImage8", "SubText8"],
        ["SubImage9", "SubText9"],
        ["SubImage10", "SubText10"]
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SubShopCollectionViewCell.self, forCellWithReuseIdentifier: "SubShopCollectionViewCell")
        contentView.addSubview(collectionView)
        
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    
    func configure(image: String, text: String) {
        // 이미지와 텍스트를 설정하여 셀을 구성
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummySubData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubShopCollectionViewCell", for: indexPath) as! SubShopCollectionViewCell
        let data = dummySubData[indexPath.item]
        cell.configure(image: data[0], text: data[1])
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

//MARK: -ShopAllProductsTableViewCell
class ShopAllProductsTableViewCell: UITableViewCell {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .brown
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
        collectionView.register(ShopAllProductCollectionViewCell.self, forCellWithReuseIdentifier: "ShopAllProductsCollectionViewCell")

        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
extension  ShopAllProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopAllProductCollectionViewCell", for: indexPath) as! ShopAllProductCollectionViewCell
        
        return cell
    }
    
}

extension ShopAllProductsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}
//MARK: -ShopMobileGiftsProductsTableViewCell
class ShopMobileGiftsTableViewCell: UITableViewCell {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBlue
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
        collectionView.register(ShopMobileGiftsCollectionViewCell.self, forCellWithReuseIdentifier: "ShopMobileGiftsCollectionViewCell")
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
extension ShopMobileGiftsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopMobileGiftsCollectionViewCell", for: indexPath) as! ShopMobileGiftsCollectionViewCell
        
        
        
        return cell
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






//MARK:- HeaderView
class ShopTableHeaderView: UITableViewHeaderFooterView{
    private let titleLabel = UILabel()
    private let button = UIButton()
    
    private let disposeBag = DisposeBag()
    private let buttonTapSubject = PublishSubject<Void>()
    var buttonTapObservable: Observable<Void> {
        return buttonTapSubject.asObservable()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // 타이틀 레이블 설정
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(titleLabel)
        
        // 버튼 설정
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        contentView.addSubview(button)
        
        // 버튼 탭 이벤트를 buttonTapSubject에 바인딩
        button.rx.tap
            .bind(to: buttonTapSubject)
            .disposed(by: disposeBag)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}

