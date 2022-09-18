//
//  DayView.swift
//  Orange
//
//  Created by Vishwa Pandian on 9/17/22.
//

import SwiftUI

struct DayView: View {
    
    @State var currentDate = Date()
    
    @State var fullView = true
    
    @State var selectedDate = Date()
    
    let coreDM: CoreDataManager
    
    @State var events: [Event] = [Event]()
    
    @State private var showEventPicker = false
    
    @State var refreshBool = false
    
    @State var showEdit = false
    
    @State var currentDay = 0
    
    @State var tasksToday = 0
    
    func populateCalender() {
        events = coreDM.getAllEvents()
    }
    
    func getTime(date: Date)->Float {
        let dateFormatter = DateFormatter()
        
        let dateFormatter2 = DateFormatter()
         
        dateFormatter.dateFormat = "HH"
        dateFormatter2.dateFormat = "mm"
        
        let str1 = dateFormatter.string(from: date)
        let str2 = dateFormatter2.string(from: date)
        
        return ((Float)(str1) ?? 1) * 60 + ((Float)(str2) ?? 1)
    }


    func shuffle() {
            
            for event in events {
                if (event.anytime) {
                    if (event.dateSave != Date()) {
                        event.time = Float.random(in: 420...(1440 - (Float)(event.length)))
                    } else {
                        event.time = Float.random(in: getTime(date: Date())...(1440 - (Float)(event.length)))
                    }
                }
                
                if (event.anyday && (Date().formatted(.dateTime.day()) != event.dateSave!.formatted(.dateTime.day()))) {
                    let val1 = Int(Date().timeIntervalSince1970)
                    let val2 = Int((event.dateSave ?? Date()).timeIntervalSince1970)
                    
                    let val3 = Int.random(in: val1...val2)
                    
                    event.date = Date(timeIntervalSince1970: TimeInterval(val3))
                }
                
            }
            
            coreDM.updateEvent()
            
        }
    
    func getTotalTasks()->Int {
        var counter = 0;
        for event in events {
                        
            let compareDate = event.date ?? Date()
            
            if ("\((currentDate + TimeInterval((86400 * currentDay))).formatted(.dateTime.weekday(.wide).month(.wide).day()))" == "\(compareDate.formatted(.dateTime.weekday(.wide).month(.wide).day()))")
            {
                counter += 1;
            }
    }
        return counter
    }

    
    func getPadding()->CGFloat {
        let dateFormatter = DateFormatter()
        
        let dateFormatter2 = DateFormatter()
         
        dateFormatter.dateFormat = "HH"
        dateFormatter2.dateFormat = "mm"
        
        let str1 = dateFormatter.string(from: Date())
        let str2 = dateFormatter2.string(from: Date())
        
        let result = ((Float)(str1) ?? 1) * 60 + ((Float)(str2) ?? 1)
        
        return ((CGFloat)(result) * 1.577)
    }
    
    @State var pickedEvent: Event? = nil
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                /*
                
                HStack {
                    
                    Button {
                        showEventPicker.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "plus")
                            .font(Font.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .background(Color("color4"))
                        .cornerRadius(15)
                    }
                    .sheet(isPresented: $showEventPicker, onDismiss: {
                        populateCalender()
                    }) {
                        AddView(coreDM: CoreDataManager(), showEventPicker: $showEventPicker)
                            }
                    
                    Button {
                        shuffle()
                        refreshBool.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "shuffle")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .background(Color("color4"))
                        .cornerRadius(15)
                    }
                    .onAppear {
                        populateCalender()
                    }
                }
                .padding(7)
                
            */
                
