//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

import UIKit
import Foundation

enum VehicleType: String {
    case sportcar = "Спортивный автомобиль"
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

// Основной класс Car
class Car {
    var vehicleType: VehicleType
    let modelName: String
    let yearVehicle: Int
    let bootVolume: Double
    let engine: Double
    var windows: WindowsStatus  {
        willSet {
            if newValue == .open {
                print("У \(modelName) открываются окна")
            } else {
                print("У \(modelName) закрываются окна")
            }
        }
    }
    var engineStatus: EngineStatus {
        willSet {
            if newValue == .on {
                print("У \(modelName) заводится двигатель")
            } else {
                print("У \(modelName) выключается двигатель")
            }
        }
    }
    
    // Открыть окна
    func openWindows() {
        self.windows = .open
    }
    
    // Закрыть окна
    func closeWindows() {
        self.windows = .close
    }
    
    // Переключение состояния окон
    func switchWindowsStatus() {
        switch windows {
        case .open:
            self.windows = .close
        case .close:
            self.windows = .open
        }
    }
    
    // Завести двигатель
    func onEngine() {
        self.engineStatus = .on
    }
    
    // Заглушить двигатель
    func offEngine() {
        self.engineStatus = .off
    }
    
    // Переключение состояние двигателя
    func switchEngineStatus() {
        switch engineStatus {
        case .off:
            self.engineStatus = .on
        case .on:
            self.engineStatus = .off
        }
    }
    
    // Погрузить в кузов
    func putCargo(_ newCargoValue: Double) {
        
    }
    
    // Выгрузить из кузова
    func pullCargo(_ newCargoValue: Double) {
        
    }
    
    // Метод вывода состояния ТС
    func carStatus() {
        print("Тип: \(vehicleType.rawValue)\n Марка: \(modelName)\n Год выпуска: \(yearVehicle)\n Объем багажника: \(bootVolume)\n Двигатель: \(engine)\n Состояние окон: \(windows.rawValue)\n Состояние двигателя: \(engineStatus.rawValue)")
    }
    
    // Инициализация
    init(vehicleType: VehicleType, modelName: String, yearVehicle: Int, bootVolume: Double, engine: Double, windows: WindowsStatus? = .close, engineStatus: EngineStatus? = .off) {
        self.vehicleType = vehicleType
        self.modelName = modelName
        self.yearVehicle = yearVehicle
        self.bootVolume = bootVolume
        self.engine = engine
        self.windows = windows ?? .close
        self.engineStatus = engineStatus ?? .off
    }
}

// Наследник класса Car (Грузовик)
class Truck: Car {
    var bootVolumeLeft: Double {
        get {
            return (bootVolume - cargoValue)
        }
    }
    
    var cargoValue: Double {
        didSet {
            print("Изменился объем груза в \(modelName), новый объем \(cargoValue)")
        }
    }
    
    override func carStatus() {
        super.carStatus()
        print(" Объем груза: \(cargoValue)\n Оставшийся свободный объем: \(bootVolumeLeft)")
    }
    
    // погрузить в кузов
    override func putCargo(_ newCargoValue: Double) {
        if newCargoValue <= bootVolumeLeft {
            bootVolumeLeft
            cargoValue += newCargoValue
        } else {
            print("Не хватает места в \(self.modelName), перегрузка на \(-(bootVolumeLeft - newCargoValue)). Погрузка не состоялась!")
        }
    }
    
    // выгрузить из кузова
    override func pullCargo(_ newCargoValue: Double) {
        if newCargoValue <= cargoValue {
            cargoValue -= newCargoValue
            bootVolumeLeft
        } else {
            print("Для разгрузки \(newCargoValue), на \(self.modelName) отсутствует запрашиваемый объем. Оставшийся объем \(bootVolumeLeft)")
        }
    }
    
    init(vehicleType: VehicleType, modelName: String, yearVehicle: Int, bootVolume: Double, engine: Double, windows: WindowsStatus? = .close, engineStatus: EngineStatus? = .off, cargoValue: Double) {
        self.cargoValue = cargoValue
        super.init(vehicleType: vehicleType, modelName: modelName, yearVehicle: yearVehicle, bootVolume: bootVolume, engine: engine)
    }
    
}

// Наследник класса Car (Спорткар)
class SportCar: Car {
    let acceleration: Double
    let torque: Double
    var odometr: Double {
        didSet {
            print("Внимание! У \(modelName) изменился пробег на \(odometr - oldValue). Общий пробег теперь составляет: \(odometr).")
        }
    }
    
    override func offEngine() {
        self.engineStatus = .off
        closeWindows()
    }
    
    override func carStatus() {
        super.carStatus()
        print(" Разгон до 100: \(acceleration)\n Крутящий момент: \(torque)\n Пробег: \(odometr)")
    }
    
    init(vehicleType: VehicleType, modelName: String, yearVehicle: Int, bootVolume: Double, engine: Double, windows: WindowsStatus? = .close, engineStatus: EngineStatus? = .off, acceleration: Double, torque: Double, odometr: Double) {
        self.acceleration = acceleration
        self.torque = torque
        self.odometr = odometr
        super.init(vehicleType: vehicleType, modelName: modelName, yearVehicle: yearVehicle, bootVolume: bootVolume, engine: engine)
    }
    
}


var Truck1 = Truck.init(vehicleType: .truck, modelName: "Caterpillar 797B", yearVehicle: 2002, bootVolume: 350000, engine: 117, cargoValue: 50000)
Truck1.carStatus()
Truck1.putCargo(200000)
Truck1.putCargo(150000)
Truck1.pullCargo(100000)
Truck1.pullCargo(250000)
Truck1.switchEngineStatus()
Truck1.openWindows()
Truck1.carStatus()

var SportCar1 = SportCar.init(vehicleType: .sportcar, modelName: "Toyota Supra A90", yearVehicle: 2014, bootVolume: 290, engine: 3, acceleration: 4.3, torque: 500, odometr: 0)
SportCar1.carStatus()
SportCar1.odometr = 30
SportCar1.offEngine()
SportCar1.odometr = 70
SportCar1.carStatus()
