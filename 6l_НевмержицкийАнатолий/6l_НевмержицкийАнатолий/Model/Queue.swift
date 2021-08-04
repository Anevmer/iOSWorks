//
//  Queue.swift
//  6l_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 04.08.2021.
//

import Foundation

struct Queue<T: CarProtocol> {
    var elements: [T] = []
    
    var brands: [String] {
        var array: [String] = []
        for element in elements {
            array.append(element.brand)
        }
        
        return array
    }
    
    var models: [String] {
        var array: [String] = []
        for element in elements {
            array.append(element.model)
        }
        return array
    }
    
    var prices: [Double] {
        var array: [Double] = []
        for element in elements {
            array.append(element.price)
        }
        return array
    }
    
    mutating func addElement(_ element: T) {
        elements.append(element)
    }
    
    mutating func removeFirstElement() -> T? {
        return elements.removeFirst()
    }
    
    mutating func removeLastElement() -> T? {
        return elements.removeLast()
    }
    
    subscript(index: Int) -> Double? {
        guard index < self.prices.count else { return nil }
        
        return prices[index]
    }
    
    func getCarPriceTo(price: Double) -> [T] {
        return elements.filter({$0.price < price})
    }
}
