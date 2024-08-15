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




//2 -



//Question: Implement a function that takes an array of integers and returns the product of all the elements in the array. Use the reduce function.
//
//Follow-up: Modify the function to return the sum of squares of all the elements using reduce.


func calculate(inputArray: [Int]) -> Int {
    
    inputArray.reduce(1) { partialResult, nextNumber in
        return partialResult * nextNumber
    }
}

let array5 = [2,4,1,3]
let result5 = calculate(inputArray: array5)
print(result5)

func calculateNew(inputArray: [Int]) -> Int {
    
    inputArray.reduce(0) { partialResult, nextNumber in
        return partialResult + (nextNumber * nextNumber)
    }
}

let result6 = calculateNew(inputArray: array5)
print(result6)


//3
//Question: Given an array of strings, sort the array in descending order based on the length of each string using the sorted function.
//
//Follow-up: Write a function that returns the strings sorted first by length (ascending) and then alphabetically (for strings of the same length) using the sorted function with a custom comparator.


let strArray = ["Kishan", "Rahib", "Gautam", "Shalabh", "Ravindra"]


let result7 = strArray.sorted { first, second in
    return first.count < second.count
}

print(result7)
print(strArray.sorted(by: >))

//Sorted by length
let result8 = strArray.sorted(using: [
    KeyPathComparator(\.count, order: .forward)
])
print(result8)

let result9 = strArray.sorted(using: [
    KeyPathComparator(\.count, order: .forward)
]).sorted(by: <)
print(result9)

let result10 = strArray.sorted { first, second in
    return first.count < second.count
}.sorted(by: <)


print(result10)






//TODO: -


//4. Combining Higher-Order Functions
//
//Question: Write a function that takes an array of integers, filters out the even numbers, doubles the remaining numbers, and then returns their sum. Use a combination of filter, map, and reduce.
//
//5. FlatMap
//
//Question: Given an array of arrays of integers, flatten the array and return a single array containing all the integers in ascending order. Use flatMap and sorted to achieve this.
//
//6. CompactMap
//
//Question: Write a function that takes an array of optional integers and returns an array of non-nil integers, incremented by 1. Use compactMap.
//
//7. Group By
//
//Question: Implement a function that takes an array of strings and groups them by their first character. The result should be a dictionary where the keys are characters and the values are arrays of strings that start with that character. Use reduce or Dictionary(grouping:by:).
//
//8. Chaining Multiple Functions
//
//Question: Write a function that takes an array of integers, removes duplicates, filters out numbers less than a given threshold, squares the remaining numbers, and returns them sorted in descending order. Use a combination of Set, filter, map, and sorted.
//
//9. Partial Application
//
//Question: Implement a function that adds a given number to each element of an array. Write it using partial application and a higher-order function like map.
//
//10. Custom Reduce
//
//Question: Write a custom version of reduce that takes an array, an initial value, and a combining closure, and returns the accumulated result.
//
//These questions will help assess the candidate’s understanding and ability to work with higher-order functions in Swift.
