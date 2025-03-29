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
        configure() // 수식 표시
        makeHorizontalStackView() // 스택뷰
    }

    private func configure() {
        view.backgroundColor = .black

        resultLabel.text = "\(resultNumber)" // 스트링 인터폴레이션으로 정수 담기
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

    private func makeButton(title: String) -> UIButton { // 버튼 생성 함수
        //            for title in arrTitle    {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])

        return button

    }

    private func makeHorizontalStackView() { // 수평 생성 함수

        let button7 = makeButton(title: "7")
        var button8 = makeButton(title: "8")
        var button9 = makeButton(title: "9")
        var plusbButton = makeButton(title: "+")
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(button7)
        stackView.addArrangedSubview(button8)
        stackView.addArrangedSubview(button9)
        stackView.addArrangedSubview(plusbButton)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 80),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
