/*
 @objc
 func num(sender: UIButton) {
 guard let stringNumber = sender.currentTitle else { return }

 let operators = ["+", "-", "*", "/"]

 if stringNumber == "=" {
 // 마지막이 연산자로 끝나면 계산하지 않음
 if let lastChar = resultNumber.last, operators.contains(String(lastChar)) {
 return
 }

 if let resultValue = calculate(expression: resultNumber) {
 resultNumber = "\(resultValue)"
 } else {
 return
 }

 resultLabel.text = resultNumber
 return
 }

 // 연산자 연속 입력 방지
 if operators.contains(stringNumber) {
 if let lastChar = resultNumber.last, operators.contains(String(lastChar)) {
 return
 }
 }

 // 0으로 시작하는 숫자 제한 (ex: 2*02 → 방지)
 if let lastChar = resultNumber.last,
 operators.contains(String(lastChar)),
 stringNumber == "0" {
 if resultNumber.hasSuffix("0") {
 return
 }
 }

 if resultNumber == "0" {
 resultNumber = stringNumber
 } else {
 resultNumber += stringNumber
 }

 resultLabel.text = resultNumber
 }



 */
