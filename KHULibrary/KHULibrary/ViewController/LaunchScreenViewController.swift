//
//  LaunchScreenViewController.swift
//  KHULibrary
//
//  Created by 김소현 on 3/6/24.
//

import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController {
    private let logoImage = UIImageView(image: UIImage(named: "LogoIcon"))
    private let mainLabel = UILabel()
    private let subLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        [mainLabel, subLabel, logoImage].forEach { view.addSubview($0) }
        
        configureLabelLayout()
        configureLayout()
    }
    
    private func configureLabelLayout() {
        mainLabel.text = "KHU LIB"
        mainLabel.textColor = UIColor(hexCode: "223058")
        
        let roundedFontDescriptor = UIFont.systemFont(ofSize: CGFloat(50), weight: .black).fontDescriptor.withDesign(.rounded)
        let roundedFont = UIFont(descriptor: roundedFontDescriptor ?? .init(), size: 50)

        mainLabel.font = roundedFont
        
        subLabel.text = "KyungHee Library app"
        subLabel.textColor = UIColor(hexCode: "1D3C97")
        subLabel.font = .systemFont(ofSize: CGFloat(24), weight: .light)
    }
    
    private func configureLayout() {
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(215)
            make.centerX.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
    }
}
