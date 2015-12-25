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

    // No Return Type with param
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

    funcWithParam(1, param2: 2, param3: "3")

    func sumValueWithParameter(value1:Int,value2:Int){
        let result = value1 + value2
        print(result)
    }
    sumValueWithParameter(1, value2: 2)


    // Specifying External Parameter Names
    // เรียก external param ต้องเรียกจาก external name ที่กำหนดไว้,เริ่มเรียกจากชื่อตั้งแต่อันแรกเลย
    func specifyingExternalParamFunction(externalParameterName localParameterName: Int) {
        print(localParameterName)
    }
    specifyingExternalParamFunction(externalParameterName: 99)


    // Omitting External param
    // ใช้ _ หน้า LocalParameter
    // เรียกแบบไม่ต้องมีชื่อ param เลย
    func omittingExternalParam(firstParam:Int,_ secondParameter:Int){
        print("\(firstParam)")
        print("\(secondParameter)")
    }
    omittingExternalParam(11, 22)


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
    enterString(string: "test") // ค่าที่ส่งไปจะไม่ถูกเปลี่ยน


    // Inout Parameters
    // แก้ไขและแทนที่แปรเดิม
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

    // https://developer.apple.com/library/mac/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html
    // Function Types as Parameter Types ??
    func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    printMathResult(addTwoInts, 3, 5)


    func randomDice()->Int{
        let dice = Int(arc4random_uniform(6)+1)
        return dice
    }
    func showDiceNumber(random:()->Int){
        print(random)
    }
    showDiceNumber(randomDice)


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























// --------- Closure --------- //
// Function as Variable
// Global Func
// Nested Func
// Closure Expression

func diceRadom()->Int{
    let dice = Int(arc4random_uniform(6)+1)
    return dice
}

func doubleDice(diceInput:()->Int)->Int{
    let diceNum = diceInput()*2
    return diceNum
}

var yourTurn = doubleDice(diceRadom)
print(yourTurn)















