//
//  SportCar.swift
//  6l_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 04.08.2021.
//

import Foundation

class SportCar: CarProtocol {
    var model: String
    var brand: String
    var price: Double
    
    init (brand: String, model: String, price: Double) {
        self.brand = brand
        self.model = model
        self.price = price
    }
    
    func getCarInfo() {
        print ("""
            Марка и модель: \(brand) \(model)
            Цена: \(price)
            """
        )
    }
}
