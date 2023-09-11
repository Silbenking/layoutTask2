//
//  ViewController.swift
//  layoutTask1
//
//  Created by Сергей Сырбу on 10.09.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //- setupLayout - функция расчёта для констрейнтов.
    //- setupAppearance - функция для настройки цветов, шрифтов и всего UI.
    //- setupBehavior - для настройки поведения, нажатия, делегаты и т.д.
    private enum Constants {
        static let titleFontSize: CGFloat = 30
        static let titleLabelOffset: CGFloat = 32
        static let starImageOffset: CGFloat = 32
        static let heigthPopupView: CGFloat = 427
        static let widthPopupView: CGFloat = 343
        static let descriptionFontSize: CGFloat = 16
        static let offset: CGFloat = 16
        static let clickButtonFontSize: CGFloat = 16
        static let clickButtonlOffset: CGFloat = 45
        static let clickButtonlHeight: CGFloat = 51
        static let secondaryFontSize: CGFloat = 16
        static let secondaryOffset: CGFloat = 18

    }
    let popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        return view
    }()
    
    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rate our app"
        label.font = .systemFont(ofSize: Constants.titleFontSize)
        return label
    }()
    
    let descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt."
        textView.font = .systemFont(ofSize: Constants.descriptionFontSize)
        textView.textColor = .systemGray
        textView.textAlignment = .center
        return textView
    }()
    
    let iLoveItButton: UIButton = {
        let button = UIButton()
        button.setTitle("I love it!", for: .normal)
        button.backgroundColor = UIColor(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: Constants.clickButtonFontSize)
        button.layer.cornerRadius = 25
        return button
    }()
    
    let secondoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Don’t like the app? Let us know."
        label.font = .systemFont(ofSize: Constants.secondaryFontSize)
        label.textColor = UIColor(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupLayout()
        setupBehavior()
    }
    private func setupLayout() {
        view.addSubview(popupView)
        popupView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: Constants.widthPopupView, height: Constants.heigthPopupView))
            make.center.equalToSuperview()
        }
        popupView.addSubview(starImage)
        starImage.snp.makeConstraints { make in
            make.top.equalTo(popupView.snp.top).offset(Constants.starImageOffset)
            make.centerX.equalTo(popupView)
        }
        popupView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(starImage.snp.bottom).offset(Constants.titleLabelOffset)
            make.centerX.equalTo(popupView)
        }
        popupView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.offset)
            make.trailing.leading.equalTo(popupView).inset(Constants.offset)
            make.height.equalTo(122)

        }
        popupView.addSubview(iLoveItButton)
        iLoveItButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(Constants.clickButtonlOffset)
            make.height.equalTo(Constants.clickButtonlHeight)
            make.trailing.leading.equalTo(popupView).inset(Constants.offset)
        }
        popupView.addSubview(secondoryLabel)
        secondoryLabel.snp.makeConstraints { make in
            make.top.equalTo(iLoveItButton.snp.bottom).offset(Constants.secondaryOffset)
            make.trailing.leading.equalTo(popupView).inset(Constants.offset)
        }
        
    }
    private func setupAppearance() {
        view.backgroundColor = UIColor(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
    }
    private func setupBehavior(){
        iLoveItButton.addTarget(self, action:#selector(tap), for: .touchUpInside)
    }
    
    @objc func tap() {
        print("tap tap")
    }
}

