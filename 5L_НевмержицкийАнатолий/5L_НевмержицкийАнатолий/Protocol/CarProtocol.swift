//
//  CarProtocol.swift
//  5L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 28.07.2021.
//

import Foundation

protocol CarProtocol {
    
    var brand: String { get }
    var carType: CarType { get }
    var carColor: String { get }
    var passengerCount: Int { get }
    var fuelType: String { get }
    var haveGoodSoundBar: Bool { get }
    var isStartEngine: Bool { get }
    
    func startCarAction(carAction: CarAction)
    
}

extension CarProtocol {
    func startEngine() {
        startCarAction(carAction: .startEngine)
    }
    func turnOffEngine() {
        startCarAction(carAction: .turnOffEngine)
    }
    func loadPassengers(passengers: Int) {
        startCarAction(carAction: .loadPassengers(passengers))
    }
    
    func uploadPassengers(passengers: Int) {
        startCarAction(carAction: .loadPassengers(passengers))
    }
}
