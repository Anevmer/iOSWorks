//
//  Bus.swift
//  4L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 22.07.2021.
//

import Foundation

class  Bus: Car {
    
    var isOpenDoors: Bool
    var isPassangersFull: Bool
    var passengersStatus: Int
    
    override init(carType: CarType = .bus, carColor: String, passengerCount: Int, brand: String) {
        isOpenDoors = false
        passengersStatus = 0
        isPassangersFull = false
        super.init(carType: carType, carColor: carColor, passengerCount: passengerCount, brand: brand)
    }
    
    override func startCarAction(carAction: CarAction) {
        switch carAction {
        case .loadCargo(0), .uploadCargo(0):
            print ("Автобус городской, вещички с собой")
        case .startEngine:
            print("Двигатель заведен.")
            self.isStartEngine = true
        case .turnOffEngine:
            print ("Вы заглушили двигатель")
            self.isStartEngine = false
        case .loadPassengers(let passengers):
            if isOpenDoors == false {
                print ("Сначала откройте двери")
            } else {
                if passengersStatus + passengers > passengerCount {
                    if isPassangersFull {
                        print ("\(brand): Автобус полный, стоя не берём")
                    } else {
                        print ("\(brand): Загрузились. \((passengersStatus + passengerCount) - passengers) людей будут ждать следующий")
                        passengersStatus = passengerCount
                        isPassangersFull = passengersStatus == passengerCount
                    }
                } else {
                    passengersStatus += passengers
                    print ("\(brand): Загрузились. Осталось места: \(passengerCount - passengersStatus)")
                    isPassangersFull = passengersStatus == passengerCount
                }
            }
        case .uploadPassengers(let passengers):
            if isOpenDoors == false {
                print ("Сначала откройте двери")
            } else {
                if passengers > passengersStatus {
                    print ("\(brand): Вышли все")
                    passengersStatus = 0
                    isPassangersFull = passengersStatus == passengerCount
                } else {
                    print ("\(brand): Вышло \(passengers), Осталось людей: \(passengersStatus - passengers)")
                    passengersStatus -= passengers
                    isPassangersFull = passengersStatus == passengerCount
                }
            }
        case .openDoors:
            isOpenDoors = true
            print ("Двери открыты")
        case .closeDoors:
            isOpenDoors = false
            print ("Двери закрыты")
        default:
            print ("На этой колымаге даже радио больно слушать")
        }
    }
    override func getInformation() {
        super.getInformation()
        print ("Двери: \(isOpenDoors ? "Открыты" : "Закрыты"), \nОсталось места: \(passengerCount - passengersStatus)")
    }
}
