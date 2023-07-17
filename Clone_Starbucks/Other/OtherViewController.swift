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

extension OtherViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0 {
                let welcomeCell = tableView.dequeueReusableCell(withIdentifier: "OtherWelcomeTableViewCell", for: indexPath) as! OtherWelcomeTableViewCell
                
                // Configure the welcome cell if needed
                
                return welcomeCell
            }  else {
                let otherCell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath) as! OtherTableViewCell
                let sectionData = othersDataArray[indexPath.section]
                otherCell.sectionData = sectionData
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
            return tableView.bounds.width * 1.3
        }
        else {
            return tableView.bounds.width * 0.3
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
    
    

