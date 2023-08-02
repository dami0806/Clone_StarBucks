//
//  ShopDataManager.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/09.
//

import Foundation
import UIKit

class ShopDataManager{
    private var shopDataArray: [ShopSection] = []
    
    func makeShopData() {
        shopDataArray = [
                ShopSection(headerTitle: nil, headerButtonTitle: nil, items: [
                    ShopItem(image: UIImage(named: "add1"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "add2"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "add3"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "add4"), text: "Item 4"),
                    ShopItem(image: UIImage(named: "add5"), text: "Item 5"),
                    ShopItem(image: UIImage(named: "add6"), text: "Item 5")
                ]),
                ShopSection(headerTitle: "All Products", headerButtonTitle: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "ALL_케이크"), text: "케이크"),
                    ShopItem(image: UIImage(named: "ALL_텀블러"), text: "텀플러/보온병"),
                    ShopItem(image: UIImage(named: "ALL_머그컵"), text: "머그/컵"),
                    ShopItem(image: UIImage(named: "ALL_라이프"), text: "라이프스타일"),
                    ShopItem(image: UIImage(named: "ALL_티"), text: "티/커피용품"),
                    ShopItem(image: UIImage(named: "ALL_세트"), text: "세트"),
                    ShopItem(image: UIImage(named: "ALL_스낵"), text: "스낵")
    
                ]),
                ShopSection(headerTitle: "Mobile Gifts", headerButtonTitle: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "giftitem"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "giftcard"), text: "Item 2")
                ]),
                ShopSection(headerTitle: "Best Items", headerButtonTitle: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "그린 사이렌 도트 머그 237ml"), text: "그린 사이렌 도트 머그 237ml"),
                    ShopItem(image: UIImage(named: "SS 스탠리 크림 켄처 텀블러 591ml"), text: "SS 스탠리 크림 켄처 텀블러 591ml"),
                    ShopItem(image: UIImage(named: "SS 블랙 앤 골드 스탠리 보온병 500ml"), text: "SS 블랙 앤 골드 스탠리 보온병 500ml"),
                    ShopItem(image: UIImage(named: "그린 사이렌 도트 머그 237ml"), text: "그린 사이렌 도트 머그 237ml"),
                  
                    ShopItem(image: UIImage(named: "레터링 디저트컴  & 핸들 글라스 & 아이스 볼 트레이 세트"), text: "레터링 디저트컴  & 핸들 글라스 & 아이스 볼 트레이 세트"),
                    ShopItem(image: UIImage(named: "레터링 디저트컴 2P & 아이스 볼 트레이 세트"), text: "레터링 디저트컴 2P & 아이스 볼 트레이 세트"),
                    ShopItem(image: UIImage(named: "레터링 플레이트 & 오발 플레이트 세트"), text: "레터링 플레이트 & 오발 플레이트 세트"),
                    ShopItem(image: UIImage(named: "글라스 머그 앤 소서 & 디저트컵 세트"), text: "글라스 머그 앤 소서 & 디저트컵 세트")
                ]),
                ShopSection(headerTitle: "New Products", headerButtonTitle: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "레터링 글라스 2P 세트"), text: "레터링 글라스 2P 세트"),
                    ShopItem(image: UIImage(named: "레터링 핸들 글라스 2P 세트"), text: "레터링 핸들 글라스 2P 세트"),
                    ShopItem(image: UIImage(named: "레터링 디저트컵 2P 세트"), text: "레터링 디저트컵 2P 세트"),
                    ShopItem(image: UIImage(named: "DW 투고 텀블러 & 아이스볼 트레이 세트"), text: "DW 투고 텀블러 & 아이스볼 트레이 세트"),
                    ShopItem(image: UIImage(named: "SS 블랙 데비 머그 414ml"), text: "SS 블랙 데비 머그 414ml"),
                    ShopItem(image: UIImage(named: "SS 엘마 블랙 텀블러 473ml"), text: "SS 엘마 블랙 텀블러 473ml"),
                    ShopItem(image: UIImage(named: "SS 콩코드 사이렌 하이트 텀블러 591ml"), text: "SS 콩코드 사이렌 하이트 텀블러 591ml"),
                    ShopItem(image: UIImage(named: "SS 스탠리 그린 켄처텀블러 591ml"), text: "SS 스탠리 그린 켄처텀블러 591ml")
                ])
            ]
    }
    func getShopData() -> [ShopSection] {
        return shopDataArray
    }
}

