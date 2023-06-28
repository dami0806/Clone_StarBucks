//
//  HomeViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UIScrollViewDelegate{
    
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        scrollView.delegate = self
        view.addSubview(scrollView)
        return scrollView
    }()
    private lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .green
       // scrollView.addSubview(view)
        return view
    }()
    private lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
       // scrollView.addSubview(view)
        return view
    }()
    private lazy var view3: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        //scrollView.addSubview(view)
        
        return view
    }()
    private lazy var view4: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
      //  scrollView.addSubview(view)
        return view
    }()
    private lazy var view5: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        //scrollView.addSubview(view)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    func makeUI(){
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(view1)
        scrollView.addSubview(view2)
        scrollView.addSubview(view3)
        scrollView.addSubview(view4)
        scrollView.addSubview(view5)

        
        view1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview()
        }
        view2.snp.makeConstraints { make in
            make.top.equalTo(view1.snp.bottom)
            make.height.equalTo(200)
            make.leading.trailing.equalToSuperview()
        }
        view3.snp.makeConstraints { make in
            make.top.equalTo(view2.snp.bottom)
            make.height.equalTo(200)
            make.leading.trailing.equalToSuperview()
        }
        view4.snp.makeConstraints { make in
            make.top.equalTo(view3.snp.bottom)
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview()
        }
        view5.snp.makeConstraints { make in
            make.top.equalTo(view4.snp.bottom)
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
  
}
