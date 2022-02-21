//
//  Data+App.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import Foundation
extension Encodable {

    func encoded() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            print("Encoding error: \(error.localizedDescription)")
            return nil
        }
    }

}

extension Data {

    func decoded<T: Decodable>(to: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            print("Encoding error: \(error.localizedDescription)")
            return nil
        }
    }

}
