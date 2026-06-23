//
//  LoginViewController.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 4/6/26.
//

import UIKit
import SnapKit

class LoginViewController_Snapkit: UIViewController {
    
    private let loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "login.jpg")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.placeholder = "아이디"
        textField.font = .boldSystemFont(ofSize: 14)
        return textField
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.placeholder = "비밀번호"
        textField.font = .boldSystemFont(ofSize: 14)
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [titleLabel, idTextField, pwTextField, loginButton].forEach{self.view.addSubview($0)}
    }
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(169)
            $0.leading.trailing.equalToSuperview().inset(65)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(66)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(302)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
    }
    
    @objc
    private func loginButtonTapped() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.setLabelText(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

//#Preview {
//  LoginViewController_AutoLayout()
//}
