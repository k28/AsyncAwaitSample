//
//  AsyncLet.swift
//  AsyncAwaitSample
//
//  Created by K.Hatano on 2022/04/03.
//

import Foundation

enum AsyncLet {
}

extension AsyncLet {
    
    static public func sample() {
        Task {
            // async let を使うことで、複数の処理を同時に走らせることができます。
            async let first:  Void = sleepCount("first", count: 5)
            async let second: Void = sleepCount("secound", count: 5)
           
            // 処理が終わるのを待つ
            await second
            await first
            
            // 上2つの処理が終わった後に実行する処理
            await sleepCount("After", count: 3)
        }
    }
    
    static private func sleepCount(_ title: String, count: Int) async {
        for i in 0..<count {
            print("\(title) : \(i)")
            try? await Util.wait(1)
        }
    }
    
}
