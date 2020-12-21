import XCTest

import AdventOfCodeTests

var tests = [XCTestCaseEntry]()
tests += AdventOfCodeTests.allTests()
tests += Day1Tests.allTests()
XCTMain(tests)
