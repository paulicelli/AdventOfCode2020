import Foundation

public struct Day1 {
    let input: String
    let yearsList: [Int]
    
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day1", withExtension: "txt")
        
        if let fileContents = try? String(contentsOf: fileURL!) {
            self.input = fileContents
            self.yearsList = self.input.components(separatedBy: "\n").dropLast().map {Int($0)!}  // come on, they are integers
        } else {
            return nil
        }
    }
    
    public func printSolutionPart1() {
        let lessThan1010 = yearsList.filter {$0 < 1010}
        let moreThan1010 = yearsList.filter {$0 >= 1010}
        
        for number in lessThan1010 {
            for numberAdded in moreThan1010 {
                if number + numberAdded == 2020 {
                    print(number, "+", numberAdded, "= 2020 and multiplied are", number*numberAdded)
                }
            }
        }
    }
    
    public func printSolutionPart2() {
        let lessThan1010 = yearsList.filter {$0 < 1010}
        
        Loop: for number in lessThan1010 {
            for first in lessThan1010 {
                for second in lessThan1010 {
                    if number + first + second == 2020 {
                        print(number, "+", first, "+", second, "= 2020 and multiplied are", number*first*second)
                        break Loop
                    }
                }
            }
        }
    }
    
}
