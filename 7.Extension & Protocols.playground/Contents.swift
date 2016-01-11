//: Playground - noun: a place where people can play

import UIKit



// Extensions
/* 
    - กำหนดมาเพื่อใช้คำนวนอะไรสักอย่าง (computed)

    Add computed properties and computed type properties
    Define instance methods and type methods
    Provide new initializers
    Define subscripts
    Define and use new nested types
    Make an existing type conform to a protocol

    * Extensions can add new functionality to a type,
    but they cannot override existing functionality.
*/

extension Double {
    var km: Double { return self * 1_000.0 }
    var  m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

// convert any to meters
let oneInch = 25.4.mm
let threeFeet = 3.ft



struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))


// Extension with Methods
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions{
    print("Hello!")
}


// Mutation Instance
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()







// Protocols
/*
    คือ การเตรียมแม่แบบสำหรับ method,property
    (คือ การกำหนดว่าใน method ที่ inherit จาก protocal จะต้องมี property หรือฟังก์ชันอะไรบ้างนั่นเอง)
    
    - กำหนดกรอบการทำงาน แต่ไม่ได้ลงรายละเอียดว่าต่้องทำอย่างไร
    - การกำหนดมีลักษณะเช่นเดียวกับ  String,Double,Int,
                               Class,Structure
    - Conform คือการที่ method ยอมรับ 
    (คือ method ที่สร้างขึ้นมา inherit จาก protocol นั้นมี func,property ครบตามแบบของ protocols)
*/

// Syntax
protocol FullyNamed {
    
    // ต้องประกาศเป็น var เท่านั้นเพราะสามารถเปลี่ยนค่าได้
    var surName : String { get }                // Read-Only Property
    var fullName : String { get set }           // Read-Write Property
    
    // Method
    func old() -> Int
    func oldWithOldString(old:Int,withString:String) -> (String)

}

// call the protocol struct
struct Struct1:FullyNamed {
    
    var surName:String = "Mr."
    var fullName:String = "Golf"
    
    func old() -> Int {
        return 25
    }
    func oldWithOldString(old: Int, withString: String) -> String {
        return ""
    }
    
}
var whatYourNameStruct1 = Struct1(surName: "Dr", fullName:"Kridsanapong")
whatYourNameStruct1.surName
whatYourNameStruct1.fullName


// call the protocol Class
class Class1:FullyNamed {
    
    var surName:String = "Mr."
    var fullName:String = "Golf"
    
    func old() -> Int {
        return 25
    }
    var resultString:String = ""
    func oldWithOldString(old: Int,withString: String) -> String {
        resultString = String(old) + withString
        return resultString
    }
}

var whatYourNameClass = Class1()
whatYourNameClass.surName
whatYourNameClass.fullName
whatYourNameClass.oldWithOldString(25, withString: " Years Old")
whatYourNameClass.resultString

