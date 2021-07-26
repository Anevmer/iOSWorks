//
//  SportCar.swift
//  4L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 22.07.2021.
//

import Foundation

class SportCar: Car {
    
    let carPrint: String
    var isHardMusicPlayed: Bool
    
    init(carType: CarType = .sportCar, carColor: String, passengerCount: Int = 1, carPrint: String, brand: String) {
        self.carPrint = carPrint
        self.isHardMusicPlayed = false
        super.init(carType: carType, carColor: carColor, passengerCount: passengerCount, brand: brand)
    }
    
    override func startCarAction(carAction: CarAction) {
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
    override func getInformation() {
        super.getInformation()
        print ("Раскраска авто: \(carPrint), \nМузыка \(isHardMusicPlayed ? "Бешено качает" : "Выключена")")
    }
}
