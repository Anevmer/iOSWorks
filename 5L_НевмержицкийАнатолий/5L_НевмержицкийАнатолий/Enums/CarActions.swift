//
//  CarActions.swift
//  5L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 28.07.2021.
//

import Foundation

enum CarAction {
    case startEngine
    case turnOffEngine
    case onHardMusic
    case offHardMusic
    case loadPassengers(Int)
    case uploadPassengers(Int)
    case loadCargo(Int)
    case uploadCargo(Int)
    case openDoors
    case closeDoors
}
