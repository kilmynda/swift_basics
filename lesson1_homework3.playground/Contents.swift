// Расчитываем сумму вклада через 5 лет

import Cocoa

let deposit: Double = 10000
let percent: Double = 9
let years: Double = 5
var result: Double = 0

print("Сумма первоначального вклада составляет:",deposit,"рублей.")

result = deposit + (deposit * (percent/100) * years)

print("Сумма вклада на",years,"лет, составит:",result,"рублей.")
