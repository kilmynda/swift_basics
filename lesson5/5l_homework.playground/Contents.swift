//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

import UIKit
import Foundation

enum VehicleType: String {
    case sport = "Спортивный автомобиль"
    case truck = "Грузовой автомобиль"
}

enum WindowsStatus: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

enum EngineStatus: String {
    case on = "Двигатель запущен"
    case off = "Двигатель заглушен"
}

// Основной протокол
protocol Car: class {
    var vehicleType: VehicleType { get set}
    var modelName: String { get }
    var yearVehicle: Int { get }
    var engine: Double { get }
    var windows: WindowsStatus  { get set }
    var engineStatus: EngineStatus { get set}
}

extension Car {
    func openWindows() {
        self.windows = .open
    }
    
    func closeWindows() {
        self.windows = .close
    }
    
    func switchWindowsStatus() {
        switch windows {
        case .open:
            self.windows = .close
        case .close:
            self.windows = .open
        }
    }
    
    func onEngine() {
        self.engineStatus = .on
    }
    
    func offEngine() {
        self.engineStatus = .off
    }
    
    func switchEngineStatus() {
        switch engineStatus {
        case .off:
            self.engineStatus = .on
        case .on:
            self.engineStatus = .off
        }
    }
    
    func carStatus() {
        print("Тип: \(vehicleType.rawValue)\nМарка: \(modelName)\n Год выпуска: \(yearVehicle)\n Двигатель: \(engine)\n Состояние окон: \(windows.rawValue)\n Состояние двигателя: \(engineStatus.rawValue)\n")
    }
}

// Протокол для грузовового автомобиля
protocol Truck: Car {
    var bootVolumeLeft: Double { get }
    var cargoValue: Double { get set }
    var carryingVolume: Double { get set }
    func putCargo(_ newCargoValue: Double)
    func pullCargo(_ newCargoValue: Double)
}

extension Truck {
    
    // погрузить в кузов
    func putCargo(_ newCargoValue: Double) {
        if newCargoValue <= bootVolumeLeft {
            bootVolumeLeft
            cargoValue += newCargoValue
        } else {
            print("Не хватает места в \(self.modelName), перегрузка на \(-(bootVolumeLeft - newCargoValue)). Погрузка не состоялась!")
        }
    }
    
    // выгрузить из кузова
    func pullCargo(_ newCargoValue: Double) {
        if newCargoValue <= cargoValue {
            cargoValue -= newCargoValue
            bootVolumeLeft
        } else {
            print("Для разгрузки \(newCargoValue), на \(self.modelName) отсутствует запрашиваемый объем. Оставшеемся место в кузове на \(bootVolumeLeft)")
        }
    }
    
    func truckStatus() {
        carStatus()
        print(" Грузоподъемность \(carryingVolume) кг.\n Объем груза: \(cargoValue) кг.\n Оставшеемся место в кузове на: \(bootVolumeLeft) кг.\n")
    }
}

// Протокол для спортивного автомобиля
protocol Sport: Car {
    var acceleration: Double { get set }
    var torque: Double { get set }
    var odometr: Double { get set }
}

extension Sport {
    func offEngine() {
        self.engineStatus = .off
        closeWindows()
    }
    func oEngine() {
        self.engineStatus = .on
        openWindows()
    }
}

// Протокол для вывода объекта в консоль
protocol ConsolePrintable: CustomStringConvertible {
    func printDescription()
}

extension ConsolePrintable {
    func printDescription() {
        print(description)
    }
}

// Задаем класс для грузового автомобиля
class TruckCar: Truck, ConsolePrintable {
    var description: String {
        return "Тип: \(vehicleType.rawValue)\nМарка: \(modelName)\n Год выпуска: \(yearVehicle) год.\n Двигатель: \(engine) л.\n Состояние окон: \(windows.rawValue)\n Состояние двигателя: \(engineStatus.rawValue)\n Грузоподъемность: \(carryingVolume) кг.\n Объем груза: \(cargoValue) кг.\n Оставшееся место в кузове на: \(bootVolumeLeft) кг.\n"
    }
    
    var bootVolumeLeft: Double {
        get {
            return (carryingVolume - cargoValue)
        }
    }
    
