import Foundation

public struct Day2 {
    let input: String
    let lines: [String]
    
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day2", withExtension: "txt")
        
        if let fileContents = try? String(contentsOf: fileURL!) {
            self.input = fileContents
            self.lines = input.components(separatedBy: "\n").dropLast()
        } else {
            return nil
        }
    }
    
    public func printSolutionPart1() {
        print(self.lines)
    }
    
    public func printSolutionPart2() {

    }
    
}
