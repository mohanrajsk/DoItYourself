//
//  DIYSummaryTests.swift
//  DiyTests
//
//  Created by Mohanraj S K on 20/02/22.
//

@testable import Diy
import XCTest

class DIYSummaryTests: XCTestCase {

    var viewController: DIYSummaryVC!
    var viewModel: DIYSummaryVM!

    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
        DefaultsManager.shared.diyModel = nil
        viewController = DIYSummaryVC.loadFromNib()
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
        viewModel.selectedDevice.data = "BGM Meter"
        XCTAssertNotNil(viewModel.save())

        let diyModel = DIYModel()
        diyModel.deviceType = "BGM Meter"
        DefaultsManager.shared.diyModel = diyModel

        XCTAssertNotNil(viewModel.save())
        viewModel.deviceSerialNumber.data = "AXVBP89"
        XCTAssertNotNil(viewModel.save())
        
        XCTAssertNotNil(viewModel.save())
        viewModel.deviceVersion.data = "2.4.5"
        XCTAssertNotNil(viewModel.save())
        
        XCTAssertNotNil(viewModel.save())
        viewModel.deviceName.data = "Alpha"
        XCTAssertNotNil(viewModel.save())
        
        XCTAssertNotNil(viewController.popToDeviceSelection())

    }

    func testUIACtions() {
     
        let diyModel = DIYModel()
        diyModel.deviceType = "BGM Meter"
        DefaultsManager.shared.diyModel = diyModel

        viewModel.selectedDevice.data = diyModel.deviceType
        viewModel.deviceSerialNumber.data = "AXVBP89"
        viewModel.deviceName.data = "Alpha"
        viewModel.deviceVersion.data = "0"
        XCTAssertNotNil(viewModel.save())
        viewModel.deviceVersion.data = "2.4.5"
        XCTAssertNotNil(viewModel.save())

        XCTAssertNotNil(viewController.btnNext?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewController.btnBack?.sendActions(for: .touchUpInside))

        XCTAssertNotNil(viewModel.loadUserData())
        XCTAssertEqual(viewModel.selectedDevice.data, viewController.txtSelectedDevice.text)
        XCTAssertEqual(viewModel.deviceSerialNumber.data, viewController.txtSerialNumber.text)
        XCTAssertEqual(viewModel.deviceName.data, viewController.txtDeviceName.text)
        XCTAssertEqual(viewModel.deviceVersion.data, viewController.txtDeviceVersion.text)
        XCTAssertNotNil(viewController.cancelAction())
    }

}
