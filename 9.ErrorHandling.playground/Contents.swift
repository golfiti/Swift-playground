//: Playground - noun: a place where people can play

import UIKit

// Error Handling 
/*
    ใช้ตรวจสอบค่า

    เช่น ขณะเรียก method โหลดหน้าเว็บเพจ
    ก็จะตรวจสอบว่า URL ที่เราอ้างอิงนั้นมีอยู่จริงหรือไม่
*/


// Syntax
/*
    func funcName(parameter) throws -> returnType {

        if testError == true {
            throw errorData
        }
        return valueNotError
    }

*/

enum MyError : ErrorType{
    case dividedByZero
    case exceedLimit
}

// ใส่ throws(มีs) ต่อหลัง func name หรือ parameter
func divideNum(number1:Double,number2:Double) throws -> Double {

    if number2 == 0 {
        throw MyError.dividedByZero     // ใช้ throw(ไม่มี s) ในการโยนค่า
    }
    if number1 >= 100 {
        throw MyError.exceedLimit
    }
    return number1/number2
}

// ตรวจสอบข้อผิดผลาด
do {
    // ทำคำสั่ง ใส่ try
   try divideNum(99, number2: 1)
    // ทำคำสั่งอื่นหาไม่พบข้อผิดพลาด
}
catch let getError{
    // เมื่อพบข้อผิดผลาด หาข้อผิดผลาด
    switch getError {
        case MyError.dividedByZero:
            print("ERROR : can't not divide by 0")
        case MyError.exceedLimit:
            print("ERROR : number1 more than 100")
        default:
            break
    }
}