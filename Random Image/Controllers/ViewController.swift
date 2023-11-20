//
//  ViewController.swift
//  Random Image
//
//  Created by Janabil on 20.11.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var generateImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
        

    //MARK: - Setup View
    private func setupView() {
        [imageView, generateImageButton].forEach {
            view.addSubview($0)
        }
    }
    
    //MARK: - Setup Constraints
    private func setupConstraints() {
        imageView.snp.makeConstraints {make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        generateImageButton.snp.makeConstraints {make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        generateImageButton.layer.cornerRadius = 20
        imageView.layer.cornerRadius = 30
    }
    
    //MARK: - Actions

}

