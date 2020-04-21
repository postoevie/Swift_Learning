import UIKit

// SIMPLE VALUS, CONTROLS
/*var itemString :String? = "stringPresent";

if let maybeNil = itemString {
    print("This string contains \(maybeNil)")
} else {
    print("String is nil")
}

let firstName = "Igor "
let lastName :String? = nil
let fullName = "Hello, \(firstName + (lastName ?? ""))"
print(fullName)

let movie = "terminato"
switch movie {
case "interstellar":
    print("movie about space")
case let x where x.hasPrefix("terminator"):
    print("I'll be back")
case "apple seed", "shrek":
    print("Time of cartoons!")
default:
    print("no such film in database")
}

let golfScores = [
    "Prince William": [1, 45, 3, 12],
    "Duke Grackham": [12, 43, 11, 2]
]

let insterestPersonName = "William"
for (name, scores) in golfScores {
    if name.contains(insterestPersonName) {
        print("Scores of sir \(insterestPersonName):", terminator:" ")
        for scoreItem in scores {
            print(scoreItem, terminator:" ")
        }
    }
}

 
//FUNCTIONS
print()
func goodbye (_ personName: String?, nextWeekDay: String?) -> String {
    return "Goodbye, \(personName ?? "friend"). See you \(nextWeekDay ?? "later")!"
}
print(goodbye("Mary", nextWeekDay: "Monday"))

//use tuple for return compaund value
func processNumbers(_ numbers: [Int]) -> (mean: Double, ave: Double) {
    
    var mean :Double
    //search for mean
    let sortedArray :[Int] = numbers.sorted()
    let arraySize :Int = sortedArray.count
    if arraySize % 2 == 0 {
        mean = Double(sortedArray[arraySize / 2 - 1] + sortedArray[arraySize / 2]) / 2
    } else {
        mean = Double(sortedArray[arraySize / 2])
    }
    
    let sum = numbers.reduce(0, +)
    let ave :Double = Double(sum) / Double(arraySize)
    
    return (mean, ave)
}

let numbersData = processNumbers([3, 4, 5, 6, 7])

print("Calculated mean: \(numbersData.mean), average:  \(numbersData.ave)")


enum Weapon {
    case sword
    case bow
    case spear
}

let weaponDamages = [
    Weapon.sword: 10,
    Weapon.bow: 6,
    Weapon.spear: 12
]

//nested functions, return functions, compound arguments
func createWarrior(name: String, armor: Int, weapons: Weapon...) -> (commonDamage:Int, health :Int, kills: Int, defence: ((Int) -> (String)), kill: ((Int) -> (String))) {
    let protection = armor
    let name = name
 
    var commonDamage = 0
    for weapon in weapons {
        commonDamage += weaponDamages[weapon] ?? 0
    }
 
    var health :Int = 100
    func defence (damage :Int) -> (String) {
        health -= damage / protection
        return "\(name) was wounded. Health: \(health)"
    }
    
    var kills = 0
    func kill (amount: Int) -> (String) {
        kills += amount
        return "\(name) killed someone. Kills  \(kills)"
    }
    
    return (commonDamage, health, kills, defence, kill)
}

let warrior1 = createWarrior(name: "Josef", armor: 20, weapons: Weapon.spear, Weapon.bow)

//измененные значения возвращаются, но
//при последующем вызове функции берутся значения
//указанные при создании тела функции
//замыкание(блок) захвтывает контекст при объявлении
print(warrior1.kill(2))
print(warrior1.defence(50))
print(warrior1.health)
print(warrior1.kills)

//using closures
let numbers = [1, 4, 7, 10, 5]

//explicitly
let biggerNumbersExp = numbers.map {(number: Int) -> Int in
    let result = number * 3
    return result
}

//implicitly opt 1
let biggerNumbersImp1 = numbers.map({number in 3 * number})

//imp opt 2
let biggerNumberImp2 = numbers.map {$0*2}
print (biggerNumberImp2)
 
 //function with implicit return
 func constructString() -> String {
     "Hello, this is implicit returner string!"
 }
 
 //function with optional tuple return value
 func minMax(array: [Int]) -> (min: Int, max: Int)? {
     if array.isEmpty { return nil }
     var currentMin = array[0]
     var currentMax = array[0]
     for value in array[1..<array.count] {
         if value < currentMin {
             currentMin = value
         } else if value > currentMax {
             currentMax = value
         }
     }
     return (currentMin, currentMax)
 }
 
 //inout parameters. by default parameeters are const
 //but there is bypass to change input (like by reference in c++)
 func swap(_ a: inout Int, _ b: inout Int) {
    let c = a
    a = b
    b = c
 }
x

//closures
var odds = [1, 3, 5, 7, 9, 11]
let oddsMultiply3 = odds.map({(number: Int) -> Int in
      number * 3
})

let reverseSorted = odds.sorted {$1 < $0}

*/


