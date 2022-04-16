//
//  Lab2App.swift
//  Lab2
//
//  Created by Яна Страшок on 06.04.2022.
//

import SwiftUI

@main
struct Lab2App: App {
    let list = StudentListVM()
    var body: some Scene {
        WindowGroup {
            ContentView(VM: list)
        }
    }
}
