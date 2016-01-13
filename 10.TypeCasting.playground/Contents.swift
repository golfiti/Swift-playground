//: Playground - noun: a place where people can play

import UIKit

// Typecasting 
/*

    Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.

    Type casting in Swift is implemented with the is and as operators. These two operators provide a simple and expressive way to check the type of a value or cast a value to a different type.

*/
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var mySong = Song(name: "SongName", artist: "Rick Astley")
print(mySong.name)
print(mySong.artist)



// Downcasting
/*
    Downcasting คือ ความสามารถในการเข้าไปยัง Subclass ของ Type แล้วนำเอา Type นั้นๆ
    มากำหนดให้กับ instance หรือ ตัวแปร

    as? = optional allow nil
    as! = มั่นใจว่าได้ผลลัพธ์ออกมาแน่นอน (เจอ nil แล้วจะ error)

    AnyObject คือ Object ที่มี String,Int,Double,Array,Set,และอื่นๆ เป็น Subclass

*/

// Example 1
let myBose:AnyObject? = "Sawaddee Ja"
let employee = myBose as! String           // กำหนดให้ employee จะต้องมีค่า

let myBose2:AnyObject? = 5
// let employee2 = myBose2 as! String      // ไม่สามารถ downcasting ให้เป็น String ได้เพราะ nil
let employee3 = myBose2 as? String
print(employee3)                           // String "nil"



// Example 2
class Boss {
    func myFirstMethod() {
        print("Super Class")
    }
}
class Monster:Boss{                        // Monster เป็น Subclass ของ Boss
    func mySecondMethod() {
        print("Monster 1")
    }
}
class Minion:Boss {
    func myThirdMethod() {
        print("Minion 1")
    }
}

let instanceMonster = Monster()
let instanceMinion = Minion()

let group = [instanceMonster,instanceMinion]   // สร้าง array
print(group)

group[0]
// ทดสอบค่า group[0] สามารถ Downcasting ให้เป็น monster ได้หรือไม่
// ถ้าได้ก็จะกำหนดค่าให้ตัวแปร testMonster ต่อไป
if let testMonster = group[0] as? Monster{
    print(testMonster)
    testMonster.mySecondMethod()
}

group[1]
if let testMinion = group[0] as? Minion{
    testMinion.myThirdMethod()
}
else{
    print("Can't Downcasting")
    // group[0] ไม่สามารถ Downcasting ให้เป็น Minion จึงได้ค่า nil
    // เนื่องจาก instanceMonster ไม่ได้มี type เป็น Minion
    // ดังนั้น testMinion จึงมีค่าเป็น nil ไม่ได้เป็น instance ของ Class Minion
}




// Type Casting for Any and AnyObject
/*
    ในภาษา Swift จะมี special type aliases สำหรับสิ่งยังไม่ต้องการให้เป็น Type ใดๆ (non-specific types)
    AnyObject จะรองรับ instance ของ Class ใดๆ
    Any จะรองรับ instance ของทุกอย่าง รวมถึง func types

    --------------------------------------
    Use Any and AnyObject only when you explicitly need the behavior and capabilities they provide.
    It is always better to be specific about the types you expect to work with in your code.

*/


// AnyObject
let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]

for object in someObjects {
    let movie = object as! Movie
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}

for movie in someObjects as! [Movie] {
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}


// Any
var things = [Any]()            // ใส่ any เพื่อสร้าง array ชื่อว่า things สามารถใส่ได้หลายๆ type
things.append(0)                // add array type int index 0
things.append(0.0)              // add array type int index 1
things.append(42)
things.append(3.14159)
things.append("hello")          // add array type string
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

print(things)

for thing in things {
    switch thing {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let movie as Movie:
            print("a movie called '\(movie.name)', dir. \(movie.director)")
        case let stringConverter as String -> String:
            print(stringConverter("Michael"))
        default:
            print("something else")
    }
}