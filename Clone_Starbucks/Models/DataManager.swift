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
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432"),
            Cards(cardImage: UIImage(named: "쿠폰카드")!, cardName: "B2B_커피모먼트 카드", point: 10100, cardNum: "****_****_**99-1432")
        ]
    }
    
    func getCardData() -> [Cards] {
       // print(cardsDataArray)
            
        return cardsDataArray
    }
    
    private var drinksDataArray: [Drinks] = []
    
    func makeDrinksData() {
        drinksDataArray = [
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),  Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),  Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),
            Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true),  Drinks(drinkImage: UIImage(named: "음료")!, drinkKo: "리저브 콜드 브루", drinkEn: "Reserve Cold Brew", detail: "리저브 커피 마스터의 정성으로 차갑게 추출한 깊고 부드러운 풍미의 커피", price: 0, ice: true)]
    }
    
    func getDrinksData() -> [Drinks] {
       // print(cardsDataArray)
            
        return drinksDataArray
    }
    
    //
    private var foodsDataArray: [Foods] = []
    
    func makeFoodsData() {
        foodsDataArray = [
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800),
            Foods(foodsImage: UIImage(named: "케이크")!, foodsKo: "레드벨벳 크림치즈 케이크", foodsEn: "Red Velvet Cream Cheese Cake", detail: "레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.", price: 6800)

        ]
    }
    
    func getFoodsData() -> [Foods] {

        return foodsDataArray
    }
    
    private var goodsDataArray: [Goods] = []
    
    func makeGoodsData() {
        goodsDataArray = [Goods(kindImage: UIImage(named: "패키지티")!, kindKo: "패키지 티", kindEn: "Packaged Tea"),
                          Goods(kindImage: UIImage(named: "패키지티")!, kindKo: "패키지 티", kindEn: "Packaged Tea"),
                          Goods(kindImage: UIImage(named: "패키지티")!, kindKo: "패키지 티", kindEn: "Packaged Tea"),
                          Goods(kindImage: UIImage(named: "패키지티")!, kindKo: "패키지 티", kindEn: "Packaged Tea"),
                          Goods(kindImage: UIImage(named: "패키지티")!, kindKo: "패키지 티", kindEn: "Packaged Tea"),
                          Goods(kindImage: UIImage(named: "패키지티")!, kindKo: "패키지 티", kindEn: "Packaged Tea"),
                          Goods(kindImage: UIImage(named: "패키지티")!, kindKo: "패키지 티", kindEn: "Packaged Tea"),
                          Goods(kindImage: UIImage(named: "패키지티")!, kindKo: "패키지 티", kindEn: "Packaged Tea")
                          
                                                                     
           ]
    }
    
    func getGoodsData() -> [Goods] {

        return goodsDataArray
    }
}
