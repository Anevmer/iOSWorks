//
//  Truck.swift
//  4L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 22.07.2021.
//

import Foundation

class Truck: Car {
    
    var volumeTrunk: Int
    var isFullTrunk: Bool
    var trunkStatus: Int
    
    init(carType: CarType = .truck, carColor: String, passengerCount: Int = 1, volumeTrunk: Int, brand: String) {
        self.volumeTrunk = volumeTrunk
        isFullTrunk = false
        trunkStatus = 0
        super.init(carType: carType, carColor: carColor, passengerCount: passengerCount, brand: brand)
    }
    
    override func startCarAction(carAction: CarAction) {
        switch carAction {
        case .loadCargo(let cargoVolume):
            if trunkStatus + cargoVolume > volumeTrunk {
                if isFullTrunk {
                    print ("\(brand): Не удалось загрузить, кузов полный")
                } else {
                    print ("\(brand): Груз загружен. Не поместилось: \((trunkStatus + cargoVolume) - volumeTrunk)")
                    trunkStatus = volumeTrunk
                    isFullTrunk = trunkStatus == volumeTrunk
                }
            } else {
                trunkStatus += cargoVolume
                print ("\(brand): Груз загружен. Осталось места: \(volumeTrunk - trunkStatus)")
                isFullTrunk = trunkStatus == volumeTrunk
            }
        case .uploadCargo(let cargoVolume):
            if cargoVolume > trunkStatus {
                print ("\(brand): Столько груза нет, выгрузили все что есть")
                trunkStatus = 0
                isFullTrunk = trunkStatus == volumeTrunk
            } else {
                print ("\(brand): Выгрузили \(cargoVolume), Осталось: \(trunkStatus-cargoVolume)")
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
    override func getInformation() {
//        print("Модель транспорта: \(brand), \nВид: \(carType.name), \nКоличество пассажиров: \(passengerCount), \nДвигатель: \(isStartEngine ? "Заведён" : "Заглушен"), \nВид топлива: \(fuelType), \nЦвет: \(carColor)")
        super.getInformation()
        print ("Объём кузова: \(volumeTrunk), \nОсталось места: \(volumeTrunk - trunkStatus)")
    }
}
