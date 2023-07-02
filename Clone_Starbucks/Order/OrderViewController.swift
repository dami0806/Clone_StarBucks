//
//  OrderViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit
import SnapKit
import RxSwift

class OrderViewController: UIViewController {
    

    let items = ["전체 메뉴", "나만의 메뉴"]
     var tabBarButtons = [UIButton]()
     var selectedTabIndex = 0
    var buttonWidth : CGFloat = 0
     private lazy var tabBarView: UIView = {
         let view = UIView()
         view.backgroundColor = .white
         return view
     }()
     
     private lazy var selectedItemBox: UIView = {
         let view = UIView()
         view.backgroundColor = .starbucksGreen
         return view
     }()
     
     private var viewControllers = [AllMenuViewController(),MyMenuViewController()]
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectTab(at: 0, animated: false)
    }

    
     override func viewDidLoad() {
         super.viewDidLoad()
         
         setupTabBar()
         

     }
    
     
     private func setupTabBar() {
         self.view.addSubview(tabBarView)
         tabBarView.snp.makeConstraints { make in
             make.leading.trailing.equalToSuperview()
             make.top.equalTo(self.view.safeAreaLayoutGuide)
             make.height.equalTo(50)
         }
         
     
                
        buttonWidth = self.view.frame.width / 3.5
         
                tabBarButtons = items.enumerated().map { index, title in
                    let button = UIButton(type: .custom)
                    button.setTitle(title, for: .normal)
                    button.setTitleColor(.gray, for: .normal)
                    button.setTitleColor(.black, for: .selected)
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
                
                tabBarView.addSubview(selectedItemBox)
                selectedItemBox.snp.makeConstraints { make in
                    make.width.equalTo(buttonWidth)
                    make.height.equalTo(3)
                    make.bottom.equalTo(tabBarButtons[selectedTabIndex])
                    make.centerX.equalTo(tabBarButtons[selectedTabIndex])
                }
            }
            
            @objc private func tabBarButtonTapped(_ sender: UIButton) {
                guard let buttonIndex = tabBarButtons.firstIndex(of: sender) else { return }
                selectTab(at: buttonIndex, animated: true)
            }
            
         private func selectTab(at index: Int, animated: Bool) {
             guard index >= 0 && index < tabBarButtons.count else { return }
             
             if animated {
                 UIView.animate(withDuration: 0.3) {
                     self.updateSelectedItemBoxConstraints(at: index)
                     self.view.layoutIfNeeded()
                 }
             } else {
                 // 아무 작업도 수행하지 않음
             }
             
             selectedTabIndex = index
             
             tabBarButtons.enumerated().forEach { buttonIndex, button in
                 button.isSelected = (buttonIndex == index)
             }
             
             let selectedViewController = viewControllers[index]
             addChild(selectedViewController)
         
             view.addSubview(selectedViewController.view)
             selectedViewController.view.snp.makeConstraints { make in
                     make.leading.equalToSuperview()
                     make.top.equalTo(tabBarView.snp.bottom)
                     make.width.equalTo(view.bounds.width)
                     make.height.equalTo(view.bounds.height - tabBarView.frame.maxY)
                 }
             selectedViewController.didMove(toParent: self)
             
             view.bringSubviewToFront(tabBarView) // 탭바를 뷰컨트롤러 위로 올림
         }

            
            private func updateSelectedItemBoxConstraints(at index: Int) {
                selectedItemBox.snp.remakeConstraints { make in
                    make.width.equalTo(buttonWidth)
                    make.height.equalTo(3)
                    make.bottom.equalTo(tabBarButtons[index])
                    make.centerX.equalTo(tabBarButtons[index])
                }
            }
        }
import SwiftUI
struct VCPreViewOrderViewController:PreviewProvider {
    static var previews: some View {
        OrderViewController().toPreview().previewDevice("iPhone 14 Pro")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}
struct VCPreViewOrderViewController2:PreviewProvider {
    static var previews: some View {
        OrderViewController().toPreview().previewDevice("iPhone 11")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}