    var cargoValue: Double {
        didSet {
            print("Изменился объем груза в \(modelName), новый объем \(cargoValue) кг.")
        }
    }
    
    var vehicleType: VehicleType
    var modelName: String
    var yearVehicle: Int
    var carryingVolume: Double
    var engine: Double
    var windows: WindowsStatus
    var engineStatus: EngineStatus
    
    init(vehicleType: VehicleType, modelName: String, yearVehicle: Int, engine: Double, windows: WindowsStatus? = .close, engineStatus: EngineStatus? = .off, carryingVolume: Double, cargoValue: Double? = 0) {
        self.vehicleType = vehicleType
        self.modelName = modelName
        self.yearVehicle = yearVehicle
        self.engine = engine
        self.windows = windows ?? .close
        self.engineStatus = engineStatus ?? .off
        self.carryingVolume = carryingVolume
        self.cargoValue = cargoValue ?? 0
    }
}

// Задаем класс для спортивного автомобиля
class SportCar: Sport, ConsolePrintable {
    var description: String {
        return "Тип: \(vehicleType.rawValue)\nМарка: \(modelName)\n Год выпуска: \(yearVehicle) год.\n Объем багажника: \(bootVolume) л.\n Двигатель: \(engine) л.\n Состояние окон: \(windows.rawValue)\n Состояние двигателя: \(engineStatus.rawValue)\n Разгон до 100: \(acceleration) сек.\n Крутящий момент: \(torque) Н*м\n Пробег: \(odometr) км.\n"
    }
    
    var odometr: Double {
        didSet {
            print("Внимание! У \(modelName) изменился пробег на \(odometr - oldValue). Общий пробег теперь составляет: \(odometr).")
        }
    }
    
    var acceleration: Double
    var torque: Double
    var vehicleType: VehicleType
    var modelName: String
    var yearVehicle: Int
    var bootVolume: Double
    var engine: Double
    var windows: WindowsStatus
    var engineStatus: EngineStatus
    
    init(vehicleType: VehicleType, modelName: String, yearVehicle: Int, bootVolume: Double, engine: Double, windows: WindowsStatus? = .close, engineStatus: EngineStatus? = .off, acceleration: Double, torque: Double, odometr: Double? = 0) {
        self.vehicleType = vehicleType
        self.modelName = modelName
        self.yearVehicle = yearVehicle
        self.bootVolume = bootVolume
        self.engine = engine
        self.windows = windows ?? .close
        self.engineStatus = engineStatus ?? .off
        self.acceleration = acceleration
        self.torque = torque
        self.odometr = odometr ?? 0
    }
}

// Грузовые автомобили
let truck1 = TruckCar.init(vehicleType: .truck, modelName: "Caterpillar 797B", yearVehicle: 2002, engine: 117, carryingVolume: 350000, cargoValue: 50000)
let truck2 = TruckCar.init(vehicleType: .truck, modelName: "Урал NEXT", yearVehicle: 2018, engine: 8, carryingVolume: 10000, cargoValue: 1000)

print("В \(truck1.modelName) доступно для погрузки: \(truck1.bootVolumeLeft)\n")
truck1.truckStatus()
truck1.putCargo(310000)
truck1.putCargo(290000)
truck1.carryingVolume = 450000
truck2.switchWindowsStatus()
truck2.switchEngineStatus()
truck2.truckStatus()
truck2.carStatus()
print(truck1)

// Спортивные автомобили
let sport1 = SportCar.init(vehicleType: .sport, modelName: "Toyota Supra A90", yearVehicle: 2014, bootVolume: 290, engine: 3, acceleration: 4.3, torque: 500, odometr: 0)
let sport2 = SportCar.init(vehicleType: .sport, modelName: "Aston Martin DB11", yearVehicle: 2017, bootVolume: 270, engine: 4, acceleration: 4.1, torque: 675, odometr: 0)

print(sport1)
sport1.switchEngineStatus()
sport1.switchWindowsStatus()
print(sport1)
print("В \(sport1.modelName) крутящий момент: \(sport1.torque) Н*м\n")
print(sport2)
sport2.odometr = 70
sport2.printDescription()
sport2.carStatus()
sport2.engine = 6
print(sport2)
