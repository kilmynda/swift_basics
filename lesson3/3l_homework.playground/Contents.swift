//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

import UIKit
import Foundation

enum VehicleType: String {
    case car = "Легковой автомобиль"
    case truck = "Грузовой автомобиль"
}

enum EngineStatus: String {
    case on = "Двигатель запущен"
    case off = "Двигиатель заглушен"
}

enum WindowsStatus: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

struct Vehicle {
    let modelName: String
    let vehicleType: VehicleType
    let yearVehicle: Int
    var bootVolume: Double
    var engineVehicle: EngineStatus
    var windowsVehicle: WindowsStatus
    var description: String {
        get {
            return "Модель ТС: \(modelName), тип: \(vehicleType.rawValue), год выпуска: \(yearVehicle), объем багажника/кузова: \(bootVolume) л., \(engineVehicle.rawValue), \(windowsVehicle.rawValue)."
        }
    }
    
    mutating func openWindows() {
        self.windowsVehicle = .open
    }
    mutating func closeWindows() {
        self.windowsVehicle = .close
    }
    mutating func switchWindowsStatus() {
        switch windowsVehicle {
        case .open:
            self.windowsVehicle = .close
        case .close:
            self.windowsVehicle = .open
        }
    }
    
    mutating func onEngine() {
        self.engineVehicle = .on
    }
    mutating func offEngine() {
        self.engineVehicle = .off
    }
    mutating func switchEngineStatus() {
        switch engineVehicle {
        case .off:
            self.engineVehicle = .on
        case .on:
            self.engineVehicle = .off
        }
    }
    
    init(modelName: String, vehicleType: VehicleType, yearVehicle: Int, bootVolume: Double, engineVehicle: EngineStatus, windowsVehicle: WindowsStatus) {
        self.modelName = modelName
        self.vehicleType = vehicleType
        self.yearVehicle = yearVehicle
        self.bootVolume = bootVolume
        self.engineVehicle = engineVehicle
        self.windowsVehicle = windowsVehicle
    }
}

var vehicle1 = Vehicle(modelName: "KIA", vehicleType: .car, yearVehicle: 2013, bootVolume: 300, engineVehicle: .off, windowsVehicle: .close)

print(vehicle1.description)
vehicle1.switchEngineStatus()
print(vehicle1.description)
vehicle1.openWindows()
print(vehicle1.description)
