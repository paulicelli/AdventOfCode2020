import Foundation

public struct Day3 {
    let input: String
    let lines: [String]
    
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day3", withExtension: "txt")
        
        if let fileContents = try? String(contentsOf: fileURL!) {
            self.input = fileContents
            self.lines = input.components(separatedBy: "\n").dropLast()
        } else {
            return nil
        }
    }
    
    public func printSolutionPart1() {
        let numberOfTrees = treesOnSlope(slope: lines, x: 5, y: 1)
        print("Total number of trees passed:", numberOfTrees)
    }
    
    public func printSolutionPart2() {
        var numberOfTrees = treesOnSlope(slope: lines, x: 1, y: 1)
        numberOfTrees *= treesOnSlope(slope: lines, x: 3, y: 1)
        numberOfTrees *= treesOnSlope(slope: lines, x: 5, y: 1)
        numberOfTrees *= treesOnSlope(slope: lines, x: 7, y: 1)
        numberOfTrees *= treesOnSlope(slope: lines, x: 1, y: 2)
        print("Total result of multiplication for all inputs:", numberOfTrees)
    }
    
    func treesOnSlope(slope: [String], x: Int, y: Int) -> Int {
        
        // define a cursor position, only x axis is relevant
        var cursor = 0
        
        var numberOfTrees = 0
        
        for (index, line) in slope.enumerated() {
            
            if index % y == 0 { // consider y in slope
                // use every string line as array of chars
                let characters = [Character](line)
                
                // check
                if characters[cursor] == "#" {
                    numberOfTrees += 1
                    // print("Found tree at position:", cursor, "of line", index, line)
                }
                
                // then move cursor forward
                cursor += x
                if cursor > 30 {
                    cursor = cursor - 31
                }
            }
        }
        
        return numberOfTrees
    }
    
}
