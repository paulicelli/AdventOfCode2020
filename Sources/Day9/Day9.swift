import Foundation

public struct Day9 {
    
    let input: String
    let lines: [String]
    
    let numbers: [Int]
        
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day9", withExtension: "txt")
        guard let fileContents = try? String(contentsOf: fileURL!) else {
            return nil
        }
        
        self.input = fileContents
        self.lines = input.components(separatedBy: "\n").dropLast()
        
        var numbersList: [Int] = []
        for line in lines {
            if let number = Int(line) {
                numbersList.append(number)
            }
        }
        self.numbers = numbersList
    }
    
    public func printSolutionPart1() {
        if let number = verifySequence(preamble: 25) {
            print("The first number not valid is:", number)
        } else {
            print("Looks like all numbers are valid")
        }
    }
    
    public func printSolutionPart2() {
        let solutionPart1 = 1212510616
        
        // find the range of weakness
        var first = 0
        var last = 0
        var index = 0
        var notFoundYet = true
        while notFoundYet && index < numbers.count {
            var sumIndex = index
            var sum = numbers[sumIndex]
            while sum < solutionPart1 {
                sumIndex += 1
                sum += numbers[sumIndex]
                if sum == solutionPart1 {
                    first = index
                    last = sumIndex
                    notFoundYet = false
                }
            }
            index += 1
        }
        
        // find smallest and largest numbers in range
        var weaknessrange: [Int] = []
        for i in first...last {
            weaknessrange.append(numbers[i])
        }
        
        var smallest = Int.max
        var largest = 0
        for number in weaknessrange {
            if number<smallest {
                smallest = number
            }
            if number>largest {
                largest = number
            }
        }
        
        print("The encryption weakness is:", smallest + largest)
    }
    
    func verifySequence(preamble: Int) -> Int? {
        for i in preamble..<numbers.count { // da 25 a 999
            var valid = false
            for j in (i - preamble)..<i-1 { // da 0 a 24
                for k in (j+1)..<i { // da 1 a 25
                    if numbers[j] + numbers[k] == numbers[i] {
                        valid = true
                        // print(numbers[j], "+", numbers[k], "=", numbers[i])
                    }
                }
            }
            if !valid {
                return numbers[i]
            }
        }
        return nil
    }
}
