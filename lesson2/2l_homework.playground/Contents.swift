//1. Написать функцию, которая определяет, четное число или нет.
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
//3. Создать возрастающий массив из 100 чисел.
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
//
//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

import UIKit
import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
func numDetect (_ number: Int) {
    if (number % 2 == 0) {
        print("Четное число")
    } else {
        print("Нечетное число")
    }
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func div3Detect (_ number: Int) {
    if (number % 3 == 0) {
        print("Число делится на 3 без остатка")
    } else {
        print("Число не делится на 3 без остатка, остаток равен \(number % 3)")
    }
}

//3. Создать возрастающий массив из 100 чисел.
func createNumArr (_ count: Int) -> [Int] {
    var array = [Int]()
    for i in 0...(count - 1) {
        array.append(i)
    }
    return array
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func deleteArrElements1 (_ array: [Int]) -> [Int] {
    let compactMapped: [Int] = array.compactMap { num in ((num % 2 != 0) && (num % 3 != 0)) ? num : nil }
    return compactMapped
}

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов. Fn=Fn-1 + Fn-2
func fibonacci () -> [Float] {
    var newArray: [Float] = [1,1]
    
    for i in 2...99 {
        newArray.append(newArray[i - 1] + newArray[i - 2])
    }
    return newArray
}

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
func simpleNumArray (_ max: Int) -> [Int] {
    var inArray = (2...max).map{$0}
    var outArray = [Int]()
    var p: Int = 2
    
    while ( (outArray.count <= 100) || (p * p <= max) ) {
        inArray.removeAll(where: {$0 >= (p * p) && $0.isMultiple(of: p)})
        outArray.append(p)
        p = inArray.first(where: {$0 > p})!
    }
    return outArray
}

numDetect(8) //1

div3Detect(9) //2

var numArr: [Int] = createNumArr(100) // 3
print("Массив из 100 чисел \n \(numArr)\n")

numArr = (deleteArrElements1(numArr)) // 4
print("Массив без четных и которые не делятся на 3 \n \(numArr)\n")

let fiboArray = fibonacci() // 5
print("Массив из чисел Фибоначи из 100 элементов \n \(fiboArray)\n")

let simpleNumArr = simpleNumArray(1000) //6
print("Массив из 100 простых чисел \n \(simpleNumArr)\n")