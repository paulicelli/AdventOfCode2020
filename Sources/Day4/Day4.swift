import Foundation

public struct Day4 {
    let input: String
    let lines: [String]
    
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day4", withExtension: "txt")
        
        if let fileContents = try? String(contentsOf: fileURL!) {
            self.input = fileContents
            self.lines = Array(input.components(separatedBy: "\n\n"))
        } else {
            return nil
        }
    }
    
    public func printSolutionPart1() {
        var validPassports = 0
        
        for line in lines {
            // separate line in components to be analyzed
            let data = line.components(separatedBy: CharacterSet(["\n", " "]))
            
            var fieldsOK = 0
            
            for component in data {
                if component.hasPrefix("byr:") ||
                    component.hasPrefix("iyr:") ||
                    component.hasPrefix("eyr:") ||
                    component.hasPrefix("hgt:") ||
                    component.hasPrefix("hcl:") ||
                    component.hasPrefix("ecl:") ||
                    component.hasPrefix("pid:") {
                    fieldsOK += 1
                }
            }
            
            if fieldsOK == 7 {
                // part 1 only needs 7 fields present
                validPassports += 1
            }
        }
        print("Valid passports are:", validPassports)
    }
    
    public func printSolutionPart2() {
        var validPassports = 0
        
        for line in lines {
            // separate line in components to be analyzed
            let data = line.components(separatedBy: CharacterSet(["\n", " "]))
            
            var fieldsOK = 0
            
            for component in data {
                if component.hasPrefix("byr:") ||
                    component.hasPrefix("iyr:") ||
                    component.hasPrefix("eyr:") ||
                    component.hasPrefix("hgt:") ||
                    component.hasPrefix("hcl:") ||
                    component.hasPrefix("ecl:") ||
                    component.hasPrefix("pid:") {
                    fieldsOK += 1
                }
            }
            
            if fieldsOK == 7 {
                
                // part 2
                var byr = false
                var iyr = false
                var eyr = false
                var hgt = false
                var hcl = false
                var ecl = false
                var pid = false
                
                for component in data {
                    
                    // byr
                    if component.hasPrefix("byr:") {
                        if let range = component.range(of: #"(?<=byr:)[0-9]*"#,
                                                 options: .regularExpression),
                           let year = Int(component[range]) {
                            if year >= 1920 && year <= 2002 {
                                byr = true
                            }
                        }
                    }
                    
                    // iyr
                    if component.hasPrefix("iyr:") {
                        if let range = component.range(of: #"(?<=iyr:)[0-9]*"#,
                                                 options: .regularExpression),
                           let year = Int(component[range]) {
                            if year >= 2010 && year <= 2020 {
                                iyr = true
                            }
                        }
                    }
                    
                    // eyr
                    if component.hasPrefix("eyr:") {
                        if let range = component.range(of: #"(?<=eyr:)[0-9]*"#,
                                                 options: .regularExpression),
                           let year = Int(component[range]) {
                            if year >= 2020 && year <= 2030 {
                                eyr = true
                            }
                        }
                    }
                    
                    // hgt
                    if component.hasPrefix("hgt:") {
                        if let range = component.range(of: #"[0-9]*(?=cm)"#,
                                                 options: .regularExpression),
                           let height = Int(component[range]) {
                            if height >= 150 && height <= 193 {
                                hgt = true
                            }
                        }
                        if let range = component.range(of: #"[0-9]*(?=in)"#,
                                                 options: .regularExpression),
                           let height = Int(component[range]) {
                            if height >= 59 && height <= 76 {
                                hgt = true
                            }
                        }
                    }
                    
                    // hcl
                    if component.hasPrefix("hcl:") {
                        if let range = component.range(of: #"(?<=#)[0-9a-f]*"#,
                                                 options: .regularExpression) {
                            let color = component[range].count
                            if color == 6 {
                                hcl = true
                            }
                        }
                    }
                    
                    // ecl
                    if component.hasPrefix("ecl:") {
                        if let range = component.range(of: #"(?<=ecl:)[a-z]*"#,
                                                 options: .regularExpression) {
                            switch component[range] {
                            case "amb":
                                ecl = true
                            case "blu":
                                ecl = true
                            case "brn":
                                ecl = true
                            case "gry":
                                ecl = true
                            case "grn":
                                ecl = true
                            case "hzl":
                                ecl = true
                            case "oth":
                                ecl = true
                            default:
                                ecl = false
                            }
                        }
                    }
                    
                    // pid
                    if component.hasPrefix("pid:") {
                        if let range = component.range(of: #"(?<=pid:)[0-9]*"#,
                                                 options: .regularExpression) {
                            let pidNumber = component[range].count
                            if pidNumber == 9 {
                                pid = true
                            }
                        }
                    }
                }
                
                if byr && iyr && eyr && hgt && hcl && ecl && pid {
                    validPassports += 1
                }
            }
        }
        print("Valid passports are:", validPassports)
    }
}
