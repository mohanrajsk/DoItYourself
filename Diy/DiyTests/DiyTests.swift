//
//  DiyTests.swift
//  DiyTests
//
//  Created by Mohanraj S K on 18/02/22.
//

import XCTest
@testable import Diy
import XCTest

class DiyTests: XCTestCase {


    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
    }

    func testUtils() {
        XCTAssertNotNil(UIHelper.shared.showAlert(message: "test message", viewController: UIViewController()))
        XCTAssertNotNil(UIHelper.shared.showLoading(onView: UIView()))
        XCTAssertNotNil(UIHelper.shared.hideLoading())
        XCTAssertNotNil(UIHelper.shared.getAppName())
        XCTAssertNotNil(UIHelper.shared.convertDateToString(Date(), format: dateFormat))
        XCTAssertNotNil(UIHelper.shared.addDatePicker(inputField: UITextField(), mode: .date,
                                                      doneAction: #selector(done), cancelAction: #selector(cancel), forVC:self))
        XCTAssertNotNil(ViewController.loadFromNib())
    }

    func testDefaultManager() {

        DefaultsManager.shared.diyModel = nil
        XCTAssertNil(DefaultsManager.shared.diyModel)

        let diyModel = DIYModel()
        diyModel.deviceType = "BGM Meter"
        DefaultsManager.shared.diyModel = diyModel
        XCTAssertNotNil(DefaultsManager.shared.diyModel)
    }

    @objc func done() {
    }

    @objc func cancel() {
    }

}
