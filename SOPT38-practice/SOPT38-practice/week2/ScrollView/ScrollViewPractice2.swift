//
//  ScrollViewPractice2.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 4/11/26.
//

import UIKit
import SnapKit

class ScrollViewPractice2: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach{
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        let width = UIScreen.main.bounds.width/2
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
        }
        orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
        }
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
        }
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
        }
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
    }
}
