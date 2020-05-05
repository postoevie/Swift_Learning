import UIKit

// SIMPLE VALUES, CONTROLS
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
/*
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
*/
/*
//Subscripts
class HasROSubscript {
    subscript(index: Int) -> Int{
        return index * 3
    }
}

let objWithSubScript = HasROSubscript()
print(objWithSubScript[2])//prints 6


struct Vector3 {
    var x, y, z :Int
    init(_ x: Int,_ y: Int,_ z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}

class Matrix3D {
    let size :Vector3
    var values: [Double]
    init(_ x: Int,_ y: Int,_ z: Int) {
        self.size = Vector3(x, y, z)
        self.values = Array(repeating:0.0, count: x * y * z)
    }
    subscript(xValue: Int, yValue: Int, zValue: Int) -> Double {
        get {
            return values[(size.x * size.y * zValue) + (size.x * yValue) + xValue]
        }
        set {
            values[(size.x * size.y * zValue) + (size.x * yValue) + xValue] = newValue
        }
    }
}

var matrixDim3 = Matrix3D(2, 2, 2)
print(matrixDim3[1,1,1])
matrixDim3[1,1,1] = 3
print(matrixDim3[1,1,1])


//enums
enum Chess {
    case king, queen, rook, bishop, knight, pawn
    func simpleDescription() {
        switch self {
            case .king: print("King")
            case .queen: print("Queen")
            case .rook: print("Rook")
            case .bishop: print("Bishop")
            case .knight: print("Knight")
            case .pawn: print("Pawn")
        }
    }
}

var figure :Chess = .bishop
figure.simpleDescription()

enum ServerResponse {
    case success(String, String)
    case unauthorized(String)
    case forbidden(String)
}

let success = ServerResponse.success("Hello", "6  AM")
let unauthorized = ServerResponse.unauthorized("Unauthorized")
let forbidden = ServerResponse.forbidden("Forbidden")

switch forbidden {
    case let .success(greeting, timestamp):
        print("\(greeting), it's \(timestamp) now")
    case let .unauthorized(message):
        print("Sorry, error: \(message)")
    case let .forbidden(message):
        print("Server error: \(message)")
}

let processorName = "AMD Athlon"
switch processorName {
    case "Intel Core 2 DUO": print("Intel Core 2 desc")
    case let name where name.hasPrefix("AMD"):
        print("AMD Family processor")
        switch name {
        case let model where model.contains("Ryzen"): print("Ryzen line")
        default: print("Old or unknown model")
    }
    default: print("Unknown processor")
}


protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func add()
}

class SimpleClass : ExampleProtocol {
    var simpleDescription: String = "description for suit protocol"
    func add() {
        simpleDescription.append(" Protocol used succesfully")
    }
}

struct SimpleStruct : ExampleProtocol {
    var simpleDescription: String = "good structure"
    mutating func add() {
        simpleDescription.append(" Even conforms protocol.")
    }
}

var sc = SimpleClass()
sc.add()

//extention
extension Double : ExampleProtocol {
    var simpleDescription: String {
        return "It is simple description of extended Double! Number \(self)"
    }
    mutating func add() {
        self += 50
    }
}


//error handling

//1st approach
enum ErrorCode: Error {
    case stackOverflow(String)
    case networkUnavailable
    case notEnoughDiskSpace
}

func compile(sourceMeta :String) throws -> String {
    if sourceMeta.contains("infinity loop") {
        throw ErrorCode.stackOverflow("It is stackoverflow!")
    }
    if sourceMeta.contains("no enough disk space") {
        throw ErrorCode.notEnoughDiskSpace
    }
    return "Code compiled succesfully"
}

do {
    let result = try compile(sourceMeta: "good code but no enough disk space")
    print(result)
} catch ErrorCode.notEnoughDiskSpace {
    print("Disk space error")
} catch let complierError as ErrorCode {
    print ("Just comple error \(complierError)")
} catch {
    switch error {
    case let ErrorCode.stackOverflow(message):
        print("Error occured with message: \(message)")
    default: print("Error occurs \(error)")
    }
}

//2nd approach
let failureCompiled = try? compile(sourceMeta: "infinity loop")
print("failure compiled result \(String(describing: failureCompiled))")

//defer

enum HomeError: Error {
    case noVisitors
}
var isHouseDoorOpened = false

func visitHome(visitorsNumber: Int) throws {
    isHouseDoorOpened = true
    defer {
        isHouseDoorOpened = false
    }
    
    if visitorsNumber < 1 {
        throw HomeError.noVisitors
    }
}

try? visitHome(visitorsNumber: 0)
print(isHouseDoorOpened)


//GENERICS
func makeArray<Item>(repeatingItem item:Item,
                     numbeOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 1...numbeOfTimes {
        result.append(item)
    }
    
    return result
}

let woofs = makeArray(repeatingItem: "woof", numbeOfTimes: 3)

func commonElements<T: Sequence, U: Sequence> (lSeq: T, rSeq: U) -> [T.Element] where T.Element: Equatable, T.Element == U.Element{
    var commonElements = [T.Element]()
    for lItem in lSeq {
        for rItem in rSeq {
            if(lItem == rItem) {
                if(!commonElements.contains(lItem)){
            commonElements.append(lItem)
                }
            break
            }
        }
    }
    return commonElements
}

commonElements(lSeq: [1, 3, 5, 7], rSeq: [3, 7, 3])


//guard
func callToServer(name: String?) {
    guard let nameSentToServer = name else {
        print("No name specified")
        return
    }
}

// or

func oldCallToServer(name: String?) {
    if let nameSentToServer = name {
        
    } else {
        print("No name specified")
    }
}

//regexp 3 approaches
import Foundation
func disemvowel(_ s: String) {
    //using String.range
    let invitation = "Fancy a game of Cluedo™?"
    let rangeI = invitation.range(of: #"\bClue(do)?™?\b"#,
                     options: .regularExpression)
    if let unwrappedRange = rangeI {
        print(invitation[unwrappedRange])
    }
    
    //using NSRegularExpression - common way
    let testInput = "Hello world"
    let range = NSRange(location: 0, length:testInput.count)
    let regex = try! NSRegularExpression(pattern: "^[o]")
    
    //String.replacingOccurences - modify string
    testInput.replacingOccurrences(
        of: #"(a|u|o|i|e)"#,
        with: "",
        options: .regularExpression
    )
}
 */

