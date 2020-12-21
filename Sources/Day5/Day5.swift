import Foundation

public struct Day5 {
    let input: String
    let lines: [String]
    let splitLines: [[Character]]
    
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day5", withExtension: "txt")
        
        if let fileContents = try? String(contentsOf: fileURL!) {
            self.input = fileContents
            self.lines = input.components(separatedBy: "\n").dropLast()
            self.splitLines = lines.map { Array($0) }
        } else {
            return nil
        }
    }
    
    public func printSolutionPart1() {
        var highestseatNumber = 0
        
        for line in splitLines {
            var lowerF = 0
            var upperB = 127
            var lowerL = 0
            var upperR = 7
            
            for (pos, char) in line.enumerated() {
                switch char {
                case "F":
                    upperB = upperB - pow(2, 7 - (pos+1))
                case "B":
                    lowerF = lowerF + pow(2, 7 - (pos+1))
                case "L":
                    upperR = upperR - pow(2, 10 - (pos+1))
                case "R":
                    lowerL = lowerL + pow(2, 10 - (pos+1))
                default:
                    print("EEEEH?!?")
                }
            }
            
            let seatNumber = lowerF * 8 + lowerL
            
            highestseatNumber = (seatNumber < highestseatNumber) ? highestseatNumber : seatNumber
        }
        
        print("Highest seat number found:", highestseatNumber)
    }
    
    public func printSolutionPart2() {
        var highestseatNumber = 0
        var lowestseatNumber = 1000
        
        var seats: [Int] = []
        
        for line in splitLines {
            var lowerF = 0
            var upperB = 127
            var lowerL = 0
            var upperR = 7
            
            for (pos, char) in line.enumerated() {
                switch char {
                case "F":
                    upperB = upperB - pow(2, 7 - (pos+1))
                case "B":
                    lowerF = lowerF + pow(2, 7 - (pos+1))
                case "L":
                    upperR = upperR - pow(2, 10 - (pos+1))
                case "R":
                    lowerL = lowerL + pow(2, 10 - (pos+1))
                default:
                    print("EEEEH?!?")
                }
            }
            
            let seatNumber = lowerF * 8 + lowerL
            
            highestseatNumber = (seatNumber < highestseatNumber) ? highestseatNumber : seatNumber
            lowestseatNumber = (seatNumber > lowestseatNumber) ? lowestseatNumber : seatNumber
            
            seats.append(seatNumber)
        }
        
        for seat in seats {
            if !seats.contains(seat+1) {
                print("Your seat:", seat+1)
                break
            }
        }
    }
    
    func pow(_ a: Int, _ b: Int) -> Int {
        guard a != 0 else { return 0 }
        guard b > 0 else { return 1 }
        
        return a * pow(a, b - 1)
    }
}
