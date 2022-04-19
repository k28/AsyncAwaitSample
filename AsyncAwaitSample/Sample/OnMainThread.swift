//
//  OnMainThread.swift
//  AsyncAwaitSample
//
//  Created by K.Hatano on 2022/04/03.
//

import Foundation

enum OnMainThread {
}

extension OnMainThread {
    
    static public func sample() {
        Task {
            await Basic.asyncCount(3)
            await onMainThread {
                print("\(Thread.current) : Hello! Main Thread!")
            }
            await Basic.asyncCount(3)
        }
    }
    
    static private func onMainThread(action: @escaping (() -> Void)) async {
        
        await MainActor.run {
            action()
        }
        
        // 下の方法でも良いけど、MainActor.run{}の方が簡単で良いと思う。
//        return await withCheckedContinuation { continuation in
//            DispatchQueue.main.async {
//                continuation.resume()
//            }
//        }
    }
    
    
    
}
