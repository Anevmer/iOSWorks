//
//  CarType.swift
//  4L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 22.07.2021.
//

import Foundation

enum CarType {
    case truck
    case bus
    case sportCar
    
    var name: String {
        switch self {
        case .bus:
            return "Автобус"
        case .truck:
            return "Грузовик"
        case .sportCar:
            return "Спорткар"
        }
    }
}
