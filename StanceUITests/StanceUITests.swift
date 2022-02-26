//
//  StanceUITests.swift
//  StanceUITests
//
//  Created by Sukumar Anup Sukumaran on 18/02/2022.
//

import XCTest

class StanceUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSessionProcess() throws {
        let app = XCUIApplication()
        
        let signInBtn = app.buttons["Sign In"]
        
        
        if signInBtn.exists {
            
            let emailTXF = app.textFields["your@email.com"]
            emailTXF.tap()
            emailTXF.clearAndEnterText(text:"test@email.com")
            
            let passTXF = app.textFields["xxxxxxxxx"]
            passTXF.tap()
            passTXF.clearAndEnterText(text:"password")
            
            XCTAssertTrue(signInBtn.exists)
            signInBtn.tap()
            let homeNav = app.navigationBars["Stance"]
            expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: homeNav, handler: nil)
            waitForExpectations(timeout: 15, handler: nil)
            homeNav.children(matching: .button).element(boundBy: 0).tap()
            app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        } else {
            
            let homeNav = app.navigationBars["Stance"]
            expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: homeNav, handler: nil)
            waitForExpectations(timeout: 10, handler: nil)
            homeNav.children(matching: .button).element(boundBy: 0).tap()
            app.tables/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: signInBtn, handler: nil)
            waitForExpectations(timeout: 4, handler: nil)
            XCTAssertTrue(signInBtn.exists)
        
            
        }
        
                
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        self.tap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)

        self.typeText(deleteString)
        self.typeText(text)
    }
}
