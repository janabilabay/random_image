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
        button.addTarget(self, action: #selector(didTapDutton), for: .touchUpInside)
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
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
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
        getRandomImage()
        
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        generateImageButton.layer.cornerRadius = 20
        imageView.layer.cornerRadius = 30
    }
    
    //MARK: - Actions
    private func getRandomImage() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Failed to download image: \(error?.localizedDescription ?? "Error")")
                return
            }

            DispatchQueue.main.async {
                self.imageView.contentMode = .scaleAspectFill
                self.imageView.clipsToBounds = true
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
    @objc private func didTapDutton() {
        getRandomImage()
    }
}