/*
//Basics again

//type aliases

typealias WaterLevel = UInt8
var currentWL = WaterLevel.min

//Tuples
let personDescriptioShort = (name: "Paul", age: 35)

print("Person's name is \(personDescriptioShort.0), his/her age is \(personDescriptioShort.age)")

let (age, _) = personDescriptioShort
print("age again \(age)")


//optionals

let possibleNumber = "helloworld"
let convertedNumber:Int? = Int(possibleNumber)

var code: Int? = 404
code = nil

var settedtToNilAuto: Int?

if convertedNumber != nil {
    print("That string contains a number: \(convertedNumber!)")//exclamation point = ! or force unwrapping
}

//optional binding

if var actualNumber = Int(possibleNumber) {
    print("That string contains a number: \(actualNumber + 1)")//exclamation point ! = force unwrapping
} else {
    print("String \(possibleNumber) cannot be converted")
}

if let firstNumber = Int("4"), let secondNumber = Int("24"), firstNumber < secondNumber && secondNumber < 90 {
    print("numbers accomplish all conditions")
} else {
    print("ONE of the conditions wasn't accomplished")
}


//implicitly unwrapped optionals
let possibleString: String? = "An optional string"
let forcedStr: String = possibleString!

let assumedString: String! = "Assumed String"
let implicitString: String = assumedString

if let definiteString = assumedString {
    print(definiteString)
}


struct Kitchen {
    static var ingridientsForSandwitch = [
        "cheese": 1,
        "bread": 0,
        "butter": 1,
        "sausages": 2
    ]
    static var cleanDishes = 0
}

struct Sandwich {
    static let filling = [
        "cheese": 2,
        "bread": 1,
        "butter": 1,
        "sausages": 1
    ]
}

enum SandwichError : Error {
    case missingIngridients(ingridients: String)
    case outOfCleanDishes
}

//error handling
func makeSandwich() throws {
    if Kitchen.cleanDishes < 1 {
        throw SandwichError.outOfCleanDishes
    }
    
    var missedIngridients: String = ""
    for ingridient in Sandwich.filling {
        if(Kitchen.ingridientsForSandwitch[ingridient.key]! < Sandwich.filling[ingridient.key]!){
            missedIngridients.append("\(ingridient.key) ")
        }
    }
    if(!missedIngridients.isEmpty) {
        throw SandwichError.missingIngridients(ingridients: missedIngridients)
    }
    
    print ("Bon appetit!")
}

func eatSandwitch() {
    print("Sandwitch has been eaten. Thank you!")
}

do {
    try makeSandwich()
    eatSandwitch()
} catch SandwichError.outOfCleanDishes {
    print("No clean dishes. Cleaning started...")
} catch SandwichError.missingIngridients(let ingridients) {
    print("Go to market. We need to buy \(ingridients)")
}
*/

