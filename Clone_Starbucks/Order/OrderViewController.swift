//
//  OrderViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit
import SnapKit
import RxSwift

class OrderViewController: UIViewController,UIScrollViewDelegate {
    var navigationBarHeight: CGFloat = 0 // 기본값을 0으로 설정합니다.
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        //scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    let items = ["전체 메뉴", "나만의 메뉴"]
    var tabBarButtons = [UIButton]()
    var selectedTabIndex = 0
    var buttonWidth : CGFloat = 0
    private lazy var tabBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        // 그림자를 아래로만 보이도록 설정
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        view.layer.shadowRadius = 1.5

        view.layer.masksToBounds = false

        // 그림자가 보일 영역을 설정

        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 50-3, width: self.view.bounds.width , height: 3))
            view.layer.shadowPath = shadowPath.cgPath
        return view
    }()
    
    private lazy var selectedItemBox: UIView = {
        let view = UIView()
        view.backgroundColor = .starbucksGreen
        return view
    }()
    private lazy var selectStoreView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private var viewControllers = [AllMenuViewController(),MyMenuViewController()]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectTab(at: 0, animated: false)
        setNaviItem()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScroll()
        setupTabBar()
        title = "Order"
        print(navigationBarHeight)
        scrollView.delegate = self
        
    }
    private func setNaviItem() {
        // 네비게이션 바 스타일을 설정
        navigationController?.navigationBar.barStyle = .default

        // 네비게이션 바 배경색을 흰색으로 설정
        navigationController?.navigationBar.barTintColor = .white

        // 네비게이션 바의 텍스트 컬러를 흰색으로 설정
        navigationController?.navigationBar.tintColor = .black

        // 네비게이션 바의 타이틀 텍스트 속성을 설정
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        //네비게이션 바의 그림자 없애기
        navigationController?.navigationBar.shadowImage = UIImage()
       

        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        searchButton.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        navigationItem.rightBarButtonItem = searchButton
    }

    @objc func searchButtonTapped() {
        // 돋보기 버튼이 탭되었을 때의 동작 처리
    }
    private func setupScroll(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tabBarView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        changeTitleMode()
        if navigationItem.largeTitleDisplayMode == .always {
            navigationBarHeight = navigationController?.navigationBar.bounds.height ?? 0
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            
            make.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.height - navigationBarHeight - 75)
            print(navigationBarHeight)
            
        }
    }
    
    
    
    private func setupTabBar() {
        // self.view.addSubview(tabBarView)
        tabBarView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(contentView.snp.top).inset(5)
            make.height.equalTo(50)
            
        }
        view.addSubview(selectStoreView)
        selectStoreView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
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
        
        contentView.addSubview(selectedViewController.view)
        selectedViewController.view.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(tabBarView.snp.bottom).offset(3)
            make.width.equalTo(view.bounds.width)
            //                 make.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.height - tabBarView.frame.maxY)
            //                 }
            make.bottom.equalToSuperview()}
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y < -88 {
            scrollView.bounces = true // 스크롤을 위로 올릴 때 바운스 활성화
        } else {
            scrollView.bounces = false // 스크롤을 아래로 내릴 때 바운스 비활성화
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

