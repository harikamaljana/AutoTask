//
//  OrangeApp.swift
//  Orange
//
//  Created by Vishwa Pandian on 9/17/22.
//

import SwiftUI

@main
struct OrangeApp: App {
    var body: some Scene {
        WindowGroup {
            DayView(coreDM: CoreDataManager())
        }
    }
}
