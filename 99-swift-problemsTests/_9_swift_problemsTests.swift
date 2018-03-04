//
//  _9_swift_problemsTests.swift
//  99-swift-problemsTests
//
//  Created by Will Munn on 04/03/2018.
//  Copyright © 2018 novation. All rights reserved.
//

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


class _9_swift_problemsTests: XCTestCase {

    func areEqual(_ listA:List<Int>, _ listB: List<Int>) -> Bool {
        if (listA.length != listB.length){ return false }
        var isEqual = true;
        var i = 0
        while (i < listA.length){
            isEqual = isEqual && (listA[i] == listB[i])
            i = i + 1
        }
        return isEqual
    }
    
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
}
