//
//  main.swift
//  7L_НевмержицкийАнатолий
//
//  Created by Anatoly Nevmerzhitsky on 04.08.2021.
//

import Foundation

class ViewController {
    
    private let service = ServerResponse()
    private var dataFromServer: String? = nil
    
    
    func loadData() {
//        guard let data = service.request(serverCode: 401) else { return }
//        dataFromServer = data
        if let data = service.request(serverCode: 401) {
            dataFromServer = data
            print ("Data has been loaded")
        }
        else {
            print ("Error")
        }
    }
    
    func loadData2() {
        do {
            let data = try service.request2(serverCode: 201)
            dataFromServer = data
            print ("Данные загружены")
            print (data)
        }
        catch ServerError.noInternetConnection {
            print ("Нет интернет - соединения")
        }
        catch ServerError.serverError {
            print ("Неизвестная ошибка сервера")
        }
        catch {
            print ("Неизвестная ошибка")
        }
    }
}

let vc = ViewController()
vc.loadData2()
vc.loadData()

