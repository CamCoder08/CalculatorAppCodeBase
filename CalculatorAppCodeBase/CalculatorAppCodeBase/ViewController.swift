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
        let buttons = makeButton(titles: ["7", "8", "9", "+"])
        makeHorizontalStackView(buttons) // 함수를 사용하지 않아서 노란색 경고 (빌드 문제 없음)
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

    // 버튼 생성 함수
    private func makeButton(titles: [String]) -> [UIButton] {
        var arrButton: [UIButton] = []
        for title in titles { // 버튼 생성 반복문
            let button = UIButton() // 버튼
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)

            button.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                        button.heightAnchor.constraint(equalToConstant: 80),
                        button.widthAnchor.constraint(equalToConstant: 80)
                    ])
            arrButton.append(button) // 생성된 버튼 배열에 추가
        }
        return arrButton
    }

    // 수평 StackView 생성 함수
    private func makeHorizontalStackView(_ buttonArray: [UIButton]) -> UIStackView {
        let stackView = UIStackView() // StackView 생성
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        // UIButton 배열의 인덱스를 각각 꺼내서 stackView에 넣기
        for button in buttonArray {
            stackView.addArrangedSubview(button)
        } // for.Each문 활용해보기

        self.view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 80),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return stackView
    }
}
