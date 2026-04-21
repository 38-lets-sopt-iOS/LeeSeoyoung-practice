//
//  AutoLayout_Practice.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 4/11/26.
//

import UIKit

class AutoLayout_Practice: UIViewController {
    
    private let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    private let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    private let view3: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    private let view4: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [view1, view2, view3, view4].forEach{self.view.addSubview($0)}
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        view4.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setLayout() {
        let width = UIScreen.main.bounds.width/2
        let height = UIScreen.main.bounds.height/4
        //TODO
        NSLayoutConstraint.activate([view1.topAnchor.constraint(equalTo: view.topAnchor),
                                     view1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     view1.widthAnchor.constraint(equalToConstant: width),
                                     view1.heightAnchor.constraint(equalToConstant: height)])
        NSLayoutConstraint.activate([view2.topAnchor.constraint(equalTo: view1.bottomAnchor),
                                     view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor),
                                     view2.widthAnchor.constraint(equalToConstant: width),
                                     view2.heightAnchor.constraint(equalToConstant: height)])
        NSLayoutConstraint.activate([view3.topAnchor.constraint(equalTo: view2.bottomAnchor),
                                     view3.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
                                     view3.widthAnchor.constraint(equalToConstant: width),
                                     view3.heightAnchor.constraint(equalToConstant: height)])
        NSLayoutConstraint.activate([view4.topAnchor.constraint(equalTo: view3.bottomAnchor),
                                     view4.leadingAnchor.constraint(equalTo: view1.trailingAnchor),
                                     view4.widthAnchor.constraint(equalToConstant: width),
                                     view4.heightAnchor.constraint(equalToConstant: height)])
        
    }
}
