import UIKit

// Question 2
// Setup my int array
let intArray = [1, 2, 3, 5, 10, 15, 20, 30, 40, 50, 60, 80, 100, 1000, 1001]

func rank (array : [Int], target: Int) -> Int {
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        // Check if target is the mid
        if array[mid] == target {
            return mid
        }
        // If target is greater than mid, ignore the left
        else if array[mid] < target {
            left = mid + 1
        }
        // If target is less than mid, ignore the right
        else {
            right = mid - 1
        }
    }
    // If we reach this, target was not present
    return -1
}

var result = rank(array: intArray, target: 2) // should return 1
print(result)

result = rank(array: intArray, target: 10) // should return 4
print(result)

result = rank(array: intArray, target: 100) // should return 12
print(result)

result = rank(array: intArray, target: 17) // should return -1
print(result)



// Qestion 3

class Fraction {
    var numerator: Int = 0
    var denominator: Int = 1
    
    init(_ numerator: Int, _ denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    init() {}
    
    func setTo(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    func print() {
        Swift.print("\(numerator)/\(denominator)")
    }
    
    func toDouble() -> Double {
        return Double(numerator) / Double(denominator);
    }
    
    func add(_ f: Fraction) {
        numerator = numerator * f.denominator + denominator * f.numerator
        denominator = denominator * f.denominator
        reduce()
    }
    
    func subtract(_ f: Fraction) {
        numerator = numerator * f.denominator - denominator * f.numerator
        denominator = denominator * f.denominator
        reduce()
    }
    
    func multiply(_ f: Fraction) {
        numerator = numerator * f.numerator
        denominator = denominator * f.denominator
        reduce()
    }
    
    func divide(_ f: Fraction) {
        numerator = numerator * f.denominator
        denominator = denominator * f.numerator
        reduce()
    }
    
    func reduce () {
        var u = abs(numerator)
        var v = denominator
        var r: Int
        while (v != 0) {
            r = u % v; u = v; v = r
        }
        numerator /= u
        denominator /= u
    }
    
}

var f1 = Fraction(1, 2) // >>> 1/2
var f2 = Fraction(1, 4) // >>> 1/4

f1.add(f2)// results in 3/4, already reduced
f1.print()

var f3 = Fraction(4, 6) // >>> 4/6
var f4 = Fraction(1, 6) // >>> 1/6
f3.subtract(f4)// results in 3/6 then reduces to 1/2
f3.print()

var f5 = Fraction(5, 8) // >>> 5/8
var f6 = Fraction(1, 2) // >>> 1/2
f5.multiply(f6)// results in 5/16
f5.print()

var f7 = Fraction(6, 32) // >>> 6/32
var f8 = Fraction(2, 5) // >>> 2/5
f7.divide(f8)// results in 30/64 then reduces to 15/32
f7.print()
