//
//  AllTasksView.swift
//  Autotask
//
//  Created by Vishwa Pandian on 9/17/22.
//

import SwiftUI

struct AllTasksView: View {
    
    let coreDM: CoreDataManager
    
    @State var events: [Event]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollViewReader { proxy in
                    
                    Text("Past")
                    ForEach(events, id: \.self) { event in
                        
                        if ((Date().formatted(.dateTime.day()) > event.date!.formatted(.dateTime.day()))) {
                            HStack {
                                VStack {
                                    Text(event.name!)
                                    Text("Due Date: \(event.dateSave!.formatted(.dateTime.day()))")
                                    Text("Length: \(event.length / 60) hours \(event.length % 60) minutes")
                                }
                            }
                        }
                        
                    }
                    
                    Text("Today")
                    ForEach(events, id: \.self) { event in
                        
                        if ((Date().formatted(.dateTime.day()) == event.date!.formatted(.dateTime.day()))) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: .infinity, height: 50)
                                    .padding(.horizontal)
                                    .foregroundColor(Color("color1"))
                                
                                Text("\(event.date!)")
                            }
                        }
                        
                    }
                    
                    Text("Future")
                    ForEach(events, id: \.self) { event in
                        
                        if ((Date().formatted(.dateTime.day()) < event.date!.formatted(.dateTime.day()))) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: .infinity, height: 50)
                                    .padding(.horizontal)
                                    .foregroundColor(Color("color1"))
                                
                                Text("\(event.date!)")
                            }
                        }
                        
                    }
                     

                    Spacer()
                    
                }
            }
            .navigationTitle("All Tasks")
        }
    }
}

/*
 RoundedRectangle(cornerRadius: 10)
     .frame(width: .infinity, height: 50)
     .padding(.horizontal)
     .foregroundColor(Color("color1"))

 */

struct AllTasksView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}

