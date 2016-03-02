//: Playground - noun: a place where people can play

import UIKit


//------------------ VARIBLE ------------------//

//  DECARLE VARIBLE

//  let = constant (can't change value)
//  var = variable (can change value)


// Implicit data type
    var normalText = 123                    // ไม่ต้องกำหนด Type รู้เองว่า Type อะไร

// Explicit data type
    var helloMsg:String = "Hello"           // String
    var helloMsgObjC:NSString = "Hello"     // Swift 2 has bridged NSString from Foundation framwork to String already
    print(helloMsg)
    var postCode:Int = 111                  // Int
    var worldMsg:String?                    // define varible to nil
    print(worldMsg)
    worldMsg = "World"
    helloMsg += worldMsg!
    helloMsg.characters.count

    var stringNumber:String = "1234"
    var intNumber:Int? = Int(stringNumber)      // Convert String to Int // "?" allow nil value
    intNumber = nil                             // myint is Optional can nil (swift can assign interger to nil)
    var intNil:Int! = 30
    print(intNil)


    /*
        Integer คือ ตัวเลขจำนวนเต็มที่ไม่ใช่จุดทศนิยม เช่น 1, 3, 67, 99 เป็นต้น
        ซึ่ง Integer มีอยู่ด้วยกัน 2 แบบคือ siged และ unsigned
        1.signed เป็นบวกศูนย์หรือลบก็ได้ เช่น -5, -4, -3, -2, -1, 0, 1, 2
        2.unsigned เป็นบวกกับศูนย์ไม่มีค่าติดลบ 0, 1, 2, 3

        signed และ unsigned Integer มีทั้งในแบบ 8, 16, 32 และ 64 บิตตัวอย่าง เช่น
        UInt8 หมายถึง Unsigned Integer 8 bit
        Int32 หมายถึง Signed Integer 32 bit
    */

    var signedInt:Int = -1

    var unsign:UInt = 0
    // var unsign1:UInt = -1 // error range >= 0


    let orangesAreOrange:Bool = true        // Bool

    let (x, y) = ("xx","yy")
    print(x)

    let letCantChange:String = "Can't Change"
    //    letCantChange = "tryChange"     // Error
    var varCanChange:String = "Can Change"
    varCanChange = "var Changed"


    // Type Alias
    // คือการกำหนดชื่อให้กับ Value Type ที่มีอยู่
    // ประโยชน์ที่ได้คือเราต้องการอ้างอิงข้อมูลได้ง่ายขึ้น
    typealias myColor8bit = UInt8
    var currentColor:myColor8bit = 123
    // จากตัวอย่างได้ตั้งชื่อ myColor8bit ให้กับ UInt8 และต่อไปเราจะใช้ myColor8bit ในการเรียกใช้ได้เลย


    // Dictionary
    var nilDict:Dictionary<String,Int>?
    var currencyEmpty = [String: String]()
    var currecy:Dictionary       =  ["USD":"US Dollar","THB":"Thai Baht"]
    var currecyInferType         =  ["USD":"US Dollar","THB":"Thai Baht"] // infer type (compiler รู้เองว่าเป็น dict)
                  // key:value
    var currecy3:[String:String] =  ["USD":"US Dollar","THB":"Thai Baht"]

    // Access value in dictionary same as [dict objectForKey=""]
    currecy["THB"]
    currecy["YEN"]                  // Not have key "YEN"

    if !currecy.isEmpty{
        print("NOT Empty Dict")
    }

    // Get All Key & Value
    var key = currecy.keys
    var value = currecy.values
    currecy.count

    // Add Dict
    currecy
    currecy["YEN"] = "Japanene YEN"
    currecy

    // Update Dict
    currecy["USD"]
    currecy
    currecy["USD"] = "Dollar"
    currecy

    currecy.updateValue("Baht", forKey: "THB")
    currecy


    // Update Dict (if 'KEY NOT FOUND' will add new)
    currecy.updateValue("Won", forKey: "KOR")
    currecy

    // Remove Dict
    currecy["USD"] = nil
    currecy
    currecy.removeValueForKey("THB")
    currecy
    currecy.removeAll()
    currecy




    // Array
    // ข้อมูลใน Array ต้องเป็น Type เดียวกัน
    var emptyArray:Array = [String]()                               // Empty Array
    var color:Array<String> = ["Red","Green","Blue"]
    var fruit               = ["Apple","Banana"]                    // Infer type
    color.count + fruit.count

    for item in color {
        print(item)
    }

    if !color.isEmpty{
        print("NOT Empty Array")
    }
    if (emptyArray.isEmpty){
        print("Empty")
    }

    // Update Array Index
    color
    color[0...1] = ["White","Black"]
    color




    // Add Array (not need MutableArray : let or var แทนเอามั้ง)
    color.append("Cyan")                                       // Add at last index
    color.insert("Silver", atIndex: 1)                         // Add at custom index

    // Remove Array
    color.removeAtIndex(0)                                     // Remove at custom index
    color
    color.removeLast()                                         // Remove at last index
    color

    // + Optional
    // "?"  =  Optional ถ้ามีค่าก็เอาไปใช้ได้ ถ้าไม่มีก็ไม่ต้องทำอะไร (allow nil ให้ตัวแปร) ป้องกัน errror ตอน Runtime
    // "!"  =  ใส่ถ้าคิดว่า Optional นั้นมีค่าแน่ๆ (forced unwarpping) ถ้าไม่มีค่าจะ error | หรือใช้เมื่อบังคับให้ตัวแปรมีค่า


    let convertStringToInt = Int(stringNumber)
    let tmp = convertStringToInt! + 1       // ต้องใส่ ! เพราะ convertStringToInt
                                            // อาจจะมีค่าเป็น nil ได้ ซึ่งถ้ามีโอกาสเป็น nil
                                            // ซึ่งจะ error ตอน runtime อยู่แล้ว

    func OptionalWithString() -> String? {
        return "1234"
    }

    // Forced Unwrapped Optional
    // ใส่ ? หลัง Data Type เพื่อให้ตัวแปรสามารถเป็น nil ได้
    var OptionalWithReturn:String? = OptionalWithString()!      // ใส่ ? หลัง datatype String allow returnOp = nil
    // ใส่ ! หลัง OptionalTest() บังคับให้ OptionalTest ต้องมีค่า
    print(OptionalWithReturn)

    // Implicitly Unwrapped Optional (กำหนดให้ตัวแปรต้องมีค่าเสมอ)
    // ใส่ ! หลัง Data Type เพื่อเมื่อกำหนดค่าครั้งแรกไปแล้ว Optional ก็จะมีค่าเสมอ - Old 
    // ใส่ ! หลัง Data Type เพื่ิิอมั้นใจว่าตัวแปรนี้จะมีค่าเสมอ *ถ้าค่าตัวแปรเป็น nil จะใช้ไม่ได้
    // เหมือนกับประหยัดเวลา ไม่ต้องเรียกสร้างตัวแปรที่เป็น Optional ? ก่่อน เรียกใช่ ! ได้เลย

    /*
    Optional เป็นการอนุญาติให้ตัวแปรที่เราสร้างสามารถเป็น nil ได้ ซึ่งก่อนใช้งานตัวแปร 
    เราสามารถใช้ if ตรวจสอบว่ามีค่าว่างก่อนใช่งาน หรือถ้าเรามั่นใจว่าไม่เป็นค่า nil แน่ๆ 
    เราก็ใช้ Forced unwrapping (“!”) ได้เลย

    แต่ในบางครั้ง เรามั่นใจเสมอว่า Optional ที่เราสร้างขึ้น หลังจากที่เราได้ค่าออกมาใช้งานในครั้งแรกแล้ว 
    ตัวแปรนี้จะไม่เป็นค่า nil อีกต่อไป เราก็สามารถกำหนดได้ว่า ตัวแปรนี้ จะไม่มีวันเป็นค่า nil ตลอดไป ซึ่งจะเป็น optional 
    ที่มีค่าเก็บอยู่ 100% โดยปกติเราจะใช้เครื่องหมาย ! ตอนเรียกใช้งานตัวแปรทุกครั้ง ซึ่งบางทีมันก็เสียเวลาใช่ไหมครับ ทั้งที่เรามั่นใจว่า 
    ไม่ใช่ค่า nil แน่ๆ แต่ต้องมาใส่ “!” ทุกครั้งเลย   เพราะเหตุนี้จะมีวิธีให้เรายกเลิกการใช้เครื่องหมาย ! ทั้งหมดได้โดยง่าย 
    ซึ่งจะถูกเรียกว่า Implicitly Unwrapped Optional
    โดยที่ตอนที่สร้าง optional เราจะไม่ใช้เครื่องหมาย ? เพื่อสร้าง optional แต่เราจะใช้ ! ตั้งแต่ตอนสร้างเลย ยกตัวอย่างเช่น
    */
    var testData:Int!
    testData = nil
    if (testData == nil){
        print("sting \(testData)")
    }
//    print(testData)
    testData = 50
    testData
    print(testData)


    var assumedString:String! = "Implictitly unwarpped"
    print(assumedString) // not Optional
    assumedString = nil
    print("string \(assumedString)")
//    print(assumedString)      // Implicitly unwrapped nil value cause runtime error

    var forcedString:String? = "Forced unwarpped"
    print(forcedString)

    // Optional Chaining
    // ใส่ '?' หลังตัวแปล optional (ที่เดียวกับที่ใส่ '!' สำหรับ Force unwrapped) เพื่อเข้าถึง property, method, subscript ของตัวแปร Optional
    // ถ้าตัวแปร Optional นั้นมีค่า ส่งผลให้ Optional Chaining จะ return ค่าตรงตาม Data Type ของ property, method หรือ subscript นั้นๆ แต่จะเป็นค่า Optional เสมอ
    // ถ้าตัวแปร Optional นั้นไม่มีค่า(เป็น nil) ส่งผลให้ Optional Chaining จะ return nil
    class Person {
        var residence: Residence?   // ตัวนี้เป็น Optional
    }

    class Residence {
        var numberOfRooms:Int = 1
    }

    let john = Person() // ถ้าเรียกแบบนี้ จะเห็นว่าไม่มีการกำหนดค่าให้ตัวแปร residence ดังนั้น ตัวแปรนี้จะมีค่าเป็น nil (ตัวแปร Optioanl ค่าเริ่มต้นจะเป็น nil เสมอ)

    if let roomCount = john.residence?.numberOfRooms {
        print("John's residence has \(roomCount) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
    // เมื่อ residence มีค่าเป็น nil ทำให้ Optional Chaining return nil
    // จะ print "Unable to retrieve the number of rooms."

    john.residence = Residence()    // ถ้าเรากำหนดค่าให้ตัวแปร residence
    var roomCount2 = john.residence?.numberOfRooms
    print(roomCount2)
    // เมื่อ residence มีค่า ทำให้ Optional Chaining return ค่าของตัวแปร numberOfRooms ได้สำเร็จ
    // สังเกตุว่า roomCount2 เป็นตัวแปรชนิด Optional Int ในขณะที่ตัวแปร numberOfRooms นั้นเป็นแค่ Int เฉยๆ
    // นั่นก้อเพราะ Optional Chaining จะ return ค่าเป็น Optional เสมอ

    // + Tuple
    // (เหมาะกับค่าข้อมูลชั่วคราวที่ไม่ซับซ้อน)
    var http500Error:(Int, String) = (500,"Server Error")           // Tuple
    var http404Error = (statusCode:404,statusMsg:"Page Not Found")  // Tuple with name
    http404Error.1                                                  // อ้างอิงจาก Index
    http404Error.statusCode                                         // อ้างอิงจากชื่อ
    var (statusCode,statusMsg) = http500Error                       // กำหนดชื่อเรียกให้ข้อมูลใน tuple
    print(statusCode)                                               // อ้างอิงจากชื่อ

    var (justTheStatusCode, _) = http404Error                       // _ คือไม่สนใจค่า
    print(justTheStatusCode)

    // + Set (เหมาะกับค่าข้อมูลชั่วคราวที่ไม่ซับซ้อน)
    // ซ่ำกันไม่ได้ ไม่มีลำดับ
    // (เหมือน Set ในทางคณิตศาสตร์ที่เรียนตอน ม.4)

    // Define Set
    var android:Set     = ["Samsung S6","HTC"]
    var apple:Set       = ["iPhone 6","iPad","iPhone 5"]
    var iPhone:Set      = ["iPhone 6","iPhone 5"]

    var smartPhone      = android.union(apple)
    var setIPhoneOnly   = apple.intersect(iPhone)

    // Check subset
    setIPhoneOnly.isSubsetOf(iPhone)
    setIPhoneOnly.isSubsetOf(smartPhone)
    setIPhoneOnly.isSubsetOf(android)











    // Swift Collection -- VS -- Obj-C Collection
    // ควรใช้ Swift Colection มากกว่า
    // เพราะทำงานเร็วกว่า Foundation (แต่ Method น้่อยกว่า)

    var swiftCollection = ["A","B","C"]
    var objcFounddation:NSMutableArray = ["A","B","C"]

    swiftCollection[0] = "X"
    objcFounddation[0] = "X"

    swiftCollection.indexOf("B")
    objcFounddation.indexOfObject("B")


    // + Assert
    // ใช้ตรวจสอบค่าตอน run time
    // ถ้าเข้า case error จะหยุดทันที
    // เขียนใน Code ได้เลย ไม่ต้องไปเขียนใน Test
    let age = 0
    assert(age >= 0)
    assert(age >= 0, "age cannot be less than zero")     // with error msg


    //  Improved Enum
    enum TextCase {
        case Uppercase(String)
        case Lowercase(String)
    }

    let values: [TextCase] = [
        .Uppercase("FOO"),
        .Lowercase("iamlow"),
        .Uppercase("BAR"),
    ]

    for case let .Uppercase(value) in values {
        print(value)        //Print all of some case
    }


    // Enum

    enum compass {
        case north
        case east
        case south
        case west
    }
    let directionN = compass.north

    // shorthand
    enum thailandLocation {
        case north,east,south,west
    }
    let thLocate : thailandLocation
    thLocate = .north



    // Associated Value
    // การกำหนดค่าให้ enum

    enum ship {
        case dimension (Int,Int)
        case shipType(String)
        case life(Int)
    }

    var myShip = ship.dimension(10, 20)
    myShip = .shipType("War Ship")
    myShip = .life(0)

    switch myShip {
        
        // case not show auto completion
    case ship.life(let currentLife):
        if currentLife <= 0 {
            print("End")
        } else {
            print("Next Stage")
        }
    default:            // ใช้ default หากไม่ได้กำหนดในทุกๆ case ของ enum
        break
        
        // same as above
        
        //    case .life(let currentLife):
        //        if currentLife <= 0 {
        //            print("End")
        //        } else {
        //            print("Next Stage")
        //        }
        //    default:            // ใช้ default หากไม่ได้กำหนดในทุกๆ case ของ enum
        //        break
    }



    // Raw Value
    // เรียกดูค่าใน enum

    enum move : Int {
        case left = -1
        case right = 1
    }

    var pos:Int = 0
    var result = move.right

    switch result.rawValue {
    case -1:
        pos = pos-1
    case 1:
        pos = pos+1
    default:
        break
    }
    print("Current POS is \(pos)")



    // Enum auto value increment

    enum level : Int {
        case a = 1,b,c,d,e
    }
    enum sameAsEnumLevel : Int {
        case a = 1, b = 2, c = 3, d = 4, e = 5
    }
    var myLevel = level.b.rawValue



    // การกำหนดค่า enum จาก rawValue

    var dice = Int(arc4random_uniform(6)+1)
    var memberOfEnum = level.init(rawValue: dice) // swift 2.0 use .init(rawValue:)
    // rawValue เป็น optional
    if (memberOfEnum != nil) {
        switch memberOfEnum! {
        case .a :
            print("level \(dice) is a beginner")
        case .b :
            print("level \(dice) is a normal")
        case .c :
            print("level \(dice) is a hard")
            
        case level.d:
            print("level \(dice) is a expert")
            
        default :
            print("level \(dice) is advance")
        }
    }
    else {
        print("not match")
    }


