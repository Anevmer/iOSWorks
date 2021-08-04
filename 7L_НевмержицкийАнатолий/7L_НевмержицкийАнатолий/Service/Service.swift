//
//  MyCar.swift
//  7L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 04.08.2021.
//

import Foundation

enum ServerError: Error {
    case noInternetConnection
    case serverError
}


class ServerResponse {
    
    func request(serverCode: Int) -> String? {
        switch serverCode {
        case 200...299:
            return "Success"
        default:
            return nil
        }
    }
    
    func request2(serverCode: Int) throws -> String {
        if serverCode > 399, serverCode < 500 {
            throw ServerError.noInternetConnection
        }
        if serverCode > 499, serverCode < 600 {
            throw ServerError.serverError
        }
        return "Success"
    }
    
}



