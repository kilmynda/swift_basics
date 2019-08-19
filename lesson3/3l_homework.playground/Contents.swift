//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

import UIKit

enum EngineStatus: String {
    case on = "Двигатель запущен"
    case off = "Двигиатель заглушен"
}

enum WindowStatus: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

struct Car {
    var modelCar: String
    var yearIssueCar: Int
    var bootVolume: Double
    var EngineCar: EngineStatus
    var WindowsCar: WindowStatus
}

struct Truck {
    var modelTruck: String
    var yearIssueTruck: Int
    var bootVolume: Double
    var EngineTruck: EngineStatus
    var WindowsTruck: WindowStatus
}
