//
//  LoginViewController.swift
//  KHULibrary
//
//  Created by 김소현 on 3/6/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private let idLabel: UILabel = UILabel()
    private let idTextField = UITextField()
    
    private let passwordLabel: UILabel = UILabel()
    private let passwordTextField = UITextField()

    private var loginButton: UIButton = UIButton()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        idTextField.setUnderLine(lineColor: UIColor.TEXTGray)
        passwordTextField.setUnderLine(lineColor: UIColor.TEXTGray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "로그인"
        
        [idLabel, idTextField, passwordLabel, passwordTextField, loginButton].forEach { view.addSubview($0) }
        
        setupLabelLayout()
        setupTextFieldLayout()
        setupButtonLayout()
        configureLayout()
        
        idTextField.becomeFirstResponder()
    }
    
    private func setupLabelLayout() {
        idLabel.text = "아이디"
        idLabel.font = .systemFont(ofSize: CGFloat(17), weight: .bold)
        idLabel.textColor = .black
        
        passwordLabel.text = "비밀번호"
        passwordLabel.font = .systemFont(ofSize: CGFloat(17), weight: .bold)
        passwordLabel.textColor = .black
    }
    
    private func setupTextFieldLayout() {
        idTextField.placeholder = "인포21 아이디를 입력해주세요"
        idTextField.textColor = UIColor.TEXTGray
        
        passwordTextField.placeholder = "인포21 비밀번호를 입력해주세요"
        passwordTextField.textColor = UIColor.TEXTGray
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setupButtonLayout() {
        loginButton.setRooundedButton(title: "로그인",
                                      titleSize: 19,
                                      titleColor: .white,
                                      backgroundColor: UIColor.KHURed,
                                      radius: 15)
    }
    
    private func configureLayout() {
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.leading.equalToSuperview().inset(24)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(idLabel).offset(30)
            make.leading.equalTo(idLabel)
            make.width.equalTo(320)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(idTextField).offset(70)
            make.leading.equalTo(idLabel)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel).offset(30)
            make.leading.equalTo(idLabel)
            make.width.equalTo(320)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(327)
            make.height.equalTo(50)
        }
    }
}
