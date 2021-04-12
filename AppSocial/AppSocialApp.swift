//
//  AppSocialApp.swift
//  AppSocial
//
//  Created by Marlon Machado on 12/04/21.
//

import SwiftUI

@main
struct AppSocialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: UserViewModel())
        }
    }
}
