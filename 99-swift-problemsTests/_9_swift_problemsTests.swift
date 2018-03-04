import XCTest
@testable import _9_swift_problems

extension List {
    var last: T? {
        var list = self
        while (list.nextItem?.value != nil) {
            list = (list.nextItem)!
        }
        return list.value
    }

    var pennultimate: T? {
        var list = self
        var value = self.value

        while (list.nextItem?.value != nil) {
            value = list.value
            list = list.nextItem!
        }
        return value
    }

    var length: Int {
        var i = 0;
        var list = self;
        while (list.nextItem?.value != nil) {
            list = list.nextItem!
            i += 1
        }
        return i + 1
    }

    subscript(index: Int) -> T? {
        get {
            var list = self
            var i = 0;
            while (i < (index - 1)) {
                list = list.nextItem!
                i += 1
            }
            return list.value
        }
    }

    func reverse() -> List<T> {
        var i = self.length
        var values:Array<T> = []

        while (i > 0){
            values.append(self[i]!)
            i = i - 1
        }
        return List(values)!
    }
}

extension List where T:Equatable {
    func isPalindrome() -> Bool {
        let length = self.length
        if (length == 1) { return true}
        if ((length - 1) % 2 != 0) { return false }
        var forwards: Array<T> = []
        var backwards: Array<T> = []
        var i = 1
        while (i < (length / 2) + 1) {
            forwards.append(self[i]!)
            i = i + 1
        }
        var j = length / 2 + 2
        while (j < length + 1) {
            backwards.append(self[j]!)
            j = j + 1
        }
        return areEqual(List(forwards)!, List(backwards)!.reverse())
    }
}

func areEqual<T>(_ listA:List<T>, _ listB: List<T>) -> Bool where T: Equatable {
    if (listA.length != listB.length){ return false }
    var isEqual = true;
    var i = 0
    while (i < listA.length){
        isEqual = isEqual && (listA[i] == listB[i])
        i = i + 1
    }
    return isEqual
}

class _9_swift_problemsTests: XCTestCase {
    
    func test_p01_last_item() {
        let last = List(1,2,3,4,5,6,7,8)?.last
        XCTAssertEqual(last, 8)
    }

    func test_p02_pennultimate_item() {
        let anwser = List(1,2,3,4,5,6,7,8)?.pennultimate
        XCTAssertEqual(anwser, 7)
    }

    func test_p03_kth_item() {
        let anwser = List(1,2,3,4,5,6,7,8)![2]!
        XCTAssertEqual(anwser, 2)
    }

    func test_p04_length() {
        let anwser = List(1, 1, 2, 3, 5, 8)!.length
        XCTAssertEqual(anwser, 6)
    }

    func test_p05_reverse() {
        let actual = List(1, 2, 3, 4, 5, 6)?.reverse()
        XCTAssertTrue(areEqual(actual!, List(6, 5, 4, 3, 2, 1)!))
    }

    func test_p06_is_palindrone() {
        XCTAssertTrue(List(1)!.isPalindrome())
        XCTAssertFalse(List(1, 2)!.isPalindrome())
        XCTAssertTrue(List(1, 2, 1)!.isPalindrome())
        XCTAssertTrue(List(1, 2, 3, 2, 1)!.isPalindrome())
    }
}
