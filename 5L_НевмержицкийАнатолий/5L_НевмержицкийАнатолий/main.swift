//
//  main.swift
//  5L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 28.07.2021.
//

import Foundation

let toyotaSupra = SportCar(
                    carColor: "Красный",
                    carPrint: "Полосатый",
                    brand: "Toyota"
                    )
let scania = Truck(
                carColor: "Белый",
                volumeTrunk: 500,
                brand: "Scania"
                )

print(toyotaSupra)
toyotaSupra.startEngine()
toyotaSupra.loadPassengers(passengers: toyotaSupra.passengerCount)
toyotaSupra.startCarAction(carAction: .onHardMusic)
print (toyotaSupra)

print(scania)
scania.startEngine()
scania.startCarAction(carAction: .loadCargo(150))
scania.startCarAction(carAction: .uploadCargo(50))
print(scania)
