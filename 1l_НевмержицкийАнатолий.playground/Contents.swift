import Foundation
// Задание №1
// 3x^2-14x-5 = 0

let a: Double = 3
let b: Double = -14
let c: Double = -5
let discriminant = (pow(b, 2)) - (4 * a * c)
if discriminant > 0 {
    let sqrtDisc = sqrt(Double(discriminant))
    let x1 = (-b + sqrtDisc) / (2 * a)
    let x2 = (-b - sqrtDisc) / (2 * a)
    
    print ("X1 = \(x1), X2 = \(x2)")
}
else if discriminant == 0 {
    let x = (-b) / (2*a)
    print ("x = \(x)")
}
else {
    print ("нет решения уравнения")
}

// Задание №2
// Треугольник ABC: AB = 12, AC = 5, BC = ?

let ab = 12
let ac = 5
let bc = Int(sqrt(Double(ab * ab) + Double(ac * ac)))
let perimetr = ac + ab + bc
let square = (ac * ab) / 2

print ("Гипотенуза равна \(bc), периметр равен \(perimetr), площадь равна \(square)")

// Задание №3
    // Сумма вклада 100 000, процент 5%, 5 лет

let price: Double = 100000
let percentPerYear: Double = 5
let allDays = ((5 * 365)) // Количество дней за 5 лет

let summOfEndTerm = price * pow((1 + (percentPerYear/100)/365), Double(allDays))
print ("К концу вклада на счету при условии ежедневной капитализации будет \(summOfEndTerm)")

    // Проверка циклом
var summ: Double = 100000
var i = 0
while i < 5 {
    summ += summ * (percentPerYear/100)
    i += 1
}
print ("Сумма вклада на счету при ежегодной капитализации - \(summ)")
