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

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension OtherViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : othersDataArray.count
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return section == 0 ? 0 : 50
        }
        
     
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                // 0번째 섹션의 셀에 다른 데이터를 넣는 로직을 구현
                let cell = tableView.dequeueReusableCell(withIdentifier: "OtherWelcomeTableViewCell", for: indexPath) as! OtherWelcomeTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath) as! OtherTableViewCell
             
                
                
                return cell
            }
        }
    
    
    
}
