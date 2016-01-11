//: Playground - noun: a place where people can play

import UIKit

// Initializer
// Initializer คือ Method แบบพิเศษในการกำหนดค่าเริ่มต้นให้กับ Instance ที่อยู่รัหว่างการสร้าง Instance
// Initializer จะไม่มีการ return ค่ากลับมา




// Initializer : Reference Type

class testClass {
    var property1:Int?          // กำหนดเป็น Optional ไม่ต้องใส่ parameter ตรง init ก็ได้
    var property2:String
    var storedProperty = "I'm Stored Property"   // ไม่จำเป็นต้องกำหนดค่าใน init อีก
    //var storedProperty2:String

    let propertyConstant:Int    // Constant
    
    
    // ใส่ _ เป็น External Parameter เพื่อที่เวลาเรียกไม่ต้องใส่ชื่อ
    init(_ secondProperty:String,thirdProperty:Int){    // Custom Initializer
        property2 = secondProperty
        storedProperty = "Init Stored Property" // ถ้ากำหนดค่าให้ Stored Property ใน init อีกจะใช้ค่านี้
        self.propertyConstant = thirdProperty
    }
}
var testInstance = testClass("Golf",thirdProperty:3)
testInstance.property1 = 1  // กำหนดค่าให้ property1 ถ้าไม่กำหนดจะเป็น nil
print(testInstance.property1)
print(testInstance.property2)

print(testInstance.storedProperty)

print(testInstance.propertyConstant)   // ประกาศเป็น let (Constant) ซึ่งจะแก้ไขค่า*ไม่ได้*เมื่อ instance ถูกสร้างเรียบร้อยแล้ว แต่สามารถแก้ได้ระหว่าง Initialization



// Initializer : Value Type

// Memberwize Initializer
/*
Structure ไม่ต้องสร้าง custom initializer
ก็สามารถใช้ parameter เพื่อผ่านค่าไปยัง property ขนะสร้าง instance ได้เลย
*/

struct MemberwizeStruct {
    let property1 : Int
    var property2 : String
}
var memberwizeStructInstance = MemberwizeStruct(property1: 2, property2: "Mypay")
print(memberwizeStructInstance.property1)
print(memberwizeStructInstance.property2)



struct MemberwizeStructCancel {
    let property1 : Int
    var property2 : String
    init(){                     // Custom Initializer
        property1 = 3
        property2 = "MP"
    }
}
var structCancleMemberwize = MemberwizeStructCancel()
// var structCancleMemberwize = MemberwizeStructCancel(property1:5,property2:"GG") // Error Memberwize Cancel
structCancleMemberwize.property1
structCancleMemberwize.property2


struct StructTest {
    let property1 : Int
    var property2 : String
    
    init(property1:Int,_ property2:String="Not Assign"){
        self.property1 = property1
        self.property2 = property2
    }
    
    init(propertyInput1:Int,propertyInput2:String){
        self.init(property1:propertyInput1,propertyInput2)
    }
}


var testInstanceStruct = StructTest(property1: 5)
var testInstanceStruct2 = StructTest(property1: 20 ,"Param2")
print(testInstanceStruct.property1)
print(testInstanceStruct.property2)

print(testInstanceStruct2.property1)
print(testInstanceStruct2.property2)



// Required




