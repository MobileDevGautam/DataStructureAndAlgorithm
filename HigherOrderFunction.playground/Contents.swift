import UIKit

//QUESTION -- 1

//Write a function that takes an array of integers and returns an array of strings representing the numbers in words (e.g., [1, 2, 3] -> ["one", "two", "three"]). Use the map function to achieve this.


let array = [1, 2, 3, 2.1]

let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .spellOut

let result = array.map { value in
    let optionConversion = numberFormatter.string(from: value as NSNumber)
    if let unwrapped = optionConversion {
        return unwrapped
    }
    
    return ""
}.filter { value -> Bool in
    return value != ""
}
print(result)


struct Test { }
//2
let array1 = [1, 2, 3, "A", Test()] as [Any]

let result1 = array1.map { value in
    if value is Int {
        let unwrapped = numberFormatter.string(from: value as! NSNumber)
        return unwrapped
    } else if value is String {
        let number = Int(value as! String)
        if let unwrapped = number {
            let optionConversion = numberFormatter.string(from: unwrapped as NSNumber)
            return optionConversion
        }
    }
    return ""
}
.compactMap { number in
    if let num = number {
        return num
    }
    return nil
}
.filter { value -> Bool in
    return value != ""
}
print(result1)


let array2 = [1, 2, 3.1, 3, "1", "Abc", Test()] as [Any]

let result2 = array2.compactMap { number in
    if number is Int {
        return numberFormatter.string(from: NSNumber(integerLiteral: number as! Int))
    } else if number is Double {
        return numberFormatter.string(from: NSNumber(floatLiteral: number as! Double))
    } else if number is String, let intVal = Int(String(describing: number)) {
        return numberFormatter.string(from: NSNumber(integerLiteral: intVal))
    } else if number is String, let doubleVal = Double(String(describing: number)) {
        return numberFormatter.string(from: NSNumber(floatLiteral: doubleVal))
    } else {
        return nil
    }
}
print(result2)




let array3 = [1, 2, 3.1, 5, "1", "Abc", Test()] as [Any]
func convert(_ array: [Any], target: Int) -> [String] {
    return array.compactMap { number in
        if number is Int {
            return numberFormatter.string(from: NSNumber(integerLiteral: number as! Int))
        } else if number is Double {
            return numberFormatter.string(from: NSNumber(floatLiteral: number as! Double))
        } else if number is String, let intVal = Int(String(describing: number)) {
            return numberFormatter.string(from: NSNumber(integerLiteral: intVal))
        } else if number is String, let doubleVal = Double(String(describing: number)) {
            return numberFormatter.string(from: NSNumber(floatLiteral: doubleVal))
        } else {
            return nil
        }
    }
}

let result3 = convert(array3, target: 3)
print(result3)




let array4 = [1, 2, 3.1, 5, "1", "Abc", Test()] as [Any]
func convertWithTarget(_ array: [Any], target: Int) -> [String] {
    return array4.compactMap { number in
        if number is Int {
            if NSNumber(integerLiteral: number as! Int).intValue > target {
                return nil
            }
            return numberFormatter.string(from: NSNumber(integerLiteral: number as! Int))
        } else {
            return nil
        }
    }
}

let result4 = convertWithTarget(array4, target: 3)
print(result4)
