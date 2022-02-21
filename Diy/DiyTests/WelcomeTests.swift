//
//  WelcomeTests.swift
//  DiyTests
//
//  Created by Mohanraj S K on 19/02/22.
//

@testable import Diy
import XCTest

class WelcomeTests: XCTestCase {

    var viewController: WelcomeVC!
    
    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
        DefaultsManager.shared.diyModel = nil
        viewController = WelcomeVC.loadFromNib()
        viewController.loadViewIfNeeded()
        viewController.viewDidLoad()
        viewController.viewDidLayoutSubviews()
        viewController.viewWillAppear(true)
    }


    func testSetUpUI() {
        XCTAssertNotNil(viewController.viewDidLayoutSubviews())
    }

    func testUIACtions() {
        XCTAssertNotNil(viewController.btnNext?.sendActions(for: .touchUpInside))
    }

}
