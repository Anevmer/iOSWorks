//
//  main.swift
//  4L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 22.07.2021.
//

import Foundation

let toyota = SportCar(carColor: "Желтый", carPrint: "Леопардовый", brand: "Toyota")
let volgabus = Bus(carColor: "Белый", passengerCount: 24, brand: "Волгабас")
let scania = Truck(carColor: "Черный", volumeTrunk: 300, brand: "Scania")

toyota.getInformation()
volgabus.getInformation()
scania.getInformation()

toyota.startCarAction(carAction: .onHardMusic)
scania.startCarAction(carAction: .loadCargo(200))
scania.startCarAction(carAction: .uploadCargo(50))
volgabus.startCarAction(carAction: .loadPassengers(10))
volgabus.startCarAction(carAction: .openDoors)
volgabus.startCarAction(carAction: .loadPassengers(10))

toyota.getInformation()
scania.getInformation()
volgabus.getInformation()
