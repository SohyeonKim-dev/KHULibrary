//
//  RootViewController.swift
//  KHULibrary
//
//  Created by 김소현 on 3/5/24.
//

import UIKit
import SnapKit

class RootViewController: UIViewController {
    private let logoImage = UIImageView(image: UIImage(named: "LogoIcon"))
    private let logoLabel = UILabel()
    private var settingButton = UIButton()
    
    private var reserveButton = UIButton()
    private var seatButton = UIButton()
    private var searchButton = UIButton()
    
    private var qrcodeModalButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        [logoImage, logoLabel, settingButton, reserveButton, seatButton, searchButton, qrcodeModalButton].forEach { view.addSubview($0) }
        
        setupImageLayout()
        setupLabelLayout()
        setupButtonLayout()
        configureLayout()
    }
    
    private func setupImageLayout() {
        
    }
    
    private func setupLabelLayout() {
        
    }
    
    private func setupButtonLayout() {
        
    }
    
    // TODO: Button tapped 정의 
    
    private func configureLayout() {
        
    }
}

