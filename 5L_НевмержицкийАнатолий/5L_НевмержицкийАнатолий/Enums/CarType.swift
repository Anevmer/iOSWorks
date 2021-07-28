//
//  CarType.swift
//  5L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 28.07.2021.
//

import Foundation

enum CarType {
    case truck
    case sportCar
    
    var name: String {
        switch self {
        case .truck:
            return "Грузовик"
        case .sportCar:
            return "Спорткар"
        }
    }
}