//CLASSES
/*
class Shape {
    var numberOfSides = 0
    let color = "red"
    func simpleDescription() -> String {
        return "The shape with \(numberOfSides) sides"
    }
    func setnNumberOfSides(number: Int?) {
        self.numberOfSides = number ?? 1
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDesc = shape.simpleDescription()

class NamedShape : Shape{
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

class Circle: NamedShape {
    var radius : Double
    var perimeter: Double {
        get {
            return radius * 2 * Double.pi
        }
    }
    init(name: String, radius: Double) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "The circle with radius \(radius)"
    }
}
let circle = Circle(name:"My circle", radius: 2)


class Image {
    let width :Int;
    let heigth :Int;
    
    init(_ width: Int,_ height: Int) {
        self.width = width
        self.heigth = height
    }
}

//lazy stored property initialization + parameter label
class URLImageDownloader {
    let urlString : String;
    let image :Image;
    
    init(url urlString: String) {
        self.urlString = urlString
        //call super.init
        //change values of prop defined by super
        //search for image by url
        //set image property
        self.image = Image(100, 100)
    }
}

class ImageViewController {
    //dont init until firstly accessed
    lazy var image = URLImageDownloader(url: "chair.bmp")
}

//

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, heigth = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var shiftedCenter = Point()
    
    var center: Point {
        get {
            let x = origin.x + size.width / 2
            let y = origin.y + size.heigth / 2
            return Point(x: x, y: y)
        }
        set (newCenterValue) {
            origin.x = newCenterValue.x - size.width / 2
            origin.y = newCenterValue.y - size.heigth / 2
            shiftedCenter.x = newCenterValue.x + shift
            shiftedCenter.y = newCenterValue.y + shift
        }
    }
    
    //just for show shortcut setter and getter declarations
    var shift: Double {
        get {
            20
        }
        set {
            shiftedCenter.x = center.x + newValue
            shiftedCenter.y = center.y + newValue
        }
    }
    
    //readonly computed property
    var diagonal :Double {
        sqrt(size.width * size.width + size.heigth * size.heigth)
    }
}

var simpleRectangle :Rect = Rect(origin: Point(x: 1, y: 1), size: Size(width: 10, heigth: 5), shiftedCenter: Point(x:1, y:1))

//property observers
class WorkPeocess {
    var tasksToComplete :Int {
        didSet {
            if(tasksToComplete < 1) {
                print("Specify at least 1 task. Setted to 1")
            }
            tasksToComplete = 1
        }
    }
    
    init(amount tasksToComplete: Int) {
        self.tasksToComplete = tasksToComplete
    }
    
    var totalTasks :Int = 0 {
        willSet (newTotalTasks) {
            print("About to complete work on \((newTotalTasks  *  100)/tasksToComplete) %")
        }
        didSet {
            if(oldValue > tasksToComplete) {
                print("Cant set more tasks then maximum or job complete")
                totalTasks = oldValue
            }
            print("Work completed on \(((totalTasks - oldValue) * 100)/tasksToComplete) %")
        }
    }
}



//proerty wrappers
@propertyWrapper
class PositiveValue {
    private var number :Int
    init() {self.number = 1}
    var wrappedValue :Int {
        get { number }
        set { number = max(1, newValue) }
    }
}


struct Rectangle {
    @PositiveValue var width: Int
    @PositiveValue var heigth: Int
}

var rect1 = Rectangle()
rect1.width = 0

@propertyWrapper
class MinMaxWrapper {
    private var min, max, number :Int
    var projectedValue: Bool
    init() {
        number = 1
        min = 1
        max = 10
        projectedValue = false
    }
    init(wrappedValue: Int) {
        self.number = wrappedValue
        self.min = 0
        self.max = 10
        projectedValue = false
        if(!isBetween(self.min, self.max, value: wrappedValue)) {
            self.number = min
        }
    }
    init(wrappedValue: Int, min: Int, max: Int) {
        self.min = min
        self.max = max
        self.number = wrappedValue
        projectedValue = false
        if(!isBetween(self.min, self.max, value: wrappedValue)) {
            self.number = min
            projectedValue = false
        } else {
            projectedValue = true
        }
    }
    var wrappedValue: Int {
        get {number}
        set {
            if(isBetween(self.min, self.max, value: newValue)) {
                number = newValue
                projectedValue = false
            } else {
                projectedValue = true
            }
            
        }
    }
    func isBetween(_ min: Int, _ max: Int, value: Int) -> (Bool){
        return value >= min && value <= max
    }
}

struct IntervalSizeRect {
    @MinMaxWrapper var width :Int
    @MinMaxWrapper(min: 1, max: 10) var heigth : Int = 1
    @MinMaxWrapper(wrappedValue: 1, min: 10, max: 10) var subWidth : Int
    @MinMaxWrapper var subHeigth : Int = 10
}

var rect2 = IntervalSizeRect()
rect2.subHeigth = 10
rect2.$subHeigth


//GLOBAL AND LOCAL VARS

//Type props
enum SolarSystem {
    static var amount :Int {
        return 8
    }
    static var showedPlanets = 5
}

class SomeClassWithVarTypes {
    static var someComputedVar: Int{
        get { 21 }
        set {newValue * 3}
    }
    static let someConst: Int = 1
    class var overriDableReadOnlyProp :Int{
        return 1
    }
}
*/

