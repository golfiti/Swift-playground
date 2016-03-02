//: Playground - noun: a place where people can play

import UIKit

//-------------------- Func --------------------//
// ฟังก์ชันทั่วไปจะเป็นแบบ Global
// https://www.objc.io/issues/16-swift/swift-functions/#functions-as-parameters


    // No parameter No return value
    func hello(){
        print("Hello Golf")
    }
    hello()

    // No Return Type with (local) parameter
    // -- Local Parameter -- //

    func sumValue (value1:Int,value2:Int)->(){
        let result = value1 + value2
        print(result)
    }
    sumValue(1, value2: 3)
    func sumValueWithVoid (value1:Int,value2:Int)->(Void){
        let result = value1 + value2
        print(result)
    }
    sumValueWithVoid(1, value2: 4)    // parameter อันแรกไม่ต้องกำหนดชื่อ

    func funcWithParam (param1:Int,param2:Int,param3:String) {
        print(param1)
        print(param2)
        print(param3)
    }
    funcWithParam(1, param2: 2, param3: "3")

    func funcWithParam2 ( aaaa:Int,param2:Int,param3:String) {
        print(aaaa)
        print(param2)
        print(param3)
    }

    funcWithParam2(1, param2: 2, param3: "3")

    func sumValueWithParameter(value1:Int,value2:Int){
        let result = value1 + value2
        print(result)
    }
    sumValueWithParameter(1, value2: 2)


    // -- External Parameter -- //

    // Specifying External Parameter Names
    // เรียก external param ต้องเรียกจาก external name ที่กำหนดไว้,เริ่มเรียกจากชื่อตั้งแต่อันแรกเลย
    func specifyingExternalParamFunction(externalParameterName localParameterName: Int) {
        print(localParameterName)
    }
    specifyingExternalParamFunction(externalParameterName: 99)      // เรียกแบบมีชื่อ param

    // Omitting External param
    // ใช้ _ (underscroll) หน้า LocalParameter
    // เรียกแบบไม่ต้องมีชื่อ parameter
    func omittingExternalParam(firstParam:Int,_ secondParameter:Int){
        print("\(firstParam)")
        print("\(secondParameter)")
    }
    omittingExternalParam(11, 22)                                  // เรียกแบบไม่มีชื่อ param


    // Return with Parameter
    // "->" = หากฟังก์ชั่นมีการส่งค่ากลับมา จะต้องกำหนด return type ตาม
    func plusValue(value1:Float,value2:Float)->Float{
        // var sumValue:Float
        let sumValue = value1+value2
        return sumValue
    }
    plusValue(1, value2: 1)

    func sayHello(personName: String) -> String {
        let greeting = "Hello, " + personName + "!"
        return greeting
    }
    sayHello("Golf")


    //  Multiple return type
    //  Input with [Array] return with multiple value as tuple
    //  ต้องกำหนด data type ทุกตัวเป็นแบบเดียวกัน
    func myProfile(info: [String]) -> (name: String, lastname: String, old:String) {
        let myName = info[0]
        let myLastname = info[1]
        let myOld = info[2]
        return (myName,myLastname,myOld)
    }
    myProfile(["Krid","Wong","25"])  // return input as tuple

    func myProfileTest(info: [String]){
    }
    myProfileTest(["aaaaa","bbbbb"])


    func printDate(date: NSDate, format: String = "YY/MM/dd") -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(date)
    }

    // Default Value Parameter
    let orgName = "MyPay"
    func mobileTeam(name:String, lastname:String, role:String, org:String = orgName) -> String{
        let mobileTeamResult = name+" "+lastname+" "+role+" @"+org
        return mobileTeamResult
    }
    mobileTeam("Kridsanapong", lastname: "Wongthongdee", role:"iOS Dev")


    // Variadic Parameters
    // A variadic parameter accepts zero or more values of a specified type
    for test in 1...2{
        print("TEST \(test)") // print Test 1,Test 2
    }

    func helloWithNames(names: String...) {
        for name in names {
            print("Hello, \(name)")
        }
    }
    helloWithNames("Batman", "Superman", "Wonder Woman", "Catwoman")
//    helloWithNames("Pauline")


    // Constance & Variable parameter
    // สามารถแก้ค่าที่อยู่ใน parameter นี้ได้
    // copies ค่า parameter ที่ส่งมายัง Func
    // ออกมาเก็บไว้ใน local variable ที่ชื่อเดียวกับ parameter
    // แล้วนำค่าที่ก๊อปปี้ขึ้นมาใหม่นี้ไปใช้งานใน Func
    // ค่าที่ parameter ส่งมาจะไม่ถูกเปลี่ยน (เปลี่ยนค่าที่เรา copies มาแล้วเท่านั้น)
    func enterString(var string stringInput:String){
        stringInput = ("stringInput message \(stringInput)")
        print(stringInput)
    }

    let original = "test"
    enterString(string: original) // ค่าที่ส่งไปจะไม่ถูกเปลี่ยน
    print(original)


    // Inout Parameters
    // แก้ไขและแทนที่ตัวแปรเดิม
    var name1 = "Mr.A ant mod"
    var name2 = "Mr.B bird nok"
    func nameSwap(inout name1: String, inout name2: String) {
        let oldName1 = name1
        name1 = name2
        name2 = oldName1
    }
    nameSwap(&name1, name2: &name2)
    name1
    name2


    // Optionals Functions
    func myFuncWithOptionalType(parameter: String?) {
        print("\(parameter)")
    }

    myFuncWithOptionalType("someString")
    myFuncWithOptionalType(nil)


    // Nested Functions
    // (ฟังก์ชันซ้อนฟังก์ชันจะเรียกได้เฉพาะใน Func ตัวเอง)
    func father(){
        print("I'm Father")
        func child(){               // Local Func
            print("I'm child")
        }
        child()     // child จะเรียกได้เฉพาะในนี้ เรียกข้างนอกไม่ได้
    }
    father()        // จะต้องเรียก father ก่อน child จึงจะทำงาน
    // child()      // จะเรียก child ตรงนี้ไม่ได้


    // Func as Variable
    func addTwoInts(a: Int, _ b: Int) -> Int {
        return a + b
    }
    var mathFunction: (Int, Int) -> Int = addTwoInts
    mathFunction(2,3)
    let inferTypelet = addTwoInts
    inferTypelet(2,3)
    addTwoInts(2, 3)

    // https://developer.apple.com/library/mac/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html
    // Function Types as Parameter Types ??
    func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    printMathResult(addTwoInts, 3, 5)




    // Function Types as Return Types ??
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
        return backwards ? stepBackward : stepForward
    }


    // Functions in Class
    class TestCallFuncClass {
        func helloWorld(greeding:String){
            print(greeding)
        }
    }
    let testCallFuncInClass = TestCallFuncClass()
    testCallFuncInClass.helloWorld("สวัสดีจ้า")



    // Func type ในรูปแบบ Parameter
    func randomDiceNumber()-> Int{
        let dice = Int(arc4random_uniform(6)+1)
        return dice
    }
    func showDiceNumber(random:()->Int){
        print(random())
    }
    // randomDiceNumber()               // get ค่าที่ return กลับมาเฉยๆ ไม่เกี่ยว
    showDiceNumber(randomDiceNumber)    // เอา Func randomDiceNumber ที่ได้ค่าออกมามาเป็นตัวเลขสุ่ม เอามาเป็น parameter


    // Return type ในรูปแบบ Function Type ???
    var posX = 10                                          // Define posX
    var goDirectionRight:Bool = false

    func goRight(xPosition:Int)->Int{                      // input int return int xPosition
        return xPosition+1
    }

    func goLeft(xPosition:Int)->Int{
        return xPosition-1
    }

    func currentPos(testLeftRight:Bool)->(Int)->Int{       // กำหนด return type (Int)->Int
        let dicision:(Int)->Int = testLeftRight ? goRight : goLeft
        return dicision
    }

    var posXNow = currentPos(goDirectionRight)
    print("CurrentPos \(posXNow(posX))")









// --------- Closure --------- //

// Function as Variable
// Global Func
// Nested Func
// Closure Expression

// Syntax 
// {(parameter) -> return type in statement }
// หลัง in คือ โค๊ดของฟังก์ชั่นที่ไม่มีชื่อ

// ประกาศตัวแปรเพื่อเก็บ Closure
// ฟังก์ชันนี้ Closure จะดูงงๆเราจะประกาศตัวแปรเพื่อเก็บค่า Closure ให้ง่ายขึ้น
//func dismissView () {
//    UIView.animateWithDuration(0.2, animations: { () -> Void in
//        self.view.alpha = 0
//        self.view.frame = CGRectMake(0, 0, 300, 400)
//        }, completion: { (sucess) -> Void in
//            if sucess {
//                self.view.removeFromSuperview()
//            }
//        })
//}

// การประกาศตัวแปรเพื่อเก็บค่า func Closure จะใช้รูปแบบ
// var closureName: (parameterTypes) -> (returnType)
// func dissmiss() {
//        let animate = {
//                self.view.alpha = 0
//                self.view.frame = CGRectMake(0, 0, 300, 400)
//        }
//    
//        let doneAnimate = { (success:Bool) -> Void in
//            if success {
//                        self.view.removeFromSuperview()
//            }
//        }
//        UIView.animateWithDuration(0.2, animations: animate, completion: doneAnimate)

        // กำหนดตัวแปรให้กับ closure เพื่อให้ดูง่าย
        // animate
        // doneAnimate
    
        // มีการรับ parameter 3 ตัว 
        // คือ  - 0.2
        //     - animations
        //     - completion
// }



// Closure Syntax
var noParameterAndNoReturnValue: () -> () = {
    print("Hello!")
}
var noParameterAndNoReturnValue2 = {
    print("Hello!")
}


var noParameterAndReturnValue: () -> (Int) = {
    return 1000
}
var noParameterAndReturnValue2 = { () -> Int in
    return 1000
}


var oneParameterAndReturnValue: (Int) -> (Int) = { x -> Int in
    return x % 10
}
var oneParameterAndReturnValue2 = { (x: Int) -> Int in
    return x % 10
}


