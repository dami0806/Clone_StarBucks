//
//  ShopViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class ShopViewController: UIViewController {
    let dataManager = ShopDataManager()
    var shopsDataArray: [ShopSection] = []
    private let shopTableView = UITableView()
    private var headerTitles: [String] = []  // 헤더의 제목을 저장하는 배열
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupViews()
        setupConstraints()
        dataManager.makeCardsData()
        shopsDataArray = dataManager.getShopData()
      //  print(shopsDataArray)
        title = "Starbucks OnlineStore"
        changeTitleMode(fontSize: 28)
        setNaviItem()
        
        
        
        
    }
    
    //viewWillAppear에서 실행
    private func setNaviItem() {
        // 네비게이션 바 스타일을 설정
        navigationController?.navigationBar.barStyle = .default
        
        // 네비게이션 바 배경색을 흰색으로 설정
        navigationController?.navigationBar.barTintColor = .white
        
        // 네비게이션 바의 텍스트 컬러를 흰색으로 설정
        navigationController?.navigationBar.tintColor = .black
        
        // 네비게이션 바의 타이틀 텍스트 속성을 설정합니다.
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
   
    }
    
    private func setupViews(){
        shopTableView.dataSource = self
        shopTableView.delegate = self
        
        shopTableView.register(ShopAddTableViewCell.self, forCellReuseIdentifier: "ShopAddTableViewCell")
        shopTableView.register(ShopAllProductsTableViewCell.self, forCellReuseIdentifier: "ShopAllProductsTableViewCell")
        shopTableView.register(ShopMobileGiftsTableViewCell.self, forCellReuseIdentifier: "ShopMobileGiftsTableViewCell")
        shopTableView.register(ShopBestItemsTableViewCell.self, forCellReuseIdentifier: "ShopBestItemsTableViewCell")
        
        shopTableView.register(ShopTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "ShopTableHeaderView")
        
        
        view.addSubview(shopTableView)
    }
    private func setupConstraints(){
        shopTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell", for: indexPath) as! ShopTableViewCell
        //        return cell
        if indexPath.section == 0 {
            // 섹션 0의 셀을 반환 (ShopAddTableViewCell)
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAddTableViewCell", for: indexPath) as! ShopAddTableViewCell
            // cell에 필요한 설정 작업 수행
            return cell
        } else if indexPath.section == 1{
            // 섹션 1의 셀을 반환 (ShopAllProductsTableViewCell)
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAllProductsTableViewCell", for: indexPath) as! ShopAllProductsTableViewCell
            // cell에 필요한 설정 작업 수행
            return cell
        }
        else if indexPath.section == 2{
            // 섹션 1의 셀을 반환 (ShopAllProductsTableViewCell)
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopMobileGiftsTableViewCell", for: indexPath) as! ShopMobileGiftsTableViewCell
            // cell에 필요한 설정 작업 수행
            return cell
        }
        else {
            // 섹션 1의 셀을 반환 (ShopAllProductsTableViewCell)
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopBestItemsTableViewCell", for: indexPath) as! ShopBestItemsTableViewCell
            // cell에 필요한 설정 작업 수행
            return cell
        }
    
}
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return shopsDataArray.count
    }
    //헤더
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil }
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ShopTableHeaderView") as! ShopTableHeaderView
        let sectionData = shopsDataArray[section]
        
        let title = sectionData.headerTitle
        headerView.configure(title: title ?? "")
        headerView.buttonTapObservable
            .subscribe(onNext: { [weak self] in
                self?.handleButtonTap(section: section)
            })
            .disposed(by: disposeBag)
        return headerView
    }
    
    private func handleButtonTap(section: Int) {
        print("Button tapped for section \(section)")
    }
    
}
extension ShopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

import SwiftUI
struct VCPreViewShopViewController:PreviewProvider {
    static var previews: some View {
        ShopViewController().toPreview().previewDevice("iPhone 14 Pro")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}
struct VCPreViewShopViewController2:PreviewProvider {
    static var previews: some View {
        ShopViewController().toPreview().previewDevice("iPhone 11")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}

