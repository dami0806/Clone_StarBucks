//
//  ShopViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//
import UIKit
import SnapKit
import RxSwift
import RxCocoa
class ShopViewController: UIViewController {
    private let shopTableView = UITableView()
    private let dummyData = [
        ["Image1", "Text1"],
        ["Image2", "Text2"],
        ["Image3", "Text3"],
        ["Image4", "Text4"],
        ["Image5", "Text5"]
    ]
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        shopTableView.dataSource = self
        shopTableView.delegate = self
        shopTableView.register(ShopTableViewCell.self, forCellReuseIdentifier: "ShopTableViewCell")
        shopTableView.register(ShopTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "ShopTableHeaderView")
        
        view.addSubview(shopTableView)
    }
    
    private func setupConstraints() {
        shopTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ShopViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell", for: indexPath) as! ShopTableViewCell
        let data = dummyData[indexPath.section]
        cell.configure(image: data[0], text: data[1])
        return cell
    }
    
  
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50  // Set the desired height for the header view
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ShopTableHeaderView") as! ShopTableHeaderView
        let sectionData = dummyData[section]
        let title = sectionData[1] // Assuming the text is in the second element of each section's data
        headerView.configure(title: title)
        headerView.buttonTapObservable
            .subscribe(onNext: { [weak self] in
                // Handle button tap event
                self?.handleButtonTap(section: section)
            })
            .disposed(by: disposeBag)
        return headerView
    }
       
       private func handleButtonTap(section: Int) {
           // Button tapped for section
           print("Button tapped for section \(section)")
       }
}

extension ShopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


class ShopTableViewCell: UITableViewCell {
    private let subShopTableView = UITableView()
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
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        subShopTableView.dataSource = self
        subShopTableView.delegate = self
        subShopTableView.register(SubShopTableViewCell.self, forCellReuseIdentifier: "SubShopTableViewCell")
        contentView.addSubview(subShopTableView)
    }
    
    private func setupConstraints() {
        subShopTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(image: String, text: String) {
        // Configure the cell with the provided image and text
    }
}

extension ShopTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubShopTableViewCell", for: indexPath) as! SubShopTableViewCell
       
        return cell
    }
}

extension ShopTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

class SubShopTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        // Configure the cell with the provided image and text
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


class ShopTableHeaderView: UITableViewHeaderFooterView {
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
        // Configure title label
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(titleLabel)
        
        // Configure button
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        contentView.addSubview(button)
        
        // Bind button tap event to buttonTapSubject
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
class SubShopCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(80)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(10)
        }
    }
    
    func configure(image: String, text: String) {
        imageView.image = UIImage(named: image)
        label.text = text
    }
}
