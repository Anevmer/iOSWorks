import Foundation

// MARK: Задание №1: Четное или не четное

func checkIsEvenNumber(number: Int) -> Bool {
    return number.isMultiple(of: 2)
}

print (checkIsEvenNumber(number: 47) ? "Четное" : "Нечетное")

// MARK: Задание №2: Деление без остатка на 3

func isDivisionOneTree (number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    } else {
        return false
    }
}

print (isDivisionOneTree(number: 15) ? "Делится на 3" : "Не делится на 3")

// MARK: Задание №3: Возрастающий массив от 1 до 100

var array: [Int] = []
for num in 1...100 {
    array.append(num)
}
print ("Массив из 100 чисел порядке возрастания:", array)

// MARK: Задание №4: Удаление четных чисел и чисел некратных 3

var newArray: [Int] = []
for number in array {
    if checkIsEvenNumber(number: number) == false, isDivisionOneTree(number: number) == true {
        newArray.append(number)
    }
}
array = newArray // Удаление чисел путём присвоения нового значения
print("Массив без четных и чисел некратных 3:", array)

// MARK: Задание №5:  Добавление чисел в массив чисел Фибоначчи

func addedFibonacciNumber(withArray array: [Int]) -> [Int] {
    var newArray: [Int] = []
    newArray = array
    if newArray.count > 1 {
        let lastElement = newArray[array.count - 1]
        let penultimateElement = newArray[array.count - 2]
        newArray.append(lastElement + penultimateElement)
    } else if newArray.count == 1 {
        if let firstElement = newArray.first, firstElement != 0 {
            newArray.insert(0, at: 0)
        } else {
            newArray.append(1)
        }
    } else {
        newArray.append(0)
    }
    return newArray
}

//var secondaryArray: [Int] = []
var secondaryArray = [0, 1]

var counter = 0
while counter < 50 {
//    array = addedFibonacciNumber(withArray: array)
    secondaryArray = addedFibonacciNumber(withArray: secondaryArray)
    counter += 1
}
//print(array)
print("Маассив в который добавлены 50 чисел рассчитаных как последовательность Фибоначчи ", secondaryArray)

// MARK: Задание №6: Добавление в массив простых чисел

func getIntegerNumbersFromTwo(withMaxValue value: Int) -> [Int] {
    var array: [Int] = []
    for num in 2...value {
        array.append(num)
    }
    return array
}

var p = 2    // переменная равна первому простому числу
let n = 600   // число до которого нужно выписать все простые числа
var primeNumbers = getIntegerNumbersFromTwo(withMaxValue: n)
while p < n {
    for i in stride(from: p, through: n, by: p) {
        for (index, num) in primeNumbers.enumerated() {
            if num == i + p {
                primeNumbers.remove(at: index)
            }
        }
    }
    p = primeNumbers.first(where: { $0 > p }) ?? n
}
print ("Массив из простых чисел:", primeNumbers)

// Наполнение массива из 100 чисел различными простыми числами

while array.count < 100 {
    let randomIndex = Int.random(in: 0...primeNumbers.count - 1)
    array.append(primeNumbers[randomIndex])
}
print ("Заполненный массив из 100 чисел различными простыми числами:", array)
