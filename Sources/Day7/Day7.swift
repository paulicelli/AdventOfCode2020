import Foundation

public struct Day7 {
    let input: String
    let lines: [String]
    
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day7", withExtension: "txt")
        
        if let fileContents = try? String(contentsOf: fileURL!) {
            self.input = fileContents
            self.lines = input.components(separatedBy: "\n").dropLast()
            
            for line in lines {
                let components = line.components(separatedBy: " bags contain ")
                let container = components[0]
                print("add", container, "to list of all bags")
                
                let contained = components[1].components(separatedBy: ", ")
                for component in contained {
                    let component = component.trimmingCharacters(in: .punctuationCharacters).components(separatedBy: " bags")[0]
                    print(component)
                }
            }
            
        } else {
            return nil
        }
    }
    
    public func printSolutionPart1() {
        
    }
    
    public func printSolutionPart2() {

    }
    
}
