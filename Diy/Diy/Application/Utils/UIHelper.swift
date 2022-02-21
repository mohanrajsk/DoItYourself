//
//  UIHelper.swift
//  diy
//
//

import UIKit

class UIHelper: NSObject {

    var loader: UIView?
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate

    // Singleton instance
    static let shared = UIHelper()

    private override init() {
        super.init()
    }
}

// MARK: UIComonents
extension UIHelper {

    // To show loading for the given view
    func showLoading(onView: UIView) {

       let spinnerView = UIView.init(frame: UIScreen.main.bounds)
       spinnerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)

       let activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
       activityIndicator.startAnimating()
       activityIndicator.hidesWhenStopped = true

       activityIndicator.center = spinnerView.center
       activityIndicator.autoresizingMask = [.flexibleTopMargin, .flexibleRightMargin,
                                                .flexibleLeftMargin, .flexibleBottomMargin]

        DispatchQueue.main.async {
           spinnerView.addSubview(activityIndicator)
           onView.addSubview(spinnerView)
       }
       loader = spinnerView

    }

    // Hide loading
    func hideLoading() {

       DispatchQueue.main.async {

            self.loader?.removeFromSuperview()
            self.loader = nil

       }

    }

    // Get Application's Name
    func getAppName() -> String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "Assignment"
    }

    // Show message in UIAlert
    func showAlert(message: String, viewController: UIViewController?, callback: (() -> Void)? = nil, onActionCallback: (() -> Void)? = nil) {

         let title = getAppName()
         let alert: UIAlertController! = UIAlertController(title: title,
                                                           message: message,
                                                           preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
             onActionCallback?()
         }))
         viewController?.present(alert, animated: true, completion: callback)

    }

    func addDatePicker(inputField:UITextField, mode:UIDatePicker.Mode, doneAction:Selector, cancelAction:Selector, forVC:Any, minDate: Date? = nil, maxDate: Date? = nil) -> UIDatePicker{
        
        //Step 1: Create DatePicker based on Mode
        let datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0,
                                                   width: UIScreen.main.bounds.size.width, height: 216))
        datePicker.backgroundColor = UIColor.white
        datePicker.datePickerMode = mode
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        inputField.inputView = datePicker
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        //Step 2: Create Toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = ColorAsset.appPrimary.color
        toolBar.sizeToFit()
        
        //Step 3: Add Actions to Tool bar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain,
                                         target: forVC, action: doneAction)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target:
                                            forVC, action: cancelAction)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        inputField.inputAccessoryView = toolBar
        
        return datePicker
        
    }

    func convertDateToString(_ date: Date, zone:TimeZone? = TimeZone.current, format:String = dateFormat) -> String{
        
        //Convert local date string to Date object
        let utcFormatter:DateFormatter = DateFormatter()
        utcFormatter.timeZone = zone
        utcFormatter.dateFormat = format
        let localDate = utcFormatter.string(from: date)
        return localDate
        
    }

}
