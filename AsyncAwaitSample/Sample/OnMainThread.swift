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
        return await withCheckedContinuation { continuation in
            DispatchQueue.main.async {
                action()
                continuation.resume()
            }
        }
    }
    
    
    
}
