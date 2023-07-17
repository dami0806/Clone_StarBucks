//
//  OtherTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/16.
//

import UIKit
import SnapKit
class OtherTableViewCell: UITableViewCell {
    let dataManager = OtherDataManager()
    var othersDataArray: [OtherSection] = []
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(OtherPayCollectionViewCell.self, forCellWithReuseIdentifier: "OtherPayCollectionViewCell")
        contentView.addSubview(collectionView)
        return collectionView
    }()
    private lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    var sectionData: OtherSection? {
        didSet {
            collectionView.reloadData()
//            collectionView.layoutIfNeeded()
//            tableView?.reloadData()
        }
    }
    weak var tableView: UITableView? // 테이블 뷰를 참조
    // 셀 초기화 및 구성을 위한 메서드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(collectionView)
        contentView.addSubview(lineView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(15)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(0.5)
            
        }
        dataManager.makeOtherData()
        othersDataArray = dataManager.getOtherData()
    }
}

extension OtherTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherPayCollectionViewCell", for: indexPath) as! OtherPayCollectionViewCell
        
        if let item = sectionData?.items[indexPath.item] {
            cell.imageView.image = item.image
            cell.titleLabel.text = item.text
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.bounds.width * 0.5
        let height = contentView.bounds.height * 0.45
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
