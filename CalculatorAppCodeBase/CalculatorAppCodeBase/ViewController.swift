//
//  ViewController.swift
//  CalculatorAppCodeBase
//
//  Created by ByonJoonYoung on 3/28/25.
//

import UIKit

class ViewController: UIViewController {
    private var resultNumber = 12345 // Int
    let resultLabel = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.backgroundColor = .black

        resultLabel.text = "\(resultLabel)" // 스트링 인터폴레이션으로 정수 담기
        resultLabel.textColor = .white
        resultLabel.textAlignment = .right
        resultLabel.font = .boldSystemFont(ofSize: 60)

        resultLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(resultLabel)

        NSLayoutConstraint.activate([ // 스냅킷 없이 기본 코드로 진행 (긴 코드 연습..)
            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            resultLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            resultLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            resultLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200)
        ])
    }
}

