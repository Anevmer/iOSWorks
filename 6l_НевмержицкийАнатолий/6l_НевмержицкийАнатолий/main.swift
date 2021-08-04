//
//  main.swift
//  6l_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 04.08.2021.
//

import Foundation

var cars = Queue<SportCar>()

cars.addElement(SportCar(
                    brand: "Toyota",
                    model: "Supra",
                    price: 2000000))

cars.addElement(SportCar(
                    brand: "Lamborgini",
                    model: "Galardo",
                    price: 4000000))

cars.addElement(SportCar(
                    brand: "Mitsubishi",
                    model: "Lancer",
                    price: 3000000))

cars.addElement(SportCar(
                    brand: "Mazda",
                    model: "RX 7",
                    price: 1500000))


print("Существующие марки авто: \(cars.brands)")
let filteredCars = cars.getCarPriceTo(price: 3000000)
print ("Марки до 3 000 000")
for car in filteredCars {
    print(car.brand, car.model)
}
if let removeCar = cars.removeLastElement() {
    print("Продан: \(removeCar.brand) \(removeCar.model) \nОставшиеся марки авто: \(cars.brands)")
}
