//
//  WelcomeController.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 4/7/26.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private var userId: String?
    
    private let welcomeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "welcome")
        imageView.contentMode = .scaleAspectFit // 이미지 표시 방식 설정 - 원본 비율 유지
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 115, y: 295, width: 145, height: 60))
        label.text = "???님\n반가워요!"
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true // 텍스트가 UILabel 너비 초과할 때 폰트 크기 줄여 맞춤
        label.minimumScaleFactor = 0.5 // 폰트 크기 50%까지 줄일 수 있음
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 3
        return button
    }()

    private let backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.backgroundColor = .grey200
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(backToLoginTapped), for: .touchUpInside)
        return button
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: CGRect(x: 40, y: 600, width: 0, height: 0))
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    func setLabelText(id: String?) {
        self.userId = id
        
        // Optional Binding - if let
//        if let id = id {
//            welcomeLabel.text = "\(id)님\n반가워요!"
//        } else {
//            welcomeLabel.text = "값이 없습니다."
//        }

        // Optional Binding - guard let
        guard let id = id else {
            welcomeLabel.text = "값이 없습니다."
            return
        }
        welcomeLabel.text = "\(id)님\n반가워요!"
    }
    
    private func setLayout() {
        [welcomeImageView, welcomeLabel, mainButton, backToLoginButton, datePicker].forEach{self.view.addSubview($0)}
    }

    @objc
    private func backToLoginTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
