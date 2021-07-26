//
//  Car.swift
//  4L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 22.07.2021.
//

import Foundation

class Car {
    
    let brand: String
    let carType: CarType
    let carColor: String
    let passengerCount: Int
    let fuelType: String
    let haveGoodSoundBar: Bool
    var isStartEngine: Bool

    init (carType: CarType, carColor: String, passengerCount: Int, brand: String) {
        self.carType = carType
        self.carColor = carColor
        self.brand = brand
        self.passengerCount = passengerCount
        switch carType {
        case .sportCar:
            fuelType = "Высокооктановый бензин"
            haveGoodSoundBar = true
        case .truck:
            fuelType = "Дизель"
            haveGoodSoundBar = false
        case .bus:
            fuelType = "Газ"
            haveGoodSoundBar = false
        }
        isStartEngine = false
    }
    
    func getInformation() {
        print("\nМодель транспорта: \(brand), \nВид: \(carType.name), \nКоличество посадочных мест: \(passengerCount), \nДвигатель: \(isStartEngine ? "Заведён" : "Заглушен"), \nВид топлива: \(fuelType), \nЦвет: \(carColor)")
    }
    
    func startCarAction(carAction: CarAction) {
        
    }
}
