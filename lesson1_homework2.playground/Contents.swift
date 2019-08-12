// Находим площадь, периметр и гипотенузу прямоугольного треугольника по 2 катетам

import Cocoa

let AB: Double = 5.4
let AC: Double = 2.1
var BC: Double = 0
var S: Double = 0
var P: Double = 0

print("Даны катеты:","AB=",AB,";","AC=",AC)

if (AB <= 0 || AC <= 0) {
    print("Ошибка: отрицательная или нулевая величина катета")
} else {
    BC = sqrt((AB*AB) + (AC*AC))
    S = AB * AC / 2
    P = AB + AC + BC
    print("Гипотенуза равна ",BC,"\nПлощадь равна",S,"\nПериметр равен",P)
}
