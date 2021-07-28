//
//  Truck.swift
//  5L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 28.07.2021.
//

import Foundation

class Truck: CarProtocol {
    var brand: String
    var carType: CarType
    var carColor: String
    var passengerCount: Int
    var fuelType: String
    var haveGoodSoundBar: Bool
    var isStartEngine: Bool
    var volumeTrunk: Int
    var isFullTrunk: Bool
    var trunkStatus: Int
    
    init(carType: CarType = .truck,
         carColor: String,
         passengerCount: Int = 1,
         volumeTrunk: Int,
         brand: String) {
        self.volumeTrunk = volumeTrunk
        isFullTrunk = false
        trunkStatus = 0
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
        }
        isStartEngine = false
    }
    
    func startCarAction(carAction: CarAction) {
        switch carAction {
        case .loadCargo(let cargoVolume):
            if trunkStatus + cargoVolume > volumeTrunk {
                if isFullTrunk {
                    print ("\(brand): Не удалось загрузить, кузов полный")
                } else {
                    print (
                        "\(brand): Груз загружен. Не поместилось: \((trunkStatus + cargoVolume) - volumeTrunk)")
                    trunkStatus = volumeTrunk
                    isFullTrunk = trunkStatus == volumeTrunk
                }
            } else {
                trunkStatus += cargoVolume
                print (
                    "\(brand): Груз загружен. Осталось места: \(volumeTrunk - trunkStatus)")
                isFullTrunk = trunkStatus == volumeTrunk
            }
        case .uploadCargo(let cargoVolume):
            if cargoVolume > trunkStatus {
                print (
                    "\(brand): Столько груза нет, выгрузили все что есть")
                trunkStatus = 0
                isFullTrunk = trunkStatus == volumeTrunk
            } else {
                print (
                    "\(brand): Выгрузили \(cargoVolume), Осталось: \(trunkStatus-cargoVolume)")
                trunkStatus -= cargoVolume
                isFullTrunk = trunkStatus == volumeTrunk
            }
        case .openDoors:
            print ("Двери открыты")
        case .closeDoors:
            print ("Двери закрыты")
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
        default:
            print ("На этой колымаге даже радио больно слушать")
        }
    }
}

extension Truck: CustomStringConvertible {
    var description: String {
        return """
        Модель транспорта: \(brand),
        Вид: \(carType.name),
        Количество посадочных мест: \(passengerCount),
        Двигатель: \(isStartEngine ? "Заведён" : "Заглушен"),
        Вид топлива: \(fuelType),
        Цвет: \(carColor), Объём кузова: \(volumeTrunk),
        \nОсталось места: \(volumeTrunk - trunkStatus)
        """
    }
}