/*
//assertions and preconditions

//assertions only in debug
let age = 10
assert(0 < age && age < 100, "Value of age is invalid")

if age < 0 {
    assertionFailure("Wrong age value")
}

//preconditions - everywhere. if unchecked mode off
let index = 1
precondition(index >= 0, "Index mustn't be less than 0")

//also
class PartlyCompletedClass {
    func stubFunction() {
        fatalError("This function isnt implemented yet")
    }
}

//operators - standard and advanced

//standard: C unary, binary, teranry operators, but:
//1) assigment operator deosnt return value
//2) arythmetic operators check for value owerflow
//3) there is nil coalesing operator a ?? b: unwraps optional a, if a == value, ret a, if a == nil, return b
//4) range operator 1...5 and half-range op 1..<5
//5) one-sided range:

var names = ["Nina", "Oksana", "Sergey", "David"]
for name in names[1...] {
    print(name)
}
print()
for name in names[..<2] {
    print(name)
}

//cannot
//for name in names[1<..]

let range = ...5
range.contains(7)
range.contains(-1)


//Strings

//in Unicode
//concat
let str1 = "str1"
let str2 = "str2"
print(str1 + " " + str2)

//multiline
let someEnglishText: String = """
    Why do guys play basketball after lessons?
        They just want to have a rest. \
    We could go play with them
    Ok, let's go
    """
print (someEnglishText)

//extended delimeters
var someText = #"Line1 \n Line2"#
print(someText)
someText = #"Line1 \#n Line2"#
print(someText)

//empty string
var empStr1 = ""
var empStr2 = String()

//String class implement as mutable as immutable strings
//String are value types!
//String interpolation
var amount = 6
var sport = "valleyball"
let predicateString = "There are \(amount) players in \(sport)"
let withExtDels = #"There are \#(amount)"#

//Unicode scalar values(21-bit), extended grapheme clusters...
let stringWithUnicodeChars = "{\u{1F1FA}\u{1F1F8}"
print(stringWithUnicodeChars)
//string concatenation and modification may not always affect a string’s character count. e.g. when use extended graphems
//characters can require different amount of memory -> can't indexed by integer -> indexed by String.Index

var JPGreeting = "Konichiwaa"
print(JPGreeting[JPGreeting.index(JPGreeting.startIndex, offsetBy: 2)]) // -> substring. short-term access. to long term - copy to string
//indeces also available for COllections: Arrays, dictionaries, sets

var insertMe = "n"
JPGreeting.insert(contentsOf: insertMe, at: JPGreeting.index(JPGreeting.startIndex, offsetBy: 2))
JPGreeting.remove(at: JPGreeting.index(before: JPGreeting.endIndex))
let indexRange = JPGreeting.index(JPGreeting.endIndex, offsetBy: -6)..<JPGreeting.endIndex
JPGreeting.removeSubrange(indexRange)

//Two String values (or two Character values) are considered equal if their
//extended grapheme clusters are canonically equivalent.
//and latin A and Russian A are unequivalent
//String hasPrefix , has Suffix
x
//Collection types
//arrays, sets, dictionaries. mutable, immutable

//Arrays
var items = [Int]()
items = Array<Int>()
items.count
items.append(1)
items = []

let threeDb = Array<Double>(repeating: 1, count: 3)
let twoDb = Array(repeating: 1.2, count: 2)

let fiveDbs = threeDb + twoDb

var shoppingList = ["Butter", "Milk"]
shoppingList.count
shoppingList.append("Bread")
shoppingList += ["Eggs", "Cocoa", "Potato"]
shoppingList[1...2] = ["Bananas", "Apples"]
shoppingList.insert("Eggplant", at: 1)
shoppingList.count
let removedItem = shoppingList.remove(at: 1)
shoppingList.removeLast()

//iterate
for product in shoppingList {
    product
}

for (index, product) in shoppingList.enumerated() {
    (index, product)
}

//Sets
//Values - hashable

var colors = Set<String>()
colors.insert("Green")
colors = [] // string set yet

var favoriteGenres: Set = ["Rock", "Classical", "Electronic"]

favoriteGenres.isEmpty

let digits1: Set = [0, 1, 3, 4, 7]
let digits2: Set = [1, 4, 7 , 8, 5]

digits1.union(digits1).sorted()
digits2.intersection(digits2)
digits1.symmetricDifference(digits2)
digits1.isDisjoint(with: digits2)
digits2.isSuperset(of: digits2)

//Dictionaries
var readableNumbers = [Int : String]()
readableNumbers[0] = "zero"
readableNumbers = [:]
*/
var dictEngRus = [
    "Apple": "Яблоко",
    "Cucumber": "Огурец",
    "Peach": "Персик",
    "Tomato": "Томат"
]

