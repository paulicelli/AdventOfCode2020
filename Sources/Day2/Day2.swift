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
        var validPasswords = 0
        
        // cycle through all lines
        for line in self.lines {
            
            // use regex to split every line in components
            if let atLeast = line.range(of: #"[0-9]*(?=-)"#,
                                          options: .regularExpression),
               let atLast = line.range(of: #"(?<=-)[0-9]*"#,
                                       options: .regularExpression),
               let char = line.range(of: #"[a-z](?=:)"#,
                                     options: .regularExpression),
               let password = line.range(of: #"(?<=: )[a-z]*"#,
            options: .regularExpression) {
                
                // if a char is present, the password is split by the char in n parts - 1
                let timesOccurred = line[password].components(separatedBy: line[char]).count - 1
                if timesOccurred >= Int(line[atLeast])! && timesOccurred <= Int(line[atLast])! {
                    validPasswords += 1
                }
                
            }
        }
        
        print("Found", validPasswords, "valid passwords")
    }
    
    public func printSolutionPart2() {
        var validPasswords = 0
        
        // cycle through all lines
        for line in lines {
            
            // use regex to split every line in components
            if let position1 = line.range(of: #"[0-9]*(?=-)"#,
                                          options: .regularExpression),
               let position2 = line.range(of: #"(?<=-)[0-9]*"#,
                                       options: .regularExpression),
               let char = line.range(of: #"[a-z](?=:)"#,
                                     options: .regularExpression),
               let password = line.range(of: #"(?<=: )[a-z]*"#,
            options: .regularExpression) {
                
                let passwordChars = Array(line[password])
                let position1inPswd = Int(line[position1])! - 1 // as said in riddle, positions start at 1, not 0
                let position2inPswd = Int(line[position2])! - 1
                let char2Find = [Character](line[char])[0] // Substring converted in Character
                                
                // if a char is present at only one position, password is valid
                if (
                    (passwordChars[position1inPswd] == char2Find) ||
                    (passwordChars[position2inPswd] == char2Find)
                ) && !(
                    (passwordChars[position1inPswd] == char2Find) &&
                    (passwordChars[position2inPswd] == char2Find)
                ) {
                    validPasswords += 1
                }
            }
        }
        
        print("Found", validPasswords, "valid passwords")
    }
    
}
