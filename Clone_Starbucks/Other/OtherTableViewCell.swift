//
//  OtherTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/16.
//

import UIKit
import SnapKit
class OtherTableViewCell: UITableViewCell {
    
    let collectionView: UICollectionView = {
        var collectionView = UICollectionView()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .brown
        collectionView.showsHorizontalScrollIndicator = false

        
        return collectionView
    }()
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         setupConstraints()
         collectionView.register(OtherPayCollectionViewCell.self, forCellWithReuseIdentifier: "OtherPayCollectionViewCell")
         
        
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func setupConstraints() {
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
 }
let dummyData = [
     ("음료", "음료"),
     ("음료", "과자"),
     ("음료", "과일"),
     ("음료", "커피")
 ]
extension OtherTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PayCell", for: indexPath) as! OtherPayCollectionViewCell
               
               let data = dummyData[indexPath.row]
               let imageName = data.0 // 이미지 파일 이름
               let title = data.1 // 텍스트
               
              
               cell.configure(with: UIImage(named: imageName)!, title: title)
               
               return cell
           }
    }
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 - 20
        let height: CGFloat = 120
        
        return CGSize(width: width, height: height)
    }
    
     
 
