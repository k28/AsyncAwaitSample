//
//  Basic.swift
//  AsyncAwaitSample
//
//  Created by K.Hatano on 2022/04/02.
//

import Foundation

enum Basic {
}

extension Basic {
    
    /// Basic async/await sample
    static func asyncAwaitSample() {
        Task {
            // 別スレッドで処理を順番に実行します
            await asyncPrint("Count Start")
            await asyncCount(5)
            await asyncPrint("Count End")
        }
    }
    
    static private func asyncPrint(_ str: String) async {
        print(str)
    }
    
    static public func asyncCount(_ repeatCount: Int) async {
        for i in 0..<repeatCount {
            print("asyncCount : \(i)")
            try? await Util.wait(1)
        }
    }
        
}
