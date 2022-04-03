//
//  CancelAndException.swift
//  AsyncAwaitSample
//
//  Created by K.Hatano on 2022/04/03.
//

import Foundation

enum SampleError: Error {
    case Test(message: String)
}

enum CancelAndException {}

extension CancelAndException {
    
    static public func sample() {
        Task {
            do {
                async let first:  Void = asyncCount("first",  5)
                async let second: Void = asyncCount("second", 5)
                
                try await Util.wait(3)
                try await faildAction("Faild!")
                await asyncCount("final", 3)    // 実行されない
                
                await first
                await second
            } catch (SampleError.Test(let message)) {
                print("\(message)")
            }
        }
    }
    
    static private func faildAction(_ message: String) async throws {
        throw SampleError.Test(message: message)
    }
    
    static private func asyncCount(_ title: String, _ repeatCount: Int) async {
        for i in 0..<repeatCount {
            if Task.isCancelled {
                // 他のTaskでExceptionが起きたり、 Taskがキャンセルされるときに終了の処理を行う
                print("\(title) : Cancelled")
                break
            }
            print("\(title) : asyncCount : \(i)")
            try? await Util.wait(1)
        }
    }

}
