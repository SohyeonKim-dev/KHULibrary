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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "로그인"
        
        configureLayout()

    }
    
    private func configureLayout() {
        
    }
}
