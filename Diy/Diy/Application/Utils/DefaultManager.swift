//
//  DefaultManager.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import Foundation

class DefaultsManager: UserDefaults {

    static let shared = DefaultsManager()

    var diyModel: DIYModel? {
        set(newValue) {
            if newValue == nil {
                self.removeObject(forKey: "DIY_MODEL")
            }
            else {
                guard let data = newValue.encoded() else { return }
                self.set(data, forKey: "DIY_MODEL")
            }
            self.synchronize()
        }
        get {
            if let configData = self.object(forKey: "DIY_MODEL") as? Data {
                guard let result = configData.decoded(to: DIYModel.self) else { return nil }
                return result
            }
            return nil
        }
    }

}
