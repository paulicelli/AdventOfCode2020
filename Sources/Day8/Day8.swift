import Foundation

public struct Day8 {
    
    let input: String
    let lines: [String]

    var commands: [Cmd] = []
        
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day8", withExtension: "txt")
        guard let fileContents = try? String(contentsOf: fileURL!) else {
            return nil
        }
        
        self.input = fileContents
        self.lines = input.components(separatedBy: "\n").dropLast()
        
        for line in lines {
            let components = line.components(separatedBy: " ")
            commands.append(Cmd(components[0], Int(components[1])!)!)
        }
    }
    
    public func printSolutionPart1() {
        var accumulator = 0
        var infiniteLoop = false
        var programCounter = 0
        var usedLines: [Int] = []
        
        while !infiniteLoop {
            if !usedLines.contains(programCounter) {
                usedLines.append(programCounter)
            } else {
                infiniteLoop = true
                break
            }
            
            switch commands[programCounter] {
            case .nop:
                programCounter += 1
                continue
            case .acc(let number):
                programCounter += 1
                accumulator += number
                continue
            case .jmp(let number):
                programCounter += number
                continue
            }
        }
        
        print("Value of accumulator before entering an infinite loop:", accumulator)
    }
    
    public func printSolutionPart2() {
        for i in 0..<commands.count {
            //do the while loop but modifing one instruction
            var debugCommandsList = commands
            switch debugCommandsList[i] {
            case .nop(let number):
                debugCommandsList[i] = .jmp(number)
            case .acc(let number):
                debugCommandsList[i] = .acc(number)
            case .jmp(let number):
                debugCommandsList[i] = .nop(number)
            }
            
            var accumulator = 0
            var infiniteLoop = false
            var programCounter = 0
            var usedLines: [Int] = []
            
            while !infiniteLoop {
                guard programCounter <= commands.count-1 else {
                    print("Value of accumulator ending gracefully:", accumulator, "command on line", i, "was changed in:", debugCommandsList[i])
                    return
                }
                
                if !usedLines.contains(programCounter) {
                    usedLines.append(programCounter)
                } else {
                    infiniteLoop = true
                    break
                }
                
                switch debugCommandsList[programCounter] {
                case .nop:
                    programCounter += 1
                    continue
                case .acc(let number):
                    programCounter += 1
                    accumulator += number
                    continue
                case .jmp(let number):
                    programCounter += number
                    continue
                }
            }
            
            // print("Value of accumulator before entering an infinite loop:", accumulator)
        }
    }
}

enum Cmd {
    case nop(Int), acc(Int), jmp(Int)
    
    init?(_ word: String, _ number: Int) {
        switch word {
        case "nop":
            self = .nop(number)
        case "acc":
            self = .acc(number)
        case "jmp":
            self = .jmp(number)
        default:
            return nil
        }
    }
}
