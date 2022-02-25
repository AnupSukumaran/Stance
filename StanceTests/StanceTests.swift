//
//  StanceTests.swift
//  StanceTests
//
//  Created by Sukumar Anup Sukumaran on 18/02/2022.
//

import XCTest
@testable import Stance

class StanceTests: XCTestCase {
    
    var sut: SignInViewModel!

    override func setUpWithError() throws {
        sut = SignInViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCheckSuccess() throws {
        let inSession = sut.checkSuccess(email: .tempEmail, password: .tempPass)
        XCTAssertEqual(inSession, true)
    }


}