                VStack {
                    if (fullView) {
                        
                        VStack {
                            VStack(alignment: .leading) {
                                
                                Text("\((currentDate + TimeInterval((86400 * currentDay))).formatted(.dateTime.weekday(.wide))), \((currentDate + TimeInterval((86400 * currentDay))).formatted(.dateTime.day().month(.wide)))")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("\(getTotalTasks()) tasks today")
                                    .foregroundColor(.white)
                                    .opacity(0.9)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<100) { day in
                                            
                                            if (day == currentDay) {
                                                Button {
                                                    currentDay = day
                                                } label: {
                                                    
                                                    ZStack {
                                                        
                                                        Capsule()
                                                            .frame(width: 50, height: 60)
                                                            .foregroundColor(.white)
                                                            .opacity(0.4)
                                                        
                                                        VStack {
                                                            Text("\((currentDate + TimeInterval((86400 * day))).formatted(.dateTime.day()))")
                                                                .foregroundColor(.white)
                                                            Text("\((currentDate + TimeInterval((86400 * day))).formatted(.dateTime.weekday(.short)))")
                                                                .foregroundColor(.white)
                                                        }
                                                    }
                                                }
                                            } else {
                                                Button {
                                                    currentDay = day
                                                } label: {
                                                    ZStack {
                                                        
                                                        Capsule()
                                                            .strokeBorder(.white, lineWidth: 3)
                                                            .frame(width: 50, height: 60)
                                                            .foregroundColor(.white)
                                                            .opacity(0.4)
                                                        
                                                        VStack {
                                                            Text("\((selectedDate + TimeInterval((86400 * day))).formatted(.dateTime.day()))")
                                                                .foregroundColor(.white)
                                                            Text("\((selectedDate + TimeInterval((86400 * day))).formatted(.dateTime.weekday(.short)))")
                                                                .foregroundColor(.white)
                                                        }
                                                    }
                                                }
                                            }
                                            
                                            }
                                    }
                                }
                                
                                HStack {
                                    Spacer()
                                    Button {
                                        fullView.toggle()
                                    } label: {
                                        Image(systemName: "minus")
                                            .font(Font.system(size: 100, weight: .thin))
                                            .foregroundColor(.white)
                                            .opacity(0.5)
                                    }
                                    Spacer()
                                    
                                }
                                .padding(.top, 1)
                                
                            }
                        }
                        .padding()
                        .background(Color(red: 209/255, green: 190/255, blue: 173/255))
                    } else {
                        VStack {
                            VStack(alignment: .leading) {
                                
                                Text("\((currentDate + TimeInterval((86400 * currentDay))).formatted(.dateTime.weekday(.wide))), \((currentDate + TimeInterval((86400 * currentDay))).formatted(.dateTime.day().month(.wide)))")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("\(getTotalTasks()) tasks today")
                                    .foregroundColor(.white)
                                    .opacity(0.9)
                                
                                HStack {
                                    Spacer()
                                    Button {
                                        fullView.toggle()
                                    } label: {
                                        Image(systemName: "minus")
                                            .font(Font.system(size: 100, weight: .thin))
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                }
                                
                            }
                        }
                        .padding()
                        .background(Color(red: 209/255, green: 190/255, blue: 173/255))
                    }
                }
                
               /*
                List {
                    
                    ForEach(events, id: \.self) { event in
                        VStack {
                            Text(event.name ?? "")
                            Text((event.date ?? Date()), style: .date)
                            Text("Length: \(event.length) minutes")
                            //Text("Time: \(event.time ?? Date())")
                            Text("Time: \(event.time)")
                            if (event.repeats) {
                                Text("Repeats")
                            }
                            if (event.anytime) {
                                Text("Event can be anytime")
                            }
                            
                        }

                    }
                    .onDelete(perform: { IndexSet in
                        IndexSet.forEach { index in
                            let event = events[index]
                            coreDM.deleteEvent(event: event)
                            populateCalender()
                        }
                    })
                    
                }
                */
                
                ScrollView {
                    ScrollViewReader { proxy in
                        
                        ZStack {
                            
                            VStack {
                                ForEach(0..<24) { time in
                                    
                                    HStack {
                                        VStack(alignment: .trailing) {
                                            Rectangle()
                                                .frame(width: 75, height: 1)
                                                .foregroundColor(Color("color5"))
                                            if (time > 12) {
                                                Text("\(time - 12) PM")
                                                    .font(Font.system(size: 15, weight: .thin))
                                                    .foregroundColor(Color("color5"))
                                                    .padding(.bottom, 60)
                                            } else if (time == 0) {
                                                Text("12 AM")
                                                    .font(Font.system(size: 15, weight: .thin))
                                                    .foregroundColor(Color("color5"))
                                                    .padding(.bottom, 60)
                                            } else if (time == 12) {
                                                Text("12 PM")
                                                    .font(Font.system(size: 15, weight: .thin))
                                                    .foregroundColor(Color("color5"))
                                                    .padding(.bottom, 60)
                                            } else {
                                                Text("\(time) AM")
                                                    .font(Font.system(size: 15, weight: .thin))
                                                    .foregroundColor(Color("color5"))
                                                    .padding(.bottom, 60)
                                            }
                                        } // VStack
                                        Spacer()
                                        
                                        if (refreshBool) {
                                            
                                        }
                                    } // HStack
                                   
                                } // ForEach
                            } // VStack
                            
                            
                            ZStack {
                                ForEach(events, id: \.self) { event in
                                    
                                    let compareDate = event.date ?? Date()
                                    
                                    if ("\((currentDate + TimeInterval((86400 * currentDay))).formatted(.dateTime.weekday(.wide).month(.wide).day()))" == "\(compareDate.formatted(.dateTime.weekday(.wide).month(.wide).day()))")
                                    {
                                        
                                        HStack {
                                            Spacer()
                                            VStack {
                                                
                                                HStack {
                                                    Spacer()
                                                        .frame(width: 80, alignment: .leading)
                                                    
                                                    VStack {
                                                        
                                                        let len = (CGFloat)(event.length) * 1.577
                                                        
                                                        let topPadding = (CGFloat)(event.time) * 1.577
                                                        
                                                        Spacer()
                                                            .frame(height: topPadding)
                                                        
                                                        ZStack {
                                                            
                                                            Button {
                                                                pickedEvent = event
                                                                showEdit.toggle()
                                                            } label: {
                                                                
                                                                if (event.priority == 1) {
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                        .frame(width: .infinity, height: len)
                                                                        .padding(.horizontal)
                                                                        .foregroundColor(Color("color0"))
                                                                } else if (event.priority == 2) {
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                        .frame(width: .infinity, height: len)
                                                                        .padding(.horizontal)
                                                                        .foregroundColor(Color("color1"))
                                                                } else {
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                        .frame(width: .infinity, height: len)
                                                                        .padding(.horizontal)
                                                                        .foregroundColor(Color("color2"))
                                                                }
                                                                
                                                            }
                                                            
                                                            VStack {
                                                                
                                                                let length = event.length
                                                                
                                                                if(length >= 45) {
                                                                    Text(event.name ?? "")
                                                                        .bold()
                                                                        .foregroundColor(.white)
                                                                    if (length == 60) {
                                                                        Text("\((length / 60)) hour")
                                                                            .foregroundColor(.white)
                                                                            .opacity(0.8)
                                                                    } else if (length % 60 == 0) {
                                                                        Text("\(length / 60) hours")
                                                                            .foregroundColor(.white)
                                                                            .opacity(0.8)
                                                                    } else if (length < 120 && length > 45) {
                                                                        Text("\(length / 60) hour \(length % 60) minutes")
                                                                            .foregroundColor(.white)
                                                                            .opacity(0.8)
                                                                    } else if (length >= 45) {
                                                                        Text("\(length % 60) minutes")
                                                                            .foregroundColor(.white)
                                                                            .opacity(0.8)
                                                                    } else {
                                                                        Text("\(length / 60) hours \(length % 60) minutes")
                                                                            .foregroundColor(.white)
                                                                            .opacity(0.8)
                                                                    }
                                                                } else if (length >= 20) {
                                                                    Text(event.name ?? "")
                                                                        .bold()
                                                                        .foregroundColor(.white)
                                                                }
                                                            }
                                                            
                                                        }

                                                    }
                                                }
                                                
                                                Spacer()
                                            }
                                        }
                                    } // end of if
                                    
                                }
                                
                                VStack {
                                    VStack {
                                        Spacer()
                                            .frame(height: getPadding())
                                        
                                        Line()
                                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                            .frame(height: 1)
                                            .foregroundColor(Color("color5"))
                                            .id(21)
                                    }
                                    Spacer()
                                }
                                
                            }
                            
                        } // ZStack
                        .onAppear {
                            proxy.scrollTo(21, anchor: .center)
                        }
                    }
                }
                
                
            } // VStack
            
            
            VStack {
                Spacer()
                HStack {
                    
                    Button {
                        shuffle()
                        refreshBool.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(red: 209/255, green: 190/255, blue: 173/255))
                            Image(systemName: "shuffle")
                                .font(Font.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            
                        }
                    }.onAppear {
                        populateCalender()
                    }
                    
                    Spacer()
                    
                    Button {
                        showEventPicker.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(red: 209/255, green: 190/255, blue: 173/255))
                            Image(systemName: "plus")
                                .font(Font.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            
                        }
                    }
                    .sheet(isPresented: $showEventPicker, onDismiss: {
                        populateCalender()
                    }) {
                        AddView(coreDM: CoreDataManager(), showEventPicker: $showEventPicker)
                            }

                }
                .padding(.horizontal, 50)
                
            }.overlay(alignment: .bottom) {
                if (showEdit) {
                    CustomAlertView(coreDM: coreDM, showTaskManager: $showEdit, event: $pickedEvent)
                        .animation(.spring())
                }
            }
            
        }
        
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}


struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(coreDM: CoreDataManager())
            //.preferredColorScheme(.dark)
        
        //CustomAlertView()
        //    .padding()
        //    .previewLayout(.sizeThatFits)
            
    }
}
