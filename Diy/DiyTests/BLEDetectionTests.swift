//
//  BLEDetectionTests.swift
//  DiyTests
//
//  Created by Mohanraj S K on 20/02/22.
//

import XCTest

@testable import Diy
import XCTest

class BLEDetectionTests: XCTestCase {

    var viewController: BLEDetectionVC!
    var viewModel: BLEDetectionVM!

    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
        DefaultsManager.shared.diyModel = nil
        viewController = BLEDetectionVC.loadFromNib()
        viewController.loadViewIfNeeded()
        viewController.viewDidLoad()
        viewController.viewDidLayoutSubviews()
        viewController.viewWillAppear(true)
        viewModel = viewController.viewModel
    }

    func testSetUpUI() {
        XCTAssertNotNil(viewController.viewDidLayoutSubviews())
    }

    func testUIACtions() {

        let diyModel = DIYModel()
        diyModel.firstName = "John"
        DefaultsManager.shared.diyModel = diyModel

        XCTAssertNotNil(viewController.btnNext?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewController.btnBack?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewController.handleValidation(message: "BLE Not detected"))
        XCTAssertNotNil(viewController.navigateToNextScreen())
        viewController = nil

    }

}