//Methods - functions associated with particular type

class Hero {
    var x = 0, y = 0
    func moveTo(x: Int, y:Int) {
        self.x = x
        self.y = y
    }
    func isAbandonSquare(squareSide: Int) -> (Bool) {
        x > squareSide || y > squareSide
    }
}

var hero1 = Hero()
hero1.moveTo(x: 10, y: 5)
hero1.isAbandonSquare(squareSide: 15)

//mutating methods
struct Rectangle {
    var width: Double
    var heigth: Double
    init() {
        width = 1
        heigth = 1
    }
    init(_ width: Double,_ heigth: Double) {
        self.width = width
        self.heigth = heigth
    }
    mutating func increase (byW widthDelta: Double, byH heigtDelta: Double) {
        self.width += widthDelta
        self.heigth += heigtDelta
    }
    mutating func setSizes(width: Double, heigth:Double) {
        self = Rectangle(width, heigth)
    }
}

var rectMutable = Rectangle()
rectMutable.increase(byW: 2, byH: 3)
print(rectMutable)
rectMutable.setSizes(width: 2, heigth: 1)
let rectImmutable = Rectangle()
//rectImmutable.increase(byW: 1, byH: 2) //error

enum Switch {
    case off, on
    mutating func next() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var ligthSwitch = Switch.off
ligthSwitch.next()

//Type methods
struct RaceTracker {
    static var maxCheckpoints :Int = 10
    static var unlockedCheckpoints :Int = 1
    var currentCheckpoint: Int = 0
    static func proceed (newCPValue :Int) {
        if (unlockedCheckpoints < newCPValue) {
            unlockedCheckpoints = newCPValue
        }
    }
    
    static func isProceeded(newCPValue :Int) -> Bool{
        return newCPValue <= unlockedCheckpoints
    }
    
    mutating func advance (nextCP: Int) -> Bool {
        if (RaceTracker.isProceeded(newCPValue: nextCP)) {
            currentCheckpoint = nextCP
            return false
        } else {
            return false
        }
    }
}

class Runner {
    var name: String
    var tracker: RaceTracker
    init(name: String) {
        self.name = name
        self.tracker = RaceTracker()
    }
    func achieve(to checkpoint: Int) {
        RaceTracker.proceed(newCPValue: checkpoint + 1)
        tracker.advance(nextCP: checkpoint + 1)
    }
}

var runner = Runner(name: "Josh")
runner.achieve(to: 1)
runner.tracker.advance(nextCP: 4)
