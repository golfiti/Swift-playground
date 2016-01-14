//: Playground - noun: a place where people can play

import UIKit

// Access Control

/*
    Class,Structures,Enum
    properties,method,init,subscripts
*/

/*
    public = meaning anyone can use the entity
    internal = meaning any code in the same module (application or framework) can use the entity
    private = meaning only code in the same source file can use the entity


    Default ไม่ใส่ จะเป็นแบบ Internal
    เช่น
        class someInternalClass {}
        let internalConstant = 0
*/


// Syntax
/*
    public class SomePublicClass{}
    internal class SomeInternalClass{}
    private class SomePrivateClass{}

    public var somePublicVariable = 0
    internal let someInternalConstant = 0
    private func somePrivateFunction() {}
*/


// Custom Types
    // Explictly = อย่างแน่ชัด
    // implicitly = โดยปริยาย

// Public Class
public class TestPublicClass {          // explicitly public class
    public var publicProperty = 0       // explicitly public class member
    var someInternalProperty = 0        // implicitly internal class member
    private func somePrivate() {}       // explicitly privar class member
}

// Internal Class
class TestInternalClass {               // implicitly internal class
    var internalProperty = 0            // implictly internal class member
    private func privateMethod(){}      // explictly private class member
}

// Private Class
private class TestPrivateClass {        // explictly private class
    var privateProperty = 0             // implictly private class member
    func privateMethod(){}              // implictly private class member
}


// Function Type
// ต้องประกาศ private หน้า func เพราะว่าเราใส่ return type tuple ต่ำสุดเป็น private class
private func minIsPrivateFunc() -> (TestPrivateClass,TestInternalClass){
    return minIsPrivateFunc() // return ตรงนี้กอล์ฟใส่มั่วไม่ให้ error
}
// ไม่ต้องประกาศ private
func minIsInternalFunc() -> (TestPublicClass,TestInternalClass){
    return minIsInternalFunc()
}



// SubClassing
// subclass ไม่สามารถกำหนด access level ให้สูงกว่า super class ได้
// เช่น ไม่สามารถเขียน public ใน subclass ที่มาจาก super class ที่เป็น internal
// แต่สามารถ override any class member (method, property, initializer, or subscript) ได้
public class Sport {
    private func superClassPrivateFunc() {
        print("hello super class")
    }
}

internal class Tennis: Sport  {
    override internal func superClassPrivateFunc() {
        super.superClassPrivateFunc()
        // เพราะว่า super class Sport ถูก define ไว้ในไฟล์เดียวกันถ้าจะให้ถูกต้อง 
        // call super.superClassPrivateFunc() แทน superClassPrivateFunc()
        print("hello tenis")
    }
}

let sportInstance = Sport()
sportInstance.superClassPrivateFunc()
let tennisinstance = Tennis()
tennisinstance.superClassPrivateFunc()


// Enum
public enum CompassPoint {
    case North
    case South
    case East
    case West
}



// Constants, Variables, Properties, and Subscripts
private var privateInstance = TestPrivateClass()


// Getter Setter 
// ?
// ใช้กับ constants, variables, properties, and subscripts
// สามารถกำหนดให้ setter มี access level ทีต่ำกว่า getter
// assign lower access level โดยการใส่คำว่า private(set) หรือ internal(set)

// This modification tracking is implemented with a didSet property observer on
// the value property, which increments numberOfEdits every time the value
// property is set to a new value.

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
}

public struct TrackedString2 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    public init() {}
}


var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
stringToEdit.value += "+1"
print("The number of edits is \(stringToEdit.numberOfEdits)")






