//: Playground - noun: a place where people can play

import UIKit


//------------------ Class & Struct ------------------//

// Class vs Struct

// Class สามารถถ่ายทอดได้ (inherit) | Struct Inherit ไม่ได้
// Class Type Casting เพื่อตรวจสอบ Instance นั้น Type อะไรตอน Runtime
// Class Deinitailizer คืนความจำให้ระบบ
// Class จะมี Reference-Counting เพื่ออ้างอิงและเชื่อมโยง หลายๆ Instance เข้าด้วยกัน


// "final" ใส่ไว้หน้า function เพื่อไม่ให้ method นี้ถูก override ได้



class ClassName {

    var player:String
    var numberOfPlayer:Int
    
    // Default Init
    init(){
        // ถ้าไม่กำหนดค่า Default ตัวแปรจะใช้ Custom Init ไม่ได้
        player = "Unknown"
        numberOfPlayer = 0
    }
    
    // Custom Init
    init(inputPlayerName:String,inputNumberOfPlayer:Int){
        self.player = inputPlayerName  // self หมายถึงการอ้างอิงไปยัง Instace ปัจจุบัน
        self.numberOfPlayer = inputNumberOfPlayer
    }
}

let playerInstance = ClassName(inputPlayerName:"Golf", inputNumberOfPlayer: 1)
print("PLAYER NAME : \(playerInstance.player)",terminator:"")
print("PLAYER NUMBER : \(playerInstance.numberOfPlayer)",terminator:"")


class ClassName2:ClassName{
    
    var score :Int
    
    func addNumberOfPlayer(){
        self.numberOfPlayer++
    }
    
    override init() {
        score = 0
        super.init()  // ต้องใส่เมื่อ override ด้วย
    }
    
    init(myScore:Int) {
        self.score = myScore
        super.init()
    }
}
var addNewPlayer = ClassName2(myScore:40)
// ดึงค่า Init Default ของ Super Class มา
addNewPlayer.score
addNewPlayer.player
addNewPlayer.numberOfPlayer


struct StructName {
    var fullName:String = "bbbbbbb"
    init(){
    }
}

//let classInstance = ClassName()
//let structInstance = StructName()
//
//var getFullNameInClass = classInstance.fullName
//var getFullNameInInstance = structInstance.fullName


// init ที่อยู่ใน Class จะถูกเรียกอัตโนมัตเสมอ


// Computed Property -- Getter / Setter
