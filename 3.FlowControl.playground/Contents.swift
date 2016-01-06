//: Playground - noun: a place where people can play

import UIKit

/*
Operator
     x == y
     x > y
     x >= y
     x < y
     x <= y
     x != y
     x && y
     x || y
*/

// If statement
// ใส่วงเล็บตรง condition หรือไม่ใส่ก็ได้

let hasInvited = false
let vip = true
let money = 101
if money > 100 && hasInvited || vip{
    print("rich")
}else{
    print("not rich")
}


// for loop
// for condition increment

// รูปแบบ
// for init;condition;increment{
// }

// ประกาศ var index:Int ไว้ข้างนอกก็ได้
for var index = 0; index < 3;++index{
    print("index is \(index)")
}


// for in 
// มักใช้กับ collection (array/dict)

for c in "Hello".characters {
    print(c)
}

for index in 1...9{
    print("Hello \(index)")
    // print hello 1,2,3 ถึง 9
}


var color:Array = ["Red","Green","Blue"]
for item in color{
    print(item)
}


// enumerate array
// ดึง array ออกมาเป็น tuple
// (index,value) -- tuple
for (index,value) in EnumerateSequence(color){
    print("Item \(index+1) : \(value)")
}

// enumerate dictionary
var currency = ["USD":"US Dollar","THB":"Thai Baht"]
// สามารถใช้ _ underscroll ตรง key หรือ value เมื่อไม่ต้องการดึงค่า
for (key,value) in currency {
    print("Key \(key) , Value \(value)")
}



// While loop
// เมื่อเงื่อนไขเป็นจริงจะทำงานไปเรื่อยๆ เป็นเท็จจะหยุดทำงาน

var count = 0
while (count < 5){
    ++count
    print(count)
}


// Repeat-While
// ทำ repeat ก่อนตรวจสอบเงื่อนไขตอนท้าย (ทำ 1 ครั้งก่อนเสมอ)
repeat {
    print(count)
    ++count
}while(count < 5)



// Switch Case
// ไม่ต้องเขียน break ก็ได้
// เขียนหลายๆ case ในอันเดียวได้โดยคั่นด้วย ,

let someChar:Character = "b"
switch someChar {
    case "a","e","i","o","u":
        print("a e i o u")
    case "b","c","d":
        print("b c d")
    default:
        print("not match")
}

// switch with where
// where ใช้เพื่อตรวจสอบเงื่อนไขเพิ่มเติม

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
}
print(yetAnotherPoint)

// switch value binding 
// กำหนด value binding ชั่วคราว ซึ่งจะมีผลถายใน body ของแต่ละเคสเท่านั้น
var testPosition:(Int,Int) = (5,5)
switch testPosition{
    case (0,0):
        print("Centered")
    case (0,let y):
        print("0,\(y)")
    case (let x,0):
        print("\(x),0")
    case (let x,let y):         // เคสนี้คลอบคลุมทุกกรณี ไม่จำเป็นต้องกำหนด Default
        print("\(x),\(y)")
}


// Range Matching
let star = 1_000_000 // ใส่ _ กับตัวเลขเพื่อให้ดูง่ายได้
let countedThings = "ดาว"
let naturalCount:String
switch star {
    case 0:
        naturalCount = "no have star"
    case 1...3:
        naturalCount = "มีน้อยมาก"
    case 4...100:
        naturalCount = "มีน้อย"
    case 101...3_000_000:
        naturalCount = "มีเยอะ"
    default:
        naturalCount = "default"
}



// Tuples Matching

let somePoint = (0,0)
switch somePoint {
    case (0,0):                   // ถ้า somePoint เป็น 0,0 จะเข้าแค่ case 0,0 อันแรกอันเดียว
        print("0,0")
    case (_,0):                   // ไม่สนใจค่าตัวแรกจะเป็นอะไรก็ได้
        print("x,0")
    case (0,let y):
        print("0,x")
    case (-2...2,-2...2):
        print("in range")
    default:
        print("not in any case")
}



// Swift 2.0 Guard

var user       = "g"
var password   = "s"
var email      = "g"
var capcha     = "a"


// Problem : if ซ้อน if เยอะๆ
if user != "" {
    print("Valid User")
    if password != "" {
        print("Valid Password")
        if email != "" {
            print("Valid Email")
            if capcha == "sweet" {
                print("success register")
            } else {
                print("Invalid Capcha")
            }
        } else {
            print("Invalid Email")
        }
    } else {
        print("Invalid Password")
    }
} else {
    print("Invalid User")
}



/*

Syntax
------
guard ตรวจสอบเงื่อนไขเป็นจริง
    where โดยตรวจสอบเงื่อนไขอื่นๆร่วมไปด้วย
    else { เมื่อเงื่อนไขไม่เป็นจริงให้ทำอะไร จากนั้นต้องจบด้วย
        return              -- (เมื่อใช้งานใน function)
        throw               -- Errortype
        break               -- (เมื่อใช้งานใน switch)
        exit(1)             -- (เมื่อใช้งานทั่วไป) default
    }

    ชุดคำสั่งทำงานต่อไปเมื่อเงื่อนไขเป็นจริง
    **ถ้าเงื่อนไขไม่เป็นจริงระบบจะทำงานที่ else เสร็จแล้วจะไม่ทำงานที่เหลือหลังจากนั้นอีกเลย

*/


guard user != "" else { print("Invalid User")
        exit(1)
}
print("Valid User")

guard password != "" else { print("Invalid Password")
        exit(1)
}
print("Valid Password")

guard email != "" else { print("Invalid Email")
        exit(1)
}
print("Valid Email")

guard capcha != "" else { print("Invalid Capcha")
        exit(1)
}
print("Successfully Login")



// Guard with Where
var bLoginSuccess : Bool = true
var alphabetDict : Dictionary<String,String> = ["A":"Ant","B":"Bat","C":"Cat"]
guard let check = alphabetDict["A"]
    where bLoginSuccess == true
    else { print("no value found")
        exit(1)
}
print("check = \(check)")




// Control Transfer Statements
/*
    break               - หยุดการทำงานทั้งหมด
    continue            - หยุดการทำงานส่วนที่เหลือ ไม่หยุด loop (ใช้กับ switch case ได้)
    fallthrough         - switch case ใน swift ไม่ทำงานใน case ที่อยู่ล่างถัดไป 
                          ถ้าต้องการให้ทำถัดไปให้ใช้ fallthrough
                          (เมื่อเข้า case แล้วเจอจะทำ case ถัดไปเสมอ)
    return(function)
*/

for var x = 1; x < 10 ; x++ {
    if x == 5{
        // break // ถ้าใส่ break จะหยุด loop เลย print แค่ 1,2,3,4
        continue // ถ้าใส่ continue จะไม่ทำโค๊ดข้างล่าง ทำให้ print 1,2,3,4,6,7,8,9 ไม่มี 5
    }
    print(x)
}


