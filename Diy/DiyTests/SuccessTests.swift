//
//  SuccessTests.swift
//  DiyTests
//
//  Created by Mohanraj S K on 20/02/22.
//

@testable import Diy
import XCTest

class SuccessTests: XCTestCase {

    var viewController: SuccessVC!
    
    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
        DefaultsManager.shared.diyModel = nil
        viewController = SuccessVC.loadFromNib()
        viewController.loadViewIfNeeded()
        viewController.viewDidLoad()
        viewController.viewDidLayoutSubviews()
        viewController.viewWillAppear(true)
    }


    func testSetUpUI() {
        XCTAssertNotNil(viewController.viewDidLayoutSubviews())
    }

    func testUIACtions() {
        XCTAssertNotNil(viewController.btnFinish?.sendActions(for: .touchUpInside))
    }

}
