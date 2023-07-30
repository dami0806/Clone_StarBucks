//
//  HomeManager.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/30.
//

import Foundation
import UIKit

class HomeDataManager{
    private var homeRecommandDataArray: [HomeRecommandItem] = []
    
    func makeHomeData() {
        homeRecommandDataArray = [
            HomeRecommandItem(image: UIImage(named: "음료"), text: "케이크"),
            
            HomeRecommandItem(image: UIImage(named: "음료"), text: "텀플러/보온병"),
            HomeRecommandItem(image: UIImage(named: "음료"), text: "머그/컵"),
            HomeRecommandItem(image: UIImage(named: "음료"), text: "라이프스타일"),
            HomeRecommandItem(image: UIImage(named: "음료"), text: "티/커피용품"),
            HomeRecommandItem(image: UIImage(named: "음료"), text: "세트"),
            HomeRecommandItem(image: UIImage(named: "음료"), text: "스낵")
        ]
    }
    func getHomeData() -> [HomeRecommandItem] {
        
        return homeRecommandDataArray
    }
    
}
