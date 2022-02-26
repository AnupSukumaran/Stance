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
    var sut1: ContainerViewModel!
    var sut2: LeftMenuViewModel!
    var sut3: RepCounterViewModel!
  

    override func setUpWithError() throws {
        sut = SignInViewModel()
        sut1 = ContainerViewModel()
        sut2 = LeftMenuViewModel()
        sut3 = RepCounterViewModel(secs: 5)
    }

    override func tearDownWithError() throws {
        sut = nil
        sut1 = nil
        sut2 = nil
        sut3 = nil
    }

    func testCheckSuccess() throws {
        let inSession = sut.checkSuccess(email: .tempEmail, password: .tempPass)
        XCTAssertEqual(inSession, true)
    }

    func testSetTestSession() throws {
        UserDefaults.standard.removeObject(forKey: .userEmail)
        UserDefaults.standard.removeObject(forKey: .password)
        sut1.setTestSession()
        guard let email = UserDefaults.standard.value(forKey: .userEmail) as? String,
              let pass = UserDefaults.standard.value(forKey: .password) as? String else {
                  XCTFail("NO CREDS FOUND!!")
                  return
              }
        
        XCTAssertEqual(email, .tempEmail)
        XCTAssertEqual(pass, .tempPass)
    }
    
    func testClearSession() throws {
        sut2.clearSession()
        let ss = UserDefaults.standard.value(forKey: .sessionKey) == nil
        XCTAssertTrue(ss)
    }
    
    func testGivingValuesToTimerLabel() throws {
        let str = sut3.givingValuesToTimerLabel()
        XCTAssertEqual(str, "1")
        XCTAssertEqual(sut3.point, 0.2)
    }
    
    func testQuestTimerl() throws {
        sut3.questTimer(isPaused: false)
        
        XCTAssertTrue(sut3.questTimer.isValid)
        
        let expectation = self.expectation(description: "Scaling")
        
        sut3.timerHandler = { ss in
            if ss == "5" {
                expectation.fulfill()
            }
        }
        

        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertEqual(sut3.count, 5)
        
        sut3.questTimer(isPaused: true)

        XCTAssertFalse(sut3.questTimer.isValid)
        
    }
    
    func testResetMetrics() throws {
        let str = sut3.resetMetrics()
        XCTAssertEqual(str, "0")
    }
  

}
