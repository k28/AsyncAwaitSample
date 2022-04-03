//
//  Util.swift
//  AsyncAwaitSample
//
//  Created by K.Hatano on 2022/04/03.
//

import Foundation

enum Util {
}

extension Util {
    
    static public func wait(_ sec: UInt64) async throws {
        try await Task.sleep(nanoseconds: sec * 1_000_000_000)
    }
    
}
