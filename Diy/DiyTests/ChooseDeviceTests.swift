//
//  ChooseDeviceTests.swift
//  DiyTests
//
//  Created by Mohanraj S K on 19/02/22.
//

@testable import Diy
import XCTest

class ChooseDeviceTests: XCTestCase {

    var viewController: ChooseDeviceVC!
    var viewModel: ChooseDeviceVM!

    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
        DefaultsManager.shared.diyModel = nil
        viewController = ChooseDeviceVC.loadFromNib()
        viewController.loadViewIfNeeded()
        viewController.viewDidLoad()
        viewController.viewDidLayoutSubviews()
        viewController.viewWillAppear(true)
        viewModel = viewController.viewModel
    }

    func testSetUpUI() {
        XCTAssertNotNil(viewController.viewDidLayoutSubviews())
    }

    func testValidation() {
        XCTAssertNotNil(viewModel.save())
    }

    func testBLEActions() {

        let diyModel = DIYModel()
        diyModel.firstName = "John"
        DefaultsManager.shared.diyModel = diyModel
        XCTAssertNotNil(viewController.btnBLEPen?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewController.btnNext?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewController.btnBack?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewModel.save())
        XCTAssertNotNil(viewModel.loadUserData())

    }

    func testBGMActions() {

        let diyModel = DIYModel()
        diyModel.firstName = "John"
        DefaultsManager.shared.diyModel = diyModel
        XCTAssertNotNil(viewController.btnBGMMeter?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewController.btnNext?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewController.btnBack?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewModel.save())
        XCTAssertNotNil(viewModel.loadUserData())

    }
}
