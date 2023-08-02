//
//  DataManager.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/06/29.
//

import Foundation
import UIKit

class DataManager {
    private var cardsDataArray: [Cards] = []
    
    func makeCardsData() {
        cardsDataArray = [
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드1")!, cardName: "B2B_커피모먼트 카드", point: 8600, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드2")!, cardName: "B2B_커피모먼트 카드", point: 23000, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드3")!, cardName: "B2B_커피모먼트 카드", point: 4000, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드4")!, cardName: "B2B_커피모먼트 카드", point: 13600, cardNum: "****_****_**99-1432")
        ]
    }
    
    func getCardData() -> [Cards] {
        return cardsDataArray
    }
    
    private var drinksDataArray: [Drinks] = []
    
    func makeDrinksData() {
        drinksDataArray = [
            Drinks(drinkImage: UIImage(named: "음료 1")!, drinkKo: "New", drinkEn: "", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료 2")!, drinkKo: "추천", drinkEn: "Recommend", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
            Drinks(drinkImage: UIImage(named: "음료 3")!, drinkKo: "리저브 에스프레소", drinkEn: "Reserve Espresso", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
            Drinks(drinkImage: UIImage(named: "음료 4")!, drinkKo: "리저브 드립", drinkEn: "Reserve Drip", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
            Drinks(drinkImage: UIImage(named: "음료 5")!, drinkKo: "리프레셔", drinkEn: "Starbucks Refreshers", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료 6")!, drinkKo: "콜드 브루", drinkEn: "Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
            Drinks(drinkImage: UIImage(named: "음료 7")!, drinkKo: "블론드", drinkEn: "Blonde Coffee", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
     
            Drinks(drinkImage: UIImage(named: "음료 8")!, drinkKo: "에스프레소", drinkEn: "Espresso", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "디카페인 커피", drinkEn: "Decaf Coffee", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
         
            Drinks(drinkImage: UIImage(named: "음료 9")!, drinkKo: "프라푸치노", drinkEn: "Frappuccino", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
           
            Drinks(drinkImage: UIImage(named: "음료 10")!, drinkKo: "블랜디드", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료 11")!, drinkKo: "리저브 콜드 브루", drinkEn: "Blended", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
            Drinks(drinkImage: UIImage(named: "음료 12")!, drinkKo: "피지오", drinkEn: "Starbucks Fizzio", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
            Drinks(drinkImage: UIImage(named: "음료 13")!, drinkKo: "티바나", drinkEn: "Teavana", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료 14")!, drinkKo: "브루드 커피", drinkEn: "Brewed Coffee", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            
            
            Drinks(drinkImage: UIImage(named: "음료 15")!, drinkKo: "기타", drinkEn: "Others", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료 16")!, drinkKo: "병음료", drinkEn: "RTD", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true)
          
        ]
    }
    
    func getDrinksData() -> [Drinks] {
        // print(cardsDataArray)
        
        return drinksDataArray
    }
    
    
    //
    private var foodsDataArray: [Foods] = []
    
    func makeFoodsData() {
        foodsDataArray = [
          
            Foods(foodsImage: UIImage(named: "푸드 1")!, foodsKo: "New", foodsEn: "", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            
            Foods(foodsImage: UIImage(named: "푸드 2")!, foodsKo: "추천", foodsEn: "Recommend", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            
            Foods(foodsImage: UIImage(named: "푸드 3")!, foodsKo: "브레드", foodsEn: "Bread", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            
            Foods(foodsImage: UIImage(named: "푸드 4")!, foodsKo: "케이크&미니디저트", foodsEn: "Cake&Mini Dessert", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            
            Foods(foodsImage: UIImage(named: "푸드 5")!, foodsKo: "샌드위치&샐러드", foodsEn: "Sandwich&Salad", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "푸드 6")!, foodsKo: "따듯한 푸드", foodsEn: "Hot Food", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            
            Foods(foodsImage: UIImage(named: "푸드 7")!, foodsKo: "과일&요거트", foodsEn: "Fruit&Yogurt", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            
            Foods(foodsImage: UIImage(named: "푸드 8")!, foodsKo: "스낵", foodsEn: "Snack", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800)
            
           
            
        ]
    }
    
    func getFoodsData() -> [Foods] {
        
        return foodsDataArray
    }
    
    private var goodsDataArray: [Goods] = []
    
    func makeGoodsData() {
        goodsDataArray = [Goods(kindImage: UIImage(named: "상품 1")!, kindKo: "New", kindEn: ""),
                          Goods(kindImage: UIImage(named: "상품 2")!, kindKo: "추천", kindEn: "Recommend"),
                          Goods(kindImage: UIImage(named: "상품 3")!, kindKo: "머그/글라스", kindEn: "Mug/Glass"),
                          Goods(kindImage: UIImage(named: "상품 4")!, kindKo: "스테인리스텀블러", kindEn: "Stainless steel Tumbler"),
                          Goods(kindImage: UIImage(named: "상품 5")!, kindKo: "플라스틱텀블러", kindEn: "Plastic Tumbler"),
                          Goods(kindImage: UIImage(named: "상품 6")!, kindKo: "보온병", kindEn: "Vaccum flask"),
                          Goods(kindImage: UIImage(named: "상품 7")!, kindKo: "액세서리", kindEn: "ACC"),
                          Goods(kindImage: UIImage(named: "상품 8")!, kindKo: "커피용품", kindEn: "Brewing Item"),
                          Goods(kindImage: UIImage(named: "상품 9")!, kindKo: "원두", kindEn: "Whole bean"),
                          Goods(kindImage: UIImage(named: "상품 10")!, kindKo: "비아", kindEn: "VIA"),
                          Goods(kindImage: UIImage(named: "상품 11")!, kindKo: "패키지 티", kindEn: "Packaged Tea"),
                          Goods(kindImage: UIImage(named: "상품 12")!, kindKo: "리저브원두", kindEn: "Reserve Whole bean"),
                          Goods(kindImage: UIImage(named: "상품 13")!, kindKo: "시럽", kindEn: "Syrup")
                          
                          
                          
        ]
    }
    
    func getGoodsData() -> [Goods] {
        
        return goodsDataArray
    }
    
    //디테일
    private var detailDrinksDataArray: [Drinks] = []
    
    func makeDetailDrinksData() {
        detailDrinksDataArray = [
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),  Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),  Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),  Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true)]
    }
    
    func getDetailDrinksData() -> [Drinks] {
        // print(cardsDataArray)
        
        return detailDrinksDataArray
    }
    
}
