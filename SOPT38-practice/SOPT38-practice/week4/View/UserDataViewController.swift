//
//  UserDataViewController.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import UIKit

import Then
import SnapKit

final class UserDataViewController: UIViewController {
    private var userData: [UserInfoData] = []

    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    private lazy var editButton = UIButton()
    
    var userId: Int = 0
    private var id: String = ""
    private var password: String = ""
    private var name: String = ""
    private var email: String = ""
    private var age: Int = 0
    private var part: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
        fetchUserData()
    }
    
    private func setUI() {
        self.view.addSubviews(
            titleLabel, idTextField, nameTextField, emailTextField, ageTextField, partTextField, editButton
        )
    }
        
    private func setStyle() {
        view.backgroundColor = .white
        
        let placeholder = ["이름", "이메일", "나이"]
        
        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font = .systemFont(ofSize: 24, weight: .bold)
        }
        
        [nameTextField, emailTextField, ageTextField]
            .enumerated()
            .forEach { index, textField in
                textField.do {
                    $0.addLeftPadding()
                    $0.placeholder = placeholder[index]
                    $0.borderStyle = .roundedRect
                    $0.autocapitalizationType = .none
                    $0.autocorrectionType = .no
                    $0.spellCheckingType = .no
                }
            }
        
        [idTextField, partTextField]
            .enumerated()
            .forEach { index, textField in
                textField.do {
                    $0.addLeftPadding()
                    $0.borderStyle = .roundedRect
                    $0.isEnabled = false
                }
            }
            
        editButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
        
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
            
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
            
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
            
        editButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        editButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
    }
    
    private func fetchUserData() {
        Task {
            do {
                let response = try await GetUserDataService.shared.getUserData(userId: userId)
                
                idTextField.text = response.data?.loginId
                nameTextField.text = response.data?.name
                emailTextField.text = response.data?.email
                ageTextField.text = "\(response.data?.age ?? 0)"
                partTextField.text = response.data?.part
                
                name = response.data?.name ?? ""
                email = response.data?.email ?? ""
                age = response.data?.age ?? 0
            } catch {
                print("유저 데이터 조회 실패", error)
            }
        }
    }
}

extension UserDataViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            name = textField.text ?? ""
        case emailTextField:
            email = textField.text ?? ""
        case ageTextField:
            age = Int(textField.text ?? "") ?? 0
        default:
            return
        }
    }
    
    @objc
    private func editButtonDidTap() {
        Task {
            do {
                let _ = try await PatchUserDataService.shared.patchUserData(userId: userId, name: name, email: email, age: age)
                
                print("정보 수정 성공")
                let alert = UIAlertController(
                    title: "유저 정보를 수정했습니다.",
                    message: "수정 완료",
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "정보 수정 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("정보 수정 실패", error)
            }
        }
    }
}
