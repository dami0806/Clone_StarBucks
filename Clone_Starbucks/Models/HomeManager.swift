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
    
    private var homeWhatsNewDataArray: [HomeWhatsNewItem] = []
    
    func makeHomeWhatsNewData() {
        homeWhatsNewDataArray = [
            HomeWhatsNewItem(image: UIImage(named: "Home_What'sNew1"), title: "스타벅스 서머 버디 위크", subTitle: "청량감 넘치는 신규 글라스 상품과 구매 혜택을 만나보세요."),
            HomeWhatsNewItem(image: UIImage(named: "Home_What'sNew2"), title: "갤럭시북3 스타벅스 콜라보 기념 이벤트", subTitle: "갤럭시북3 스타벅스 콜라보 기념 이벤트"),
            HomeWhatsNewItem(image: UIImage(named: "Home_What'sNew3"), title: "BLACKPINK + STARBUCKS 프로모션", subTitle: "전 세계를 사로잡은 블랙핑크와 스타벅스의 특별한 만남을 소개합니다."),
            HomeWhatsNewItem(image: UIImage(named: "Home_What'sNew4"), title: "7월 20일,트렌타 한정 출시", subTitle: "한정 기간 판매되는 트렌타 음료를 지금 바로 만나보세요."),
            HomeWhatsNewItem(image: UIImage(named: "Home_What'sNew5"), title: "7월 18일~7월 31일 별 추가 증정 이벤트", subTitle: "2만원 이상 결제 시, 별 3개를 추가로 드립니다."),
            HomeWhatsNewItem(image: UIImage(named: "Home_What'sNew6"), title: "7월 18일~7월 31일 투 고 백 아메리카노 쿠폰 증정 이벤트", subTitle: "투 고 백 구매하시면, 아메리카노 쿠폰을 한 장 드립니다."),
            HomeWhatsNewItem(image: UIImage(named: "Home_What'sNew7"), title: "만원 별 적립 이벤트", subTitle: "결제 금액 1만원당 별 1개 추가 적립!"),
        ]
    }
    func getHomeWhatsNewData() -> [HomeWhatsNewItem] {
        
        return homeWhatsNewDataArray
    }
    
}