dictEngRus["Plant"] = "Растение"

//returns optional (old value or nil)
dictEngRus.updateValue("Хлеб", forKey: "Bread")

let potatoInRussian = dictEngRus["Potato"]

if let value = potatoInRussian {
    "Potato in Russian is: \(value)"
} else {
    "No word in dictionary"
}
if let removedVal = dictEngRus.removeValue(forKey: "Peach") {
    "\(removedVal) succesfully removed from dictionary"
}

//Control flow

//dicts sets - unordered
for (eng, rus) in dictEngRus {
    "\(eng) : \(rus)"
}

for index in 0...5 {
    index
}

var base = 2
let power = 3
var answer = 1
for _ in 1...power {
    answer *= base
}

//and through
let interval = 10

loopLabel: for tickmark in stride(from: 0, to: 60, by: interval) {
    if(tickmark == 20) {
        continue loopLabel
    }
    print(tickmark)
}

// when we dont know amount of iterations - use while

let boilingTemperature = 80
var pressureStatus: String?
switch boilingTemperature {
    case 20...40: pressureStatus = "Low"
    case 41...70: pressureStatus = "Middle"
    case 71...90: pressureStatus = "Extra middle"
    case 91...100: pressureStatus = "Normal"
                   fallthrough
    default: break
    
}

if let actualStatus = pressureStatus {
    "pressure status is \(actualStatus)"
}

let point = (0, 1)
let position: String

///first matched case used
switch point {
    case (0, 0): position = "origin"
    case (_, 0): position = "on the y axis"
    case (let distance, 0), (0, let distance):
    position = "On an axis, distance \(distance)"
    case(-1...1, -1...1): position = "inside the box"
case(-1, 1), (1, 1), (-1, -1), (1, -1): position = "on the central square corner with length 1"
    case let (x, y) where x == y: position = "on the line x == y"
    case let (x, y): position = "some arbitrary point at \(x):\(y)"
}

//guard
func getRussianTomato (dictionary: [String: String]) -> (String?) {
    guard let tomatoInRussian = dictionary["Tomato"] else {
        "No tomato translation"
        return nil// break continue throw fatalerror - exit the block
    }
    return tomatoInRussian
}

//Functions

func greeting(_ names: String...) -> String? {
    if names.isEmpty {
        return nil
    }
    return "Hello \(names.joined(separator: ", "))"
}

if let greetingString = greeting("Shen", "Kate", "Lee") {
    greetingString
} else {
    "no one to greet"
}

func swapTwoInts (_ a: inout Int, _ b: inout Int) {
    a = a + b
    b = a - b
    a = a - b
}

//multiple return value
//optional tuple return
//implicit return
//function argument labels
//omitting arg labels
//default par values
//variadic parameters
//in-out
//function types
//funct types as int parameter and return val
//nested functions

