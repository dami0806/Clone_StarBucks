//
//  DataManager.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/06/29.
//

import Foundation
import UIKit
//class DataManager {
//    private var drinksDataArray: [Drinks] = []
//
//    func makeDrinksData() {
//        drinksDataArray = [
//            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 6500, ice: true),
//            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루2", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 6500, ice: true),
//            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루3", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 6500, ice: true),
//        Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루4", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 6500, ice: true),
//        Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루2", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 6500, ice: true),
//            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루3", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 6500, ice: true),
//            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루4", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 6500, ice: true),
//            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루5", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 6500, ice: true)
//
//
//
//        ]
//    }
//
//    func getDrinksData() -> [Drinks] {
//        return drinksDataArray
//    }
//
//}
class DataManager {
    private var cardsDataArray: [Cards] = []
    
    func makeCardsData() {
        cardsDataArray = [
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432")
        ]
    }
    
    func getCardData() -> [Cards] {
        print(cardsDataArray)
            
        return cardsDataArray
    }
    
}
