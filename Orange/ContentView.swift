//
//  ContentView.swift
//  Orange
//
//  Created by Vishwa Pandian on 9/17/22.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    
    var body: some View {
        
        AllTasksView(coreDM: coreDM, events: coreDM.getAllEvents())
        
        /*
        TabView {
            
            AllTasksView(coreDM: coreDM, events: coreDM.getAllEvents())
                .tabItem {
                    Label("First", systemImage: "2.square.fill")
                  }
            
            DayView(coreDM: coreDM)
                .tabItem {
                    Label("Second", systemImage: "2.square.fill")
                  }
            
        }
        .ignoresSafeArea()
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
