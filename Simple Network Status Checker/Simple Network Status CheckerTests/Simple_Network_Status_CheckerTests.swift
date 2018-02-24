//
//  Simple_Network_Status_CheckerTests.swift
//  Simple Network Status CheckerTests
//
//  Created by Mark Filter on 2/23/18.
//  Copyright © 2018 Mark Filter. All rights reserved.
//

import XCTest
@testable import Simple_Network_Status_Checker

class Simple_Network_Status_CheckerTests: XCTestCase {
    
    var expectationValidConnectionToGoogle : XCTestExpectation!
    var expectationInvalidConnectionToGoogle : XCTestExpectation!
    var expectationInsecureConnectionToGoogle : XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        expectationValidConnectionToGoogle = XCTestExpectation.init(description: "Connection to Google's server was a success.")
        expectationInvalidConnectionToGoogle = XCTestExpectation.init(description: "Connection to Google's server was unsuccessful as expected.")
        expectationInsecureConnectionToGoogle = XCTestExpectation.init(description: "Connection to Google's server was unsuccessful as expected.")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }
    
    func testValidConnectionToGoogleShouldPass() {
        // Tests passing of valid URL address
        NetworkUtils.checkConnection(viewController: UIViewController.init(), urlString: "https://google.com/") { (alertController, hasConnection) -> (Void) in
            if hasConnection {
                XCTAssertTrue(hasConnection, "Connection to Google.com was successful")
                self.expectationValidConnectionToGoogle.fulfill()
            }
            
        }
        wait(for: [expectationValidConnectionToGoogle], timeout: 5)
    }
    
    
    func testInvalidConnectionToGoogleShouldFail() {
        // Tests failure due to invalid URL address
        NetworkUtils.checkConnection(viewController: UIViewController.init(), urlString: "https://google/") { (alertController, hasConnection) -> (Void) in
            if !hasConnection {
                XCTAssertFalse(hasConnection, "Connection to Google.com was unsuccessful as expected")
                self.expectationInvalidConnectionToGoogle.fulfill()
            }
        }
        
        wait(for: [expectationInvalidConnectionToGoogle], timeout: 5)
    }
    
    func testInsecureAddressShouldFail() {
        // Tests failure due to invalid URL address
        NetworkUtils.checkConnection(viewController: UIViewController.init(), urlString: "http://google.com/") { (alertController, hasConnection) -> (Void) in
            if !hasConnection {
                XCTAssertFalse(hasConnection, "Connection to Google.com was unsuccessful as expected due to insecure protocol.")
                self.expectationInsecureConnectionToGoogle.fulfill()
            }
        }
        
        wait(for: [expectationInsecureConnectionToGoogle], timeout: 5)
    }
    
    
}
