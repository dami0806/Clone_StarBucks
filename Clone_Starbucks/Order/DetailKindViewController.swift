//
//  DetailKindViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/06.
//

import UIKit
import SnapKit
final class DetailKindViewController: UIViewController {
    
    let dataManager = DataManager()
    var drinksDataArray: [Drinks] = []
    var foodsDataArray: [Foods] = []
    var goodsDataArray: [Goods] = []
    // 전화면에서 Movie데이터를 전달 받기 위한 변수
    var drinksData: Drinks?
    var foodsData: Foods?
    var goodsData: Goods?
    var titleString: String = ""
    var allMenuIndex : Int = 0
    private lazy var tableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .brown
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        setNaviItem()
        title = titleString
        setupData()
      
    }
    private func setupData(){
        dataManager.makeDetailDrinksData()// 데이터 초기화
        drinksDataArray = dataManager.getDetailDrinksData()
        dataManager.makeFoodsData()
        foodsDataArray = dataManager.getFoodsData()
        dataManager.makeGoodsData()
        goodsDataArray = dataManager.getGoodsData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailKindTableViewCell.self, forCellReuseIdentifier: "DetailKindCell")
    }
    
    private func setupUI() {
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
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
     

        
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        searchButton.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc func searchButtonTapped() {
        // 돋보기 버튼이 탭되었을 때의 동작 처리
    }
}
extension DetailKindViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            navigationItem.largeTitleDisplayMode = .never
        } else {
            navigationItem.largeTitleDisplayMode = .always
        }
    }
    
}
extension DetailKindViewController :UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if allMenuIndex == 0 {
            return drinksDataArray.count
        } else if allMenuIndex == 1 {
            return foodsDataArray.count
        } else {
            return goodsDataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailKindCell", for: indexPath) as! DetailKindTableViewCell
  
     
        switch allMenuIndex {
        case 0:
            cell.image.image = drinksDataArray[indexPath.row].drinkImage
            cell.nameKo.text = drinksDataArray[indexPath.row].drinkKo
            cell.nameEn.text = drinksDataArray[indexPath.row].drinkEn
            cell.price.text = "\(drinksDataArray[indexPath.row].price)원"
        case 1:
            cell.image.image = foodsDataArray[indexPath.row].foodsImage
            cell.nameKo.text = foodsDataArray[indexPath.row].foodsKo
            cell.nameEn.text = foodsDataArray[indexPath.row].foodsEn
        default:
            cell.image.image = goodsDataArray[indexPath.row].kindImage
            cell.nameKo.text = goodsDataArray[indexPath.row].kindKo
            cell.nameEn.text = goodsDataArray[indexPath.row].kindEn
            break
        }
      
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let detailMenuVC = DetailMenuViewController()
        //detailMenuVC.allMenuIndex = allMenuIndex
        
//        switch allMenuIndex {
//        case 0:
//        detailVC.drinksData = drinksDataArray[indexPath.row]
//        detailVC.titleString = drinksDataArray[indexPath.row].drinkKo
//        case 1:
//            detailVC.foodsData = foodsDataArray[indexPath.row]
//            detailVC.titleString = foodsDataArray[indexPath.row].foodsKo
//        default:
//            detailVC.goodsData = goodsDataArray[indexPath.row]
//            detailVC.titleString = goodsDataArray[indexPath.row].kindKo
//            break
//        }
        navigationController?.pushViewController(detailMenuVC, animated: true)
    }
    
}
import SwiftUI
struct VCPreViewDetailKindViewController:PreviewProvider {
    static var previews: some View {
        DetailKindViewController().toPreview().previewDevice("iPhone 14 Pro")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}
struct VCPreViewDetailKindViewController2:PreviewProvider {
    static var previews: some View {
        DetailKindViewController().toPreview().previewDevice("iPhone 11")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}


