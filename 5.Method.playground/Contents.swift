//: Playground - noun: a place where people can play

import UIKit

// Method แบบปกติ
class MyFirstClass {
    var score = 0
    func addScore(inputScore:Int){
        score = score + inputScore
    }
}

var testClass = MyFirstClass()
testClass.addScore(20)
print(testClass.score)


/*
    โดยปกติแล้วค่า property ของ value type (struct,enum) จะเปลี่ยนค่าไม่ได้
    ถ้าต้องการจะเปลี่ยนค่าต้องใส่ mutating ไว้หน้า func
    โดยจะเปลี่ยน โดยการเขียนข้อมูลทับไปข้อมูลเดิมหลังจาก method สิ้นสุดลง
*/
struct MyFirstStruct {
    var score = 0
    mutating func addScore(inputScore:Int){
        score = score + inputScore
    }
}
var testStruct = MyFirstStruct(score:30)
testStruct.addScore(20)
print(testStruct.score)


struct selfStruct {
    var score = 0
    mutating func addScore(inputScore:Int){
        self = selfStruct(score: score + inputScore)
        // ใช้ self สร้าง instance ขึ้นมาใหม่
    }
}
var selfIntance = selfStruct(score:30)
selfIntance.addScore(20) // เรียก method เพื่อแก้ไขค่า property
print(selfIntance.score)





//  Type Property และ Type Method
/* 
    ไม่ได้สร้าง instance ในการเรียกใช้ Class และ Property
*/

class SomeClass {
    class func someTypeMethod() {
    }
}
SomeClass.someTypeMethod()      // call class


// Reference Type (Class) จะใช้ class

class classTestBonus {
    var score:Int = 0
    class var bonus: Int {
        get{
            return 10
        }
    }
    var totalScore :Int {
        return self.score + classTestBonus.bonus // เรียกใช้ Class Property
    }
    init (score:Int){
        self.score = score
    }
    class func showBonus (){
        print(self.bonus) // self ในที่นี้หมายถึง classTestBonus ไม่ใช่ instance
    }
    
    class func bonusSerfix (currency:String) {
        print(currency)
    }
}

classTestBonus.bonus
classTestBonus.showBonus()
classTestBonus.bonusSerfix("THB")

var instance1 = classTestBonus(score: 30)
instance1.totalScore

var instance2 = classTestBonus(score: 20)
instance2.totalScore


// Value Type (Strcture และ Enum) จะใช้ static นำหน้าชื่อ property หรืิอ method
struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}







