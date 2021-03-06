//
//  ContentView.swift
//  AsyncAwaitSample
//
//  Created by K.Hatano on 2022/04/02.
//

import SwiftUI

struct MainTopView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()

            Button(action: {
                Basic.asyncAwaitSample()
            }) {
                Text("Async Basic")
            }
            .padding()
            
            Button(action: {
                AsyncLet.sample()
            }) {
                Text("Async let sample")
            }
            .padding()
            
            Button(action: {
                OnMainThread.sample()
            }) {
                Text("On main thread sample")
            }
            .padding()
            
            Button(action: {
                CancelAndException.sample()
            }) {
                Text("Exception ans cancel sample")
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTopView()
    }
}
