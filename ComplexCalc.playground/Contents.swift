import Foundation

print("Welcome back to the UW Calculator")

// Your job is to fill out Calculator so all the expressions
// below both compile and return "true"
class Calculator {
    
    func add(lhs: Int, rhs: Int) -> Int {
          return lhs + rhs
    }
    func subtract(lhs: Int, rhs: Int) -> Int {
          return lhs - rhs
    }
    func multiply(lhs: Int, rhs: Int) -> Int {
          return lhs * rhs
    }
    func divide(lhs: Int, rhs: Int) -> Int {
          return lhs / rhs
    }
    
    func add(_ args: [Int]) -> Int {
        var sum = 0
        for elem in args {
            sum += elem
        }
        return sum
    }
    func multiply(_ args: [Int]) -> Int {
        var res = 1
        for elem in args {
            res *= elem
        }
        return res
    }
    func count(_ args: [Int]) -> Int {
        var counter = 0
        for _ in args {
            counter += 1
        }
        return counter
    }
    func avg(_ args: [Int]) -> Int {
        var sum = 0
        for elem in args {
            sum += elem
        }
        return sum / args.count
    }
    func add(lhs: (a1: Int, a2: Int), rhs: (a1: Int, a2: Int)) -> (sum1: Int, sum2: Int) {
        return ((lhs.a1 + rhs.a1), (lhs.a2 + rhs.a2))
    }
    func subtract(lhs: (a1: Int, a2: Int), rhs: (a1: Int, a2: Int)) -> (sum1: Int, sum2: Int) {
        return ((lhs.a1 - rhs.a1), (lhs.a2 - rhs.a2))
    }
    func add(lhs: [String:Int], rhs: [String:Int]) -> [String:Int] {
        var res:[String:Int] = [:]
        for (key, value) in lhs {
            res[key] = value + rhs[key]!
        }
        return res
    }
    func subtract(lhs: [String:Int], rhs: [String:Int]) -> [String:Int] {
        var res:[String:Int] = [:]
        for (key, value) in lhs {
            res[key] = value - rhs[key]!
        }
        return res
    }
    func mathOp(lhs: Int, rhs: Int, op: (Int, Int) -> Int) -> Int {
       return op(lhs, rhs)
    }
    func mathOp(args: [Int], beg: Int, op: (Int, Int) -> Int) -> Int {
        var res = beg
        for elem in args {
            res = op(elem, res)
        }
        return res
    }
}

let calc = Calculator()  // Don't change this declaration name; it's used in all the tests below

// ====> Add your own tests here if you wish <====


// ====> Do not modify code in this section <====
calc.add(lhs: 2, rhs: 2) == 4
calc.subtract(lhs: 2, rhs: 2) == 0
calc.multiply(lhs: 2, rhs: 2) == 4
calc.divide(lhs: 2, rhs: 2) == 1

calc.mathOp(lhs: 5, rhs: 5, op: { (lhs: Int, rhs: Int) -> Int in (lhs + rhs) + (lhs * rhs) }) == 35
    // This style is one way of writing an anonymous function
calc.mathOp(lhs: 10, rhs: -5, op: { ($0 + $1) + ($0 - $1) }) == 20
    // This is the second, more terse, style; either works

calc.add([1, 2, 3, 4, 5]) == 15
calc.multiply([1, 2, 3, 4, 5]) == 120
calc.count([1, 2, 3, 4, 5, 6, 7, 8]) == 8
calc.count([]) == 0
calc.avg([2, 2, 2, 2, 2, 2]) == 2
calc.avg([1, 2, 3, 4, 5]) == 3
calc.avg([1]) == 1

calc.mathOp(args: [1, 2, 3], beg: 0, op: { $0 + $1 }) == 6
    // this is (((0 op 1) op 2) op 3)
calc.mathOp(args: [1, 2, 3, 4, 5], beg: 0, op: { $0 + $1 }) == 15
    // this is (((((0 op 1) op 2) op 3) op 4) op 5)
calc.mathOp(args: [1, 1, 1, 1, 1], beg: 1, op: { $0 * $1 }) == 1
    // this is (((((1 op 1) op 1) op 1) op 1) op 1)

let p1 = (5, 5)
let p2 = (12, -27)
let p3 = (-4, 4)
let p4 = (0, 0)
calc.add(lhs: p1, rhs: p2) == (17, -22)
calc.subtract(lhs: p1, rhs: p2) == (-7, 32)
calc.add(lhs: p4, rhs: p4) == (0, 0)
calc.add(lhs: p3, rhs: p4) == (-4, 4)

let pd1 = ["x": 5, "y": 5]
let pd2 = ["x": -4, "y": 4]
calc.add(lhs: pd1, rhs: pd2) == ["x": 1, "y": 9]
calc.subtract(lhs: pd1, rhs: pd2) == ["x": 9, "y": 1]
