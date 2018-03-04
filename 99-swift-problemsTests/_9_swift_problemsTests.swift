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
}

class _9_swift_problemsTests: XCTestCase {

    
    func testExample() {
        let last = List(1,2,3,4,5,6,7,8)?.last
        XCTAssertEqual(last, 8)
    }

}
