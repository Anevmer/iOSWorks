//
//  SportCar.swift
//  5L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 28.07.2021.
//

import Foundation

class SportCar: CarProtocol {
    var brand: String
    var carType: CarType
    var carColor: String
    var passengerCount: Int
    var fuelType: String
    var haveGoodSoundBar: Bool
    var isStartEngine: Bool
    let carPrint: String
    var isHardMusicPlayed: Bool
    
    init(
        carType: CarType = .sportCar,
        carColor: String,
        passengerCount: Int = 1,
        carPrint: String,
        brand: String) {
        self.carType = carType
        self.carColor = carColor
        self.brand = brand
        self.passengerCount = passengerCount
        self.carPrint = carPrint
        self.isHardMusicPlayed = false
        switch carType {
        case .sportCar:
            fuelType = "Высокооктановый бензин"
            haveGoodSoundBar = true
        case .truck:
            fuelType = "Дизель"
            haveGoodSoundBar = false
        }
        isStartEngine = false
    }
    
    func startCarAction(carAction: CarAction) {
        switch carAction {
        case .onHardMusic:
            print ("Заиграла мощная музыка. Можете гордиться(Нет)")
            self.isHardMusicPlayed = true
        case .offHardMusic:
            print ("Музыка выключена. Люди вас благодарят")
            self.isStartEngine = false
        case .startEngine:
            print("Двигатель заведен.")
            self.isStartEngine = true
        case .turnOffEngine:
            print ("Вы заглушили двигатель")
            self.isStartEngine = false
        case .loadPassengers(1):
            print ("У вас только одно свободное место, прокатим кого-то")
        case .uploadPassengers(1):
            print ("Накатался? выходим")
        case .openDoors:
            print ("Двери открыты")
        case .closeDoors:
            print ("Двери закрыты")
        default:
            print ("Какой багаж?")
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
        Модель транспорта: \(brand),
        Вид: \(carType.name),
        Количество посадочных мест: \(passengerCount),
        Двигатель: \(isStartEngine ? "Заведён" : "Заглушен"),
        Вид топлива: \(fuelType), \nЦвет: \(carColor),
        Раскраска авто: \(carPrint),
        Музыка \(isHardMusicPlayed ? "Бешено качает" : "Выключена")
        """
    }
}
