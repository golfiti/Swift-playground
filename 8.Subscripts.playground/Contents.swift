//: Playground - noun: a place where people can play

import UIKit

// Subscripts
/*
    Subscripts คือ ทางลัดสำหรับการเข้าไปยังสมาชิกของ collection, list หรือ sequence
    กรณีของ array เราสามารถใช้ subscript เพื่อเข้าไปยังสมาชิกของ array ด้วยการ ใช้ someArray[index]
    ---------------------------------------
    var myArray: [Int] = [2,4,5,7]
    let result = myArray[0]
    ---------------------------------------
    
    ส่วนใน dictionary สามารถเข้าไปยังสมาชิกของ dictionary ด้วยการใช้ subscript ด้วยรูปแบบ someDictionary[key]
    ---------------------------------------
    var myDictionary= ["th":"Thai","en":"English"]
    let result = myDictionary["th"]
    ---------------------------------------
    รูปแบบการใช้ subscript คือการใส่ชื่อ ตามด้วยก้ามปู เหมือนดังที่ใช้ใน array และ ใน dictionary นั่นเอง
    และนอกจาก array และ dictionary 

    แล้ว ภาษา swift ยังอนุญาตให้เราสร้าง subscript เอาไว้ใช้งานเองอีกด้วย
*/

var lang:Array<String> = ["th","en","jp"]

// Get Data Array at index
lang[0]
// Update Array
lang[0] = "Thai"
lang


var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
numberOfLegs




// Subscript Options

// Syntax
/*
    subscript(index:Int) -> Int {
        get {
            // read-only
        }
        set (newValue) {
            // read-write
        }
    }
*/

// Example 1
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        // default is get{}
        // get {
            return multiplier * index
        // }
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("x * 3 = \(threeTimesTable[6])")


// Example 2
struct Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    // สร้าง Matrix
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0) // repeatedValue คือกำหนดค่า default ของ array ไว้
        print(grid)
    }
    
    // ตรวจสอบ point เกิน Matrix หรือไม่
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        
        get {
            
            print("get : \(row),\(column)")
            
            // point เกินขอบเขตของ Matrix จะเข้า assert
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            
            // point ไม่เกิินขอบเขตของ Matrix จะเอาค่าไป set Matrix ตามตำแหน่ง
            print(grid[(row * columns) + column])
            return grid[(row * columns) + column]
            
        }
        set (newValue){
            
            print("set at : \(row),\(column)")
            print(newValue)
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
            
        }
        
    }
}
var matrix = Matrix(rows: 2, columns: 2)    // กำหนด Matrix
matrix[0, 0]
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
// matrix[0, 2]                             // Error assert get "Index out of range"

// print("ROW : \(matrix.rows), COLS : \(matrix.columns)")
print(matrix.grid)
/*
     -       -            positions
    | 0.0 1.5 |    <-     0,0 0,1
    | 3.2 0.0 |           1,0 1,1
     -       -
*/








