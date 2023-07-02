//
//  AllMenuViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/06/30.
//

import UIKit
import SnapKit
class AllMenuViewController: UIViewController {
    
    
    
    let items = ["음료", "푸드", "상품"]
    var tabBarButtons = [UIButton]()
    var selectedTabIndex = 0
    
    private lazy var tabBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
       
        return view
    }()
    private lazy var selectStoreView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
           tableView.backgroundColor = .clear
           return tableView
    }()
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupdata()
        setupTabBar()
        selectTab(at: selectedTabIndex, animated: true)
        setupTableView()
    }
    
    private func setupdata() {
        
    }
    private func setupTableView() {
        view.addSubview(tableView)
        view.addSubview(selectStoreView)
        selectStoreView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(tabBarView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(selectStoreView)
        }
        
    }
    private func setupTabBar() {
        view.addSubview(tabBarView)
        tabBarView.snp.makeConstraints {  make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(50)
            
        }
        let buttonWidth = self.view.frame.width / 5
        
        tabBarButtons = items.enumerated().map { index, title in
            let button = UIButton(type: .custom)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.gray, for: .normal)
            button.setTitleColor(.black, for: .selected)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
            tabBarView.addSubview(button)
            
            button.snp.makeConstraints { make in
                make.leading.equalTo(tabBarView).offset(buttonWidth * CGFloat(index))
                make.top.equalTo(tabBarView)
                make.width.equalTo(buttonWidth)
                make.height.equalTo(tabBarView)
            }
            
            return button
        }
        
        
    }
    
    @objc private func tabBarButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = tabBarButtons.firstIndex(of: sender) else { return }
        selectTab(at: buttonIndex, animated: true)
    }
    
    private func selectTab(at index: Int, animated: Bool) {
        guard index >= 0 && index < tabBarButtons.count else { return }
        
        
        selectedTabIndex = index
        tabBarButtons.enumerated().forEach { buttonIndex, button in
            button.isSelected = (buttonIndex == index)
        }
        
       
        view.bringSubviewToFront(tabBarView) // 탭바를 뷰컨트롤러 위로 올림
    }
    
    
}
import SwiftUI
struct VCPreViewAllMenuViewController:PreviewProvider {
    static var previews: some View {
        AllMenuViewController().toPreview().previewDevice("iPhone 14 Pro")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}
struct VCPreViewAllMenuViewController2:PreviewProvider {
    static var previews: some View {
        AllMenuViewController().toPreview().previewDevice("iPhone 11")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}

