import Foundation

enum CarActions {
    case startEngine
    case turnOffEngine
    case openWindows
    case closeWindows
    case loadCargo(Int)
    case uploadCargo(Int)
}

struct TrunkCar {
    fileprivate let brand: String
    fileprivate let year: Int
    fileprivate let volumeTrunk: Int
    fileprivate var isStartedEndine: Bool
    fileprivate var isOpenWindows: Bool
    fileprivate var isFullTrunk: Bool
    fileprivate var trunkStatus = 0
    
    mutating func startAction(action: CarActions) {
        switch action {
        case .startEngine:
            print ("\(brand): Двигатель запущен")
            isStartedEndine = true
        case .turnOffEngine:
            print ("\(brand): Двигатель заглушен")
            isStartedEndine = false
        case .openWindows:
            print ("\(brand): Окна открыты")
            isOpenWindows = true
        case .closeWindows:
            print ("\(brand): Окна закрыты")
            isOpenWindows = false
        case .loadCargo(let cargoVolume):
            if trunkStatus + cargoVolume > volumeTrunk {
                if isFullTrunk {
                    print ("\(brand): Не удалось загрузить, кузов полный")
                } else {
                    print ("\(brand): Груз загружен. Не поместилось: \((trunkStatus + cargoVolume) - volumeTrunk)")
                    trunkStatus = volumeTrunk
                    isFullTrunk = trunkStatus == volumeTrunk
                }
            } else {
                trunkStatus += cargoVolume
                print ("\(brand): Груз загружен. Осталось места: \(volumeTrunk - trunkStatus)")
                isFullTrunk = trunkStatus == volumeTrunk
            }
        case .uploadCargo(let cargoVolume):
            if cargoVolume > trunkStatus {
                print ("\(brand): Столько груза нет, выгрузили все что есть")
                trunkStatus = 0
                isFullTrunk = trunkStatus == volumeTrunk
            } else {
                print ("\(brand): Выгрузили \(cargoVolume), Осталось: \(trunkStatus-cargoVolume)")
                trunkStatus -= cargoVolume
                isFullTrunk = trunkStatus == volumeTrunk
            }
            
        }
    }
    
    func getParameters() {
        print ("Модель грузовика: \(brand), \nГод выпуска: \(year), \nОбъём кузова: \(volumeTrunk), \nДвигатель: \(isStartedEndine ? "Заведён" : "Заглушен"), \nОкна \(isOpenWindows ? "Открыты" : "Закрыты"), \nКузов: Осталось места \(volumeTrunk - trunkStatus)")
    }
}

var kamaz = TrunkCar(brand: "Камаз", year: 2015, volumeTrunk: 100, isStartedEndine: false, isOpenWindows: false, isFullTrunk: false)
var maz = TrunkCar(brand: "Маз", year: 2013, volumeTrunk: 110, isStartedEndine: false, isOpenWindows: false, isFullTrunk: false)

kamaz.getParameters()
maz.getParameters()

kamaz.startAction(action: .openWindows)
maz.startAction(action: .startEngine)
maz.getParameters()
kamaz.startAction(action: .loadCargo(40))
kamaz.startAction(action: .loadCargo(30))
kamaz.startAction(action: .uploadCargo(20))
kamaz.startAction(action: .loadCargo(60))
kamaz.getParameters()

