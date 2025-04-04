//
//  ViewController.swift
//  CalculatorAppCodeBase
//
//  Created by ByonJoonYoung on 3/28/25.
//

import UIKit

class ViewController: UIViewController {
    private var resultNumber = "" // 빈 문자열
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
    }

    private func configure() {
        view.backgroundColor = .black

        resultLabel.text = "0"  // 스트링 인터폴레이션으로 정수 담기
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
    func makeButton(titles: [[String]]) -> [[UIButton]] { // 스트링 2차원 배열로
        var arrButtons: [[UIButton]] = []
        for arrTitles in titles {
            var arrButton: [UIButton] = []
            for title in arrTitles { // 버튼 생성 반복문
                let button: UIButton = UIButton() // 버튼
                // for문으로 버튼을 생성할 때 if 조건문을 활용하여 +, -, *, /, AC 값이 들어오면 버튼 배경색을 orange로 설정
                if title == "+" || title == "-" || title == "*" || title == "/" || title == "AC" {
                    button.setTitle(title, for: .normal)
                    button.backgroundColor = .orange
                    button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.layer.cornerRadius = 40
                    button.addTarget(self, action: #selector(num), for: .touchDown)

                    NSLayoutConstraint.activate([
                        button.heightAnchor.constraint(equalToConstant: 80),
                        button.widthAnchor.constraint(equalToConstant: 80)
                    ])
                    arrButton.append(button) // 버튼 배열에 추가
                } else {
                    button.setTitle(title, for: .normal)
                    button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                    button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                    button.layer.cornerRadius = 40
                    button.addTarget(self, action: #selector(num), for: .touchDown) // 버튼 활성화

                    button.translatesAutoresizingMaskIntoConstraints = false

                    NSLayoutConstraint.activate([
                        button.heightAnchor.constraint(equalToConstant: 80),
                        button.widthAnchor.constraint(equalToConstant: 80)
                    ])
                    arrButton.append(button) // 버튼 배열에 추가
                }
            }
            arrButtons.append(arrButton) // 버튼 배열을 2차원 버튼 배열에 추가
        }
        return arrButtons
    }

    @objc
    func num(sender: UIButton) { // 파라미터로 버튼 타입을 받음
        guard let stringNumber = sender.currentTitle else { return } // 현재 버튼값을 stringNumber에 담기

        // AC 버튼 처리
        if stringNumber == "AC" {
            resultNumber = "0"
            resultLabel.text = resultNumber
            return
        }

        let operators = ["+", "-", "*", "/"]

        if stringNumber == "=" {
            // 연산자로 끝나는 경우
            if let lastChar = resultNumber.last, operators.contains(String(lastChar)) {
                return // 현재 값의 마지막 문자를 안전하게 추출해서 operator에 담겨있는지 비교 (있느면 리턴)
            }

            if let resultValue = calculate(expression: resultNumber) {
                resultNumber = "\(resultValue)"
            } else {
                return
            }

            resultLabel.text = resultNumber
            return
        }
        // 연산자가 중복되는 경우 방지하기, 가드문 활용해보기
        if let lastChar = resultNumber.last { // 옵셔널 바운딩으로 현재값의 마지막 문자를 안전하게 추출
            guard !operators.contains(stringNumber) || !operators.contains(String(lastChar)) else {
                return //입력된 숫자가 연산자이거나 마지막 현재값의 마지막 숫자가 연산자인 상황을 거짓으로 반전시켜서 실행 막기
            }
        }

        if resultNumber == "0" { // 초기값이 0이라면
            resultNumber = stringNumber // resultNumber을 현재 버튼으로 바꿈
        } else {
            resultNumber += stringNumber // 이후 숫자 버튼이 들어오면 초기값이 0이 아닌 상태라 문자열 더하기
        }

        resultLabel.text = resultNumber
    }

    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression) // 계산된 값을 expression에 저장...?
        if let value = expression.expressionValue(with: nil, context: nil) as? Int {
            return value
        } else {
            return nil
        }
    }

    // 수평 StackView 생성 함수
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
                stackView.addArrangedSubview(arrbutton) // 버튼 4개가 1개의 스택뷰로
            }
            horizontalStackView.append(stackView) // 1개의 스택뷰를 4개의 스택뷰로
        }
        return horizontalStackView
    }

    func makeVerticalStackView(_ numberPad: [UIStackView]) {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually

        for arrStackView in numberPad {
            verticalStackView.addArrangedSubview(arrStackView)
        } // 4개의 스택뷰 2차원배열을 각 하나씩 꺼내서 세로 스택뷰에 넣어주기

        view.addSubview(verticalStackView)

        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            verticalStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 60),
            verticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
