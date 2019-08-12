// Решение квадратного уравнения | Создал ветку. Тест.

import Cocoa

var x1: Double = 0
var x2: Double = 0
let a: Double = 2
let b: Double = 3
let c: Double = 1

print("a=",a,";","b=",b,";","c=",c)

let D = Double((b * b) - (4*a*c))
print("Дискриминант равен:",D)

if (D > 0) {
    x1 = (-b + sqrt(D)) / (2*a)
    x2 = (-b - sqrt(D)) / (2*a)
    print("Уравнение имеет 2 корня:\nx1=",x1,"x2=",x2)
} else if (D == 0) {
    x1 = (-b + sqrt(D)) / (2*a)
    print("Уравнение имеет 1 корень:", x1)
} else if (D < 0) {
    print("Уравнение не имеет корней")
}
