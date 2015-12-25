//: Playground - noun: a place where people can play

import UIKit


//------------------ VARIBLE ------------------//

//  DECARLE VARIBLE

//  let = constant (can't change value)
//  var = variable (can change value)


// Implicit data type
    var normalText = 123

// Explicit data type
    var helloMsg:String = "Hello"           // String
    var helloMsgObj:NSString = "Hello"      // Swift 2 has bridged NSString from Foundation framwork to String already
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

    let orangesAreOrange:Bool = true        // Bool

    let (x, y) = ("xx","yy")
    print(x)

    let letCantChange:String = "Can't Change"
    //    letCantChange = "tryChange"     // Error
    var varCanChange:String = "Can Change"
    varCanChange = "var Changed"




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

    // ImplicitlyUnwrapped Optional
    // ใส่ ! หลัง Data Type เพื่อเมื่อกำหนดค่าครั้งแรกไปแล้ว Optional ก็จะมีค่าเสมอ
    var testData:Int! = 34
    let assumedString:String! = "Implictitly unwarpped"
    print(assumedString)
    var forcedString:String? = "Forced unwarpped"
    print(forcedString)

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


