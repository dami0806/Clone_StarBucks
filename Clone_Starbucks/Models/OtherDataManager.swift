//
//  OtherDataManager.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/16.
//

import Foundation
import UIKit

class OtherDataManager{
    private var otherDataArray: [OtherSection] = []
    
    func makeOtherData() {
        otherDataArray = [
            OtherSection(headerTitle: nil, items: [OtherItem(image: .none, text: "")]),
            OtherSection(headerTitle: "Pay", items: [
                OtherItem(image: UIImage(named: "스타벅스 카드 등록"), text: "스타벅스 카드 등록"),
                OtherItem(image: UIImage(named: "카드 교환권 등록"), text: "카드 교환권 등록"),
                OtherItem(image: UIImage(named: "쿠폰 등록"), text: "쿠폰 등록"),
                OtherItem(image: UIImage(named: "쿠폰 히스토리"), text: "쿠폰 히스토리")
                
            ]),
            OtherSection(headerTitle: "Order", items: [
                OtherItem(image: UIImage(named: "장바구니"), text: "장바구니"),
                OtherItem(image: UIImage(named: "홀케이크 예약"), text: "홀케이크 예약"),
                OtherItem(image: UIImage(named: "히스토리"), text: "히스토리")
            ]),
            OtherSection(headerTitle: "Shop", items: [
                OtherItem(image: UIImage(named: "온라인 스토어 주문내역"), text: "온라인 스토어 \n주문내역"),
                OtherItem(image: UIImage(named: "e-Gift Card 선물함"), text: "e-Gift Card \n선물함"),
                OtherItem(image: UIImage(named: "e-Gift Card 선물내역"), text: "e-Gift Card \n선물내역")
            ]),
            OtherSection(headerTitle: "Delivers", items: [
                OtherItem(image: UIImage(named: "주문하기"), text: "주문하기"),
                OtherItem(image: UIImage(named: "장바구니"), text: "장바구니"),
                OtherItem(image: UIImage(named: "히스토리"), text: "배달완료 히스토리"),
                OtherItem(image: UIImage(named: "단체 주문 배달"), text: "단체 주문 배달"),
               
            ]),
            OtherSection(headerTitle: "고객지원", items: [
                OtherItem(image: UIImage(named: "스토어 케어"), text: "스토어 케어"),
                OtherItem(image: UIImage(named: "고객의 소리"), text: "고객의 소리"),
                OtherItem(image: UIImage(named: "매장 정보"), text: "매장 정보"),
                OtherItem(image: UIImage(named: "반납기 정보"), text: "반납기 정보"),
                OtherItem(image: UIImage(named: "마이 스타벅스 리뷰"), text: "마이 스타벅스 리뷰")
            ]),
            
            
            
        ] }
    
    func getOtherData() -> [OtherSection] {
        return otherDataArray
    }
    //
    private var otherWelcomeDataArray: [OtherItem] = []

    func makeOtherWelcomeData() {
        otherWelcomeDataArray = [
            OtherItem(image: UIImage(named: "별 히스토리"), text: "별 히스토리"),
            OtherItem(image: UIImage(named: "전자영수증"), text: "전자영수증"),
            OtherItem(image: UIImage(named: "개인정보 관리"), text: "개인정보 관리"),
            OtherItem(image: UIImage(named: "계정정보"), text: "계정정보"),
            OtherItem(image: UIImage(named: "나만의 메뉴"), text: "나만의 메뉴"),
        ]
 
            
        }
    
    func getOtherWelcomeData() -> [OtherItem] {
        
        return otherWelcomeDataArray
    }
}
