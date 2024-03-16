//
//  LoginViewController.swift
//  KHULibrary
//
//  Created by 김소현 on 3/6/24.
//

import UIKit
import SnapKit
import SwiftSoup

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
        crawl()
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
        
        loginButton.addTarget(self, action: #selector(loginButtonButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonButtonTapped() {
        // TODO: UserDefualts에 값 저장 
        self.navigationController?.pushViewController(RootViewController(), animated: true)
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

extension LoginViewController {
    func crawl(){
        guard let url = URL(string: "https://lib.khu.ac.kr/login") else {
            return
        }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            let headerTitle = try doc.title()
            print(headerTitle)
            
            guard let formElement = try doc.select("form#login").first() else {
                   print("Login form not found")
                   return
               }
            
            let info21ID = "info21ID"
            let info21Password = "info21Password!"
            
             guard let usernameField = try formElement.select("input[name=id]").first(),
                   let passwordField = try formElement.select("input[name=password]").first(),
                   let submitButton = try formElement.select("button[type=submit]").first() else {
                 print("Login form fields not found")
                 return
             }
            
            try usernameField.val(info21ID)
            try passwordField.val(info21Password)
            
            // 로그인 요청을 위한 폼 데이터 수집 및 직렬화
            var formData = [String: String]()
            try formElement.select("input").forEach { inputElement in
                let key = try inputElement.attr("name")
                let value = try inputElement.val()
                formData[key] = value
            }
            let encodedFormData = formData.map { "\($0.key)=\($0.value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)" }.joined(separator: "&")
            let requestBodyData = encodedFormData.data(using: .utf8)
 
            // 로그인 요청
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = requestBodyData
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            // 로그인 요청 전송
            let session = URLSession.shared
            session.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                // 로그인 후 페이지의 HTML 가져오기
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    if let resultHtml = String(data: data, encoding: .utf8) {
//                        print(resultHtml)
                    }
                }
            }.resume()
            
        } catch Exception.Error(_, let message) {
            print("Message: \(message)")
        } catch {
            print("error")
        }
    }
}
