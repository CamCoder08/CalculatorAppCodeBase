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
        let buttons: [[UIButton]] = makeButton(titles:[["7", "8", "9", "+"],
                                                       ["4", "5", "6", "-"],
                                                       ["1", "2", "3", "*"],
                                                       ["AC", "0", "=", "/"]])
        let verticalStackView: [UIStackView] = makeHorizontalStackView(buttons)
        makeVerticalStackView(verticalStackView)

        //        makeHorizontalStackView(buttons) // 함수를 사용하지 않아서 노란색 경고 (빌드 문제 없음)
        //        makeVerticalStackView
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
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
                                    ])

    }
    // 버튼 생성 함수
    func makeButton(titles: [[String]]) -> [[UIButton]] {
        var arrButton: [[UIButton]] = []
        for arrTitles in titles {
            var arrButtons: [UIButton] = []
            for title in arrTitles { // 버튼 생성 반복문
                let button: UIButton = UIButton() // 버튼
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)

                button.translatesAutoresizingMaskIntoConstraints = false

                NSLayoutConstraint.activate([
                    button.heightAnchor.constraint(equalToConstant: 80),
                    button.widthAnchor.constraint(equalToConstant: 80)
                ])
                arrButtons.append(button) // 생성된 버튼 배열에 추가
            }
            arrButton.append(arrButtons)
        }
        return arrButton
    }

    // 수평 StackView 생성 함수 (수평 스택뷰 4개 생성..?)
    func makeHorizontalStackView(_ buttonArray: [[UIButton]]) -> [UIStackView] {
        var horizontalStackView: [UIStackView] = []

        for horizontalArrButton in buttonArray {
            let stackView = UIStackView() // StackView 생성
            stackView.axis = .horizontal
            stackView.backgroundColor = .black
            stackView.spacing = 10
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false

            for arrbutton in horizontalArrButton {
                stackView.addArrangedSubview(arrbutton)
            }

            horizontalStackView.append(stackView)
        }
        return horizontalStackView

    }

    func makeVerticalStackView(_ numberPad: [UIStackView]) {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually

        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        for arrStackView in numberPad {
            verticalStackView.addArrangedSubview(arrStackView)
        }

        view.addSubview(verticalStackView)

        NSLayoutConstraint.activate([
                    verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                    verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                    verticalStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 60),
                    verticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
                ])
    }
}