var multipleParametersAndReturnValue: (String, String) -> (String) = {
    (first, second) -> String in
    return first + " " + second
}
var multipleParametersAndReturnValue2 = {
    (first: String, second: String) -> String in
    return first + " " + second
}


var varClosure: (/*parameterTypes*/) -> (String)

// Optional
var optionalClosure:((/*parameterTypes*/) -> (String))?





// Normal Sort
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)

// Closures Sort
var closureReverse = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(names)    // Original
print(closureReverse)
print(reversed)




// Closures Expression
// เขียนแบบต่อกันไป (inline)

// Full Closure
var result1 = names.sort({(s1: String, s2: String) -> Bool in
    return s1 < s2
})

// Inferring Type From Context
var result2 = names.sort({s1,s2 in
    return s1 < s2
})

// Implicit Returns from Single-Expression Closures
// ต้องมีคำสั่งเดียวจึงจะสามารถไม่ใส่ return ได้
var result3 = names.sort({s1,s2 in s1 < s2})

// Shorthand Argument Names
// $0 - argument ลำดับที่ 0, $1 - argument ลำดับที่ 1,...
var result4 = names.sort({$0 < $1})
var result41 : (Double,Double,Double) -> Double
    result41 = {$0 * $1 * $2}
    print(result41(1,2,3))


// Operator Functions
var result5 = names.sort(>)




// Trailing Closure Syntax
// คือการเขียน Closure อยู่นอกวงเล็บ

// Trailing Closure Example 1
var numbers = [1,2,3,5,6,8,9]
numbers.sort { $0 < $1 }
func sum(from: Int, to: Int, f: (Int) -> (Int)) -> Int {
    var sum = 0
    for i in from...to {
        sum += f(i)
    }
    return sum
}

sum(1, to: 10) {
    $0          // Trailing Closure
}

sum(1, to: 10) {
    $0 * $0     // Trailing Closure
}


// Trailing Closure Example 2
func dice(diceInput:()->Int)->Int{
    let diceNumber = diceInput()
    return diceNumber
}

let low = dice(){   // ใช้ trailing closure โดยใส่วงเล็บก่อน แล้วค่อยใส่ปีกกา {
    ()->Int in      // Closure parameter type และ return type
    return Int(arc4random_uniform(3)+1) // random 1,2,3
}

let height = dice{ // เนื่องจาก closure ไม่มี parameter เราจึงตัด () ออกไปได้
    ()->Int in
    return Int(arc4random_uniform(3)+4) // random 4,5,6
}

let normal = dice{
    // ทราบว่า closure มี type เป็นอะไรอยู่แล้วจึงตัด ()->Int ออกไปได้
    // ตัด return ออกเนื่องจากมี statement เดียว
    Int(arc4random_uniform(6)+1)
}

print(low)
print(height)
print(normal)



/*
    Value Type และ Reference Type

    - Value type ก๊อปปี้ค่า ซึ่งหากค่าที่ถูกแก้ไขก็จะไม่มีผลต่อค่าต้นฉบับ
    constant หรือ variable ส่วนใหญ่จะเป็น value type
    
    - function และ closure เป็น reference type ซึ่งหากเราประกาศ variable หรือ let
    มารับ function หรือ closure จะมีการสร้าง reference ไปยัง function หรือ closure นั้นๆ
    จะเป็นการสร้าง pointer ดังนั้นการแกไขค่าใน reference type นั้นจะมีผลต่อต้นฉบับเสมอ
*/


/*
    Capture
    คือ ความสามารถของ closure ในการเลือกใช้ value type หรือ reference type
*/

func makeIncrementor(forIncrement amount:Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

var testIncrementby9 = makeIncrementor(forIncrement: 9)
testIncrementby9()
print(testIncrementby9())

var testIncrementBy5 = makeIncrementor(forIncrement: 5)
testIncrementBy5()
testIncrementBy5()
testIncrementBy5()
print(testIncrementBy5())



// a closure that take one Int and return an Int
var doubleRefType:(Int)->(Int) = { x in
    return 2*x
}
doubleRefType(2)

// you can pass closures in your code, for example to other variables
var alsoDouble = doubleRefType
alsoDouble(3)




// แก้ไขค่าใน Reference Type
let testIncrementBy8 = makeIncrementor(forIncrement: 8)     // ประกาศ constant
let newReference = testIncrementBy8                       // ประกาศ constant ขึ้นมาอีกตัว
newReference()
newReference()
testIncrementBy8()
print(newReference())
// ไม่ว่าจะเรียกใช้ newReference หรือ testIncrementBy8
// ก็จะมีผลเกี่ยวข้องกันจากการที่ใช้ reference ไปยังที่เดียวกันนั่นเอง


/*
    Note :

    swift จะตรวจสอบเองว่าใช้ capture แบบใด
    ถ้ามีการแก้ไขก็จะ capture ค่าในแบบ Reference Type 
    ถ้าไม่มีการแก้ไขก็จ capture ค่าในแบบ Value Type (ก็อปปี้ค่า)
*/



