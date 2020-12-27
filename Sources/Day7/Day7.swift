import Foundation

public struct Day7 {
    
    let input: String
    let lines: [String]
    
    let root: Bag = Bag("root")
        
    public init?() {
        let fileURL = Bundle.module.url(forResource: "day7", withExtension: "txt")
        guard let fileContents = try? String(contentsOf: fileURL!) else {
            return nil
        }
        
        self.input = fileContents
        self.lines = input.components(separatedBy: "\n").dropLast()//.filter { !$0.contains("no other bags") }
        
        for line in lines {
            let components = line.components(separatedBy: " bags contain ")
            let containerBagColor = components[0]
            
            root.put(1, of: Bag(containerBagColor))
        }
        
        for line in lines {
            let components = line.components(separatedBy: " bags contain ")
            let containerBagName = components[0]
            guard let containerBag = root.find(inside: Bag(containerBagName)) else {
                fatalError("container not found")
            }
            
            let containedBagsLine = components[1].components(separatedBy: ", ")
                        
            for component in containedBagsLine {
                let component = component.trimmingCharacters(in: .punctuationCharacters).components(separatedBy: " bag")[0]
                if let number = Int(component.components(separatedBy: " ")[0]) {
                    let containedBagName = component
                        .components(separatedBy: " ")[1]
                        .appending(" ")
                        .appending(component.components(separatedBy: " ")[2])
                    guard let containedBag = root.find(inside: Bag(containedBagName)) else {
                        fatalError("contained not found")
                    }
                    containerBag.put(number, of: containedBag)
                    containedBag.put(in: containerBag)
                }
            }
        }
        // root.print()
    }
    
    public func printSolutionPart1() {
        let shinyGold = root.find(inside: Bag("shiny gold"))!
        
        print("Your Shiny Gold bag could be contained in other", shinyGold.containers.count, "bags.")
    }
    
    public func printSolutionPart2() {
        let shinyGold = root.find(inside: Bag("shiny gold"))!
        print("Your Shiny Gold bag could contain other", shinyGold.contained - 1, "bags.")
    }

}

class Bag {
    let color: String
    var inside: [(Int, Bag)] = []
    var outside: [Bag] = []
    
    lazy var containers: Set<Bag>  = {
        var set: Set<Bag> = []
        for bag in outside {
            if bag.color != "root" {
                set.insert(bag)
                set.formUnion(bag.containers)
            }
        }
        return set
    }()
    
    lazy var contained: Int = {
        var value = 1
        for (n, b) in inside {
            value += n * b.contained
        }
        return value
    }()
    
    init(_ color: String) {
        self.color = color
    }
    
    func put(_ number: Int, of bag: Bag) {
        inside.append((number, bag))
    }
    
    func put(in bag: Bag) {
        outside.append(bag)
    }
    
    func find(inside bag: Bag) -> Bag? {
        if bag == self {
            return self
        }
        for (_, bagbag) in inside {
            if bag == bagbag {
                return bagbag
            }
        }
        return nil
    }
    
    func print(_ tabs: Int = 1) {
        Swift.print(color)
        if !inside.isEmpty {
            for (n, b) in inside {
                for _ in 0..<tabs {
                    Swift.print("\t", terminator: "|")
                }
                Swift.print("\0  ", n, "- ", terminator: "")
                b.print(tabs + 1)
            }
        }
    }
}

extension Bag: Equatable {
    static func == (lhs: Bag, rhs: Bag) -> Bool {
        lhs.color == rhs.color
    }
}

extension Bag: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(color)
    }
}

extension Bag: CustomStringConvertible {
    var description: String {
        return color
    }
}
