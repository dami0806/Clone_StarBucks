//
//  OtherViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit

class OtherViewController: UIViewController {
    let dataManager = OtherDataManager()
    var othersDataArray: [OtherSection] = []
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.otherCellGray
        tableView.separatorStyle = .none
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Other"
        dataManager.makeOtherData()
        othersDataArray = dataManager.getOtherData()
        setupTableView()
        changeTitleMode(fontSize: 32)
        
        adjustContentInset()
        
        let bellImage = UIImage(systemName: "bell")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 14, weight: .regular))
             let settingsImage = UIImage(systemName: "gearshape")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 14, weight: .regular))
             
        let bellButtonItem = UIBarButtonItem(image: bellImage, style: .plain, target: self, action: #selector(bellButtonTapped))
               let settingsButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: #selector(settingsButtonTapped))
               
               navigationItem.rightBarButtonItems = [settingsButtonItem, bellButtonItem]
        bellButtonItem.tintColor = .black
        settingsButtonItem.tintColor = .black

                                                
           }
    
    @objc func bellButtonTapped() {
          // 벨 버튼을 눌렀을 때 처리하는 로직
      }

      @objc func settingsButtonTapped() {
          // 설정 버튼을 눌렀을 때 처리하는 로직
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
    private func adjustContentInset() {
        if #available(iOS 11.0, *) {
            let safeAreaInsets = view.safeAreaInsets
            
            let bottomInset = safeAreaInsets.bottom + 200
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
            tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        }
    }
    
    private func setupTableView(){
        tableView.register(OtherTableViewCell.self, forCellReuseIdentifier: "OtherTableViewCell")
        tableView.register(OtherWelcomeTableViewCell.self, forCellReuseIdentifier: "OtherWelcomeTableViewCell")
        tableView.register(OtherTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "OtherTableHeaderView")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}

extension OtherViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        // print(shopTableView.scrollIndicatorInsets.bottom)
        
        let scrollY = scrollView.contentOffset.y
        if scrollY > 200 {
            if #available(iOS 11.0, *) {
                tableView.contentInsetAdjustmentBehavior = .never // 네비자리 무시
            } else {
                automaticallyAdjustsScrollViewInsets = false
            }
        }
        else {
            if #available(iOS 11.0, *) {
                tableView.contentInsetAdjustmentBehavior = .always
                
            } else {
                automaticallyAdjustsScrollViewInsets = true
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0 {
            let welcomeCell = tableView.dequeueReusableCell(withIdentifier: "OtherWelcomeTableViewCell", for: indexPath) as! OtherWelcomeTableViewCell
            return welcomeCell
        }  else {
            let otherCell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath) as! OtherTableViewCell
            let sectionData = othersDataArray[indexPath.section]
            
            let isLastCell = indexPath.section == tableView.numberOfSections - 1
            otherCell.configureCell(sectionData: sectionData, isLastCell: isLastCell)
            otherCell.sectionData = sectionData
            otherCell.backgroundColor = .clear
            return otherCell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return othersDataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return tableView.bounds.width * 1.2
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell") as? OtherTableViewCell
            let sectionData = othersDataArray[indexPath.section]
            cell?.sectionData = sectionData
            let collectionViewHeight = cell?.calculateCollectionViewHeight() ?? 0
            return collectionViewHeight
            
        }
    }
    //헤더
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil }
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "OtherTableHeaderView") as! OtherTableHeaderView
        let sectionData = othersDataArray[section]
        let title = sectionData.headerTitle
        headerView.configure(title: title ?? "")
        return headerView
    }
}



