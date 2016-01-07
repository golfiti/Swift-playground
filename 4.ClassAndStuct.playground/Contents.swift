//: Playground - noun: a place where people can play

import UIKit


//------------------ Class & Struct ------------------//

// Class vs Struct

// Class สามารถถ่ายทอดได้ (inherit) | Struct Inherit ไม่ได้
// Class Type Casting เพื่อตรวจสอบ Instance นั้น Type อะไรตอน Runtime
// Class สามารถ Deinitailizer คืนความจำให้ระบบ
// Class จะมี Reference-Counting เพื่ออ้างอิงและเชื่อมโยง หลายๆ Instance เข้าด้วยกัน
// Class               - Reference Type -- ไม่ก๊อปปี้ค่า
// Structure และ Enum  - Value Type -- ก๊อปปี้ค่าไปใช้งาน


// Instance คือ object ที่สร้างขึ้นมาจาก class

// Class
class ClassName {

    var player:String // = "Unknown"
    var numberOfPlayer:Int // = 0
    
    // Default Initializer
    init(){
        // ถ้าไม่กำหนดค่า Default ตัวแปรจะใช้ Custom Init ไม่ได้
        player = "Unknown"
        numberOfPlayer = 0
    }
    
    // Custom Initializer
    init(inputPlayerName:String,inputNumberOfPlayer:Int){
        self.player = inputPlayerName               // self หมายถึงการอ้างอิงไปยัง Instace ปัจจุบัน
        self.numberOfPlayer = inputNumberOfPlayer
    }
    
    /*final*/ func addNumberOfPlayer(){             // ใส่ final เพื่อป้องกันไม่ให้ method นี้ถูก override ได้
        self.numberOfPlayer++
    }

}

let playerInstance = ClassName(inputPlayerName:"Golf", inputNumberOfPlayer: 1)
print("PLAYER NAME : \(playerInstance.player)",terminator:"")           // terminator print ตัด \n ออก
print("PLAYER NUMBER : \(playerInstance.numberOfPlayer)",terminator:"")


// Class with Inherit
class ClassName2:ClassName{             // ClassName2 inherit from ClassName
    
    var score :Int

    override init() {                   // init จะถูกเรียกเสมอเมื่อ class ถูกเรียก
        score = 99
        super.init()
    }
    init(myScore:Int) {
        self.score = myScore
        super.init()
    }
    // Override เมื่อต้องการให้ Sub Class ต่างจาก Super Class
    override func addNumberOfPlayer() {
        self.numberOfPlayer = self.numberOfPlayer+20
    }
}
var addNewPlayer = ClassName2(myScore:40)
addNewPlayer.score
addNewPlayer.player                 // default Value

addNewPlayer.addNumberOfPlayer()
addNewPlayer.numberOfPlayer         // จะเป็นค่าจาก method ที่ override


// Struct
struct StructName {
    var player:String = "Player StructName"
    init(){
    }
}


// เรียกใช้ property ของ Class & Struct
let classInstance = ClassName()
let structInstance = StructName()

var getFullNameInClass = classInstance.player
var getFullNameInInstance = structInstance.player






// Class เป็น Reference Type
/*
หากเรานำเอา Instance ที่สร้างจาก Class ไปกำหนดค่าให้กับ var หรือ let
จะ *ไม่ใช้วิธีกาก๊อบปี้ แต่จะเป็นการอ้างอิงกับ Instance ตัวเดิม
หากมีการแก้ไขค่าที่ Instance ภายใน ฟังก์ชันจะมีผลต่อ Instance ตัวเดิมที่เป็นต้นฉบับด้วย
*/
class ClassReferenceType{
    var var1:Int = 0
}
func classRefFunc(classRefTypeInstance:ClassReferenceType){ // ใช้ Class เป็น parameter
    let instance  = classRefTypeInstance        // กำหนดค่า (จะใช้ reference)
    instance.var1 = 10
}

var instanceClassRefType = ClassReferenceType() // สร้าง Instance ของ Class
print(instanceClassRefType.var1)
classRefFunc(instanceClassRefType)              // ผ่านค่า Instance ไปยังฟังก์ชัน
print(instanceClassRefType.var1)                // ค่าเปลี่ยนไปตามที่กำหนดในฟังก์ชัน


// Struct
/*
จะใช้วิธีการก๊อบปี้ค่า
*/
struct structReferenceType{
    var var1:Int = 0
}

func structRefFunc(structRefTypeInstance:structReferenceType){
    var instance = structRefTypeInstance        // กำหนดค่า (จะใช้ copy)
    instance.var1 = 12
    print(instance.var1)
}

var instanceStructRefType = structReferenceType()
structRefFunc(instanceStructRefType)
print(instanceStructRefType.var1)






// Computed Property -- Getter / Setter
/*
    Computed Property คือ property ที่เกิดจากการคำนวนค่า
    get คือ อ่านค่าจาก Computed property
    set คือ กำหนดค่าให้กับ Stored property อื่นๆ
*/
class TestGetterSetter {
    var score:Int = 0
    let bonus:Int = Int(arc4random_uniform(10)+1) // random bonus
    var totalScore:Int {                          // Computed property
        get {
            return self.score + self.bonus  // คำนวนค่าเก็บใน property อื่น
        }
        set {
            self.score = newValue           // กำหนดค่าผ่านทาง Computed property
                                            // newValue คือ ค่าที่เรากำหนดไปยัง Computed property
                                            // getterSetter.totalScore = 60 หมายความว่า newValue = 60
        }
    }
    
    init(score:Int) {
        self.score = score
    }
}

var getterSetter = TestGetterSetter(score: 10)
getterSetter.totalScore = 60
getterSetter.totalScore


/*
    lazy Stored Property
    lazy คือ stored property ที่ยังไม่กำหนดค่าเริ่มต้น จนกว่าจะเรียกใช้งานครั้งแรก
    ใช้กับ var เท่านั้น
*/

func getRandomNumber() -> Int{
    let randomNumber = Int(arc4random_uniform(6)+1)
    return randomNumber
}
class RandomNumber {
    var myScore:Int = 0
    lazy var myRandomNumber = getRandomNumber()
    
}
var lazyRandomNumber = RandomNumber()
lazyRandomNumber.myRandomNumber
