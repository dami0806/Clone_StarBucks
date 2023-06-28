//
//  ViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit

class ViewController: UITabBarController{
    
    
   
    // 굳이 뷰를 따로 만들지 않았음 (MVC패턴으로 만들지 않았음)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       setupTabBar()
        
    }

   
    // 버튼 누르면 동작하는 코드 ===> 코드로 탭바 + 네비게이션바 설정
    func setupTabBar() {
        tabBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        tabBar.tintColor = UIColor.starbucksGreen
        // 첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
        let homeViewController = HomeViewController()
        let payViewController = PayViewController()
        let orderViewController = OrderViewController()
        let shopViewController = ShopViewController()
        let otherViewController = OtherViewController()
     
        homeViewController.tabBarItem = UITabBarItem(title:"Home",image: UIImage(systemName: "house.fill"), tag: 0)
        payViewController.tabBarItem = UITabBarItem(title: "Pay", image: UIImage(systemName: "creditcard.fill"), tag: 1)
        orderViewController.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "Order"), tag: 2)

        shopViewController.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "bag.fill"), tag: 3)

        otherViewController.tabBarItem = UITabBarItem(title: "Other", image: UIImage(systemName: "ellipsis"), tag: 4)

        let viewControllers = [homeViewController, payViewController, orderViewController, shopViewController, otherViewController]
              self.viewControllers = viewControllers
        self.selectedIndex = 0
    }

}

