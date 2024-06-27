//
//  UserDefaults+EXT.swift
//  MoviesApp
//
//  Created by Fatih Özen on 27.06.2024.
//

import Foundation

extension UserDefaults {
    func set<T: Codable>(_ value: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(value) {
            self.set(data, forKey: key)
        }
    }

    func value<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = self.data(forKey: key),
           let value = try? JSONDecoder().decode(T.self, from: data) {
            return value
        }
        return nil
    }
}
