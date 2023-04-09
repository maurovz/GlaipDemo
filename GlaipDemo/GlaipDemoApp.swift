//
//  GlaipDemoApp.swift
//  GlaipDemo
//
//  Created by Mauricio Vazquez on 15/8/22.
//

import SwiftUI
import Glaip

@main
struct GlaipDemoApp: App {
    private var storedValue: String = ""
    private var retrievedValue: String = ""
    @ObservedObject private var glaip: Glaip
    init() {
      self.glaip = Glaip(
        title: "Glaip Demo App",
        description: "Demo app to demonstrate Web3 login",
        supportedWallets: [.Rainbow])
    }
    var body: some Scene {
        WindowGroup {
            if getStringFromKeychain(key: "walletAddress") != nil{
                ProfileView(logoutAction: {
                  glaip.userState = .unregistered
                  glaip.logout()
                })
            }else{
                LoginView()
            }
          
        }
    }
}
