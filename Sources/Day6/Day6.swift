import Foundation

public struct Day6 {
    let input: String
    let lines: [String]
    let splitLines: [[Character]]
    
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day6", withExtension: "txt")
        
        if let fileContents = try? String(contentsOf: fileURL!) {
            self.input = fileContents
            self.lines = input.components(separatedBy: "\n\n")
            self.splitLines = lines.map { Array($0) }
        } else {
            return nil
        }
    }
    
    public func printSolutionPart1() {
        var additionOfAll = 0
        
        for group in splitLines {
            var answerSet: Set<Character> = []
            for letter in group {
                if letter != "\n" {
                    answerSet.insert(letter)
                }
            }
            additionOfAll += answerSet.count
        }
        
        print("Part 1:", additionOfAll)
    }
    
    public func printSolutionPart2() {
        var additionOfAll = 0
        
        for group in splitLines {
            let current = group.split(separator: "\n").map{Array($0)} // Array of arrays of single character strings
            
            additionOfAll += current.reduce(Set(current.first!)) { (result, element)  in
                result.intersection(element)
            }.count
        }
        
        print("Part 2:", additionOfAll)
    }
    
}
