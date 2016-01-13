//: Playground - noun: a place where people can play

import UIKit

// Generic 
/*
    Generic คือการเขียนโค๊ดให้ยืดหยุ่น รองรับการทำงานกับหลายๆ data type ป้องกันการเขียนฟังก์ชั่นซ้ำซ้อน
*/


// Problem
// โจทย์ : สลับค่าระหว่างสองตัวแปร

func swapTwoInts(inout number1:Int,inout number2:Int){
    let tempA = number1
    number1 = number2
    number2 = tempA
}
var number1Int = 2
var number2Int = 20

swapTwoInts(&number1Int,number2:&number2Int)
print(number1Int)
print(number2Int)

// ทีนี้ถ้าเราจะเปลี่ยนข้อมูลอื่นๆที่ไม่ใช่ Int หละ ?
// เราก็ต้องมากำหนด method เหมือนๆกัน มารับ Type อื่นๆอีก เช่น swapTwoString,swapTwoDouble เป็นต้น
// ทำให้โค๊ดซ้ำซ้อน การเขียนโค๊ดแบบ Generic มาช่วยแก้ปัญหานี้


// Generic Functions
func swapTwoValue<T>(inout a:T,inout b:T) {
    let tempA = a
    a = b
    b = tempA
}

// Int
var genericInt1 = 9
var genericInt2 = 40
swapTwoValue(&genericInt1, b: &genericInt2)
print(genericInt1)
print(genericInt2)

// String
var genericString1 = "Hello"
var genericString2 = "World"
swapTwoValue(&genericString1, b: &genericString2)
print(genericString1)
print(genericString2)


/*
    T คือ placeholder type name (ตามที่เข้าใจเหมือนกับ T จะเป็น type อะไรก็ได้)
    T จะกำหนดตัวอักษรอื่นแทนก็ได้แต่ส่วนมากจะใช้ T,U,V
*/
func testCallAnyType<T>(param1:T,param2:String,param3:AnyObject){
    print(param1)
    print(param2)
    print(param3)
}
var color:Array<String> = ["Red","Green","Blue"]
testCallAnyType(color, param2: "String Only", param3: color)











/*
    หลังจากนี้ไม่ค่อยเข้าใจแล้ว
    ในเว็บ apple ยังไม่อีกเยอะเลย 😖
    https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Generics.html
*/

// Generic Types ??

struct IntStack {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}


var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// the stack now contains 4 strings





// Extending a Generic Type

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}
// prints "The top item on the stack is tres."




// Type Constraints
/* Syntax

    func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
        // function body goes here
    }
*/




func findStringIndex(array: [String], _ valueToFind: String) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
    print("The index of llama is \(foundIndex)")
}
// prints "The index of llama is 2"





