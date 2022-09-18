//
//  AddEvent.swift
//  schedule
//
//  Created by Vishwa Pandian on 9/17/22.
//

import SwiftUI

struct AddView: View {
    
    let coreDM: CoreDataManager
    
    @State var nameOfEvent = ""
    @State var selectedDate = Date()
    @State var selectedTime = Date()
    @State var reccuring = false
    @State var timeMatters = false
    
    @State var totalHours = "0 hours"
    @State var totalMinutes = "0 minutes"
    
    @State var totalHoursInt: Int16 = 0
    @State var totalMinutesInt: Int16 = 0
    
    @Binding var showEventPicker: Bool
    
    @State var anytimeBeforeBool = false
    
    @State var priority = 1
    
    @State var colorPriority = Color("color0")
    
    
    func getTime(date: Date)->Float {
        let dateFormatter = DateFormatter()
        
        let dateFormatter2 = DateFormatter()
         
        dateFormatter.dateFormat = "HH"
        dateFormatter2.dateFormat = "mm"
        
        let str1 = dateFormatter.string(from: date)
        let str2 = dateFormatter2.string(from: date)
        
        return ((Float)(str1) ?? 1) * 60 + ((Float)(str2) ?? 1)
    }
    
    var body: some View {
        VStack {
            
            Form {
                
                Section {
                    TextField("Name of task", text: $nameOfEvent)
                }
                
                
                Section(header: Text("Priority")) {
                    HStack {
                        Spacer()
                        Button {
                            priority = 1
                            colorPriority = Color("color0")
                        } label: {
                            
                            if (priority == 1) {
                                Text("Low")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(Color("color0"))
                                    .cornerRadius(10)
                            } else {
                                Text("Low")
                                    .bold()
                                    .foregroundColor(Color("color0"))
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("color0"), lineWidth: 2)
                                        )

                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            priority = 2
                            colorPriority = Color("color1")
                        } label: {
                            if (priority == 2) {
                                Text("Medium")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(Color("color1"))
                                    .cornerRadius(10)
                            } else {
                                Text("Medium")
                                    .bold()
                                    .foregroundColor(Color("color1"))
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("color1"), lineWidth: 2)
                                        )

                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            priority = 3
                            colorPriority = Color("color2")
                        } label: {
                            if (priority == 3) {
                                Text("High")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(Color("color2"))
                                    .cornerRadius(10)
                            } else {
                                Text("High")
                                    .bold()
                                    .foregroundColor(Color("color2"))
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("color2"), lineWidth: 2)
                                        )

                            }
                        }
                        
                        Spacer()
                    }
                    .buttonStyle(BorderlessButtonStyle())

                }
                 
                 
                Section(header: Text("Due date"), footer: Text("(Ai will pick a day before the due date)")) {
                    DatePicker("When: ", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .accentColor(colorPriority)
                    
                    Toggle("Let the Ai pick a day", isOn: $anytimeBeforeBool)
                        .tint(colorPriority)
                    
                }
                
                Section(header: Text("start time")) {
                    if (!timeMatters) {
                        DatePicker("",selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel)
                    }
                    Toggle("Let the Ai pick a time", isOn: $timeMatters)
                        .tint(colorPriority)
                }
                
                Section(header: Text("task length")) {
                    Menu {
                        
                        Button {
                            
                            totalHours = "0 hours"
                            
                        } label: {
                            Text("0 Hours")
                        }
                        
                        Button {
                            
                            totalHours = "1 hour"
                            totalHoursInt = 1
                            
                        } label: {
                            Text("1 Hour")
                        }
                        
                        Button {
                            
                            totalHours = "2 hours"
                            totalHoursInt = 2
                            
                        } label: {
                            Text("2 Hours")
                        }
                        
                        Button {
                            
                            totalHours = "3 hours"
                            totalHoursInt = 3
                            
                        } label: {
                            Text("3 Hours")
                        }
                        
                        Button {
                            totalHours = "4 hours"
                            totalHoursInt = 4
                        } label: {
                            Text("4 Hours")
                        }
                        
                        Button {
                            totalHours = "5 hours"
                            totalHoursInt = 5
                        } label: {
                            Text("5 Hours")
                        }
                        
                        Button {
                            totalHours = "6 hours"
                            totalHoursInt = 6
                        } label: {
                            Text("6 Hours")
                        }
                        
                        Button {
                            totalHours = "7 hours"
                            totalHoursInt = 7
                        } label: {
                            Text("7 Hours")
                        }
                        
                        Button {
                            totalHours = "8 hours"
                            totalHoursInt = 8
                        } label: {
                            Text("8 Hours")
                        }
                        
                        Button {
                            totalHours = "9 hours"
                            totalHoursInt = 9
                        } label: {
                            Text("9 Hours")
                        }
                        
                    } label: {
                        Text(totalHours)
                            .foregroundColor(.secondary)
                    }
                    
                    Menu {
                        
                        Button {
                            totalMinutes = ("0 minutes")
                            totalMinutesInt = 0
                        } label: {
                            Text("0 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("5 minutes")
                            totalMinutesInt = 5
                        } label: {
                            Text("5 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("10 minutes")
                            totalMinutesInt = 10
                        } label: {
                            Text("10 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("15 minutes")
                            totalMinutesInt = 15
                        } label: {
                            Text("15 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("20 minutes")
                            totalMinutesInt = 20
                        } label: {
                            Text("20 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("25 minutes")
                            totalMinutesInt = 25
                        } label: {
                            Text("25 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("30 minutes")
                            totalMinutesInt = 30
                        } label: {
                            Text("30 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("40 minutes")
                            totalMinutesInt = 40
                        } label: {
                            Text("40 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("45 minutes")
                            totalMinutesInt = 45
                        } label: {
                            Text("45 minutes")
                        }
                        
                        Button {
                            totalMinutes = ("50 minutes")
                            totalMinutesInt = 50
                        } label: {
                            Text("50 minutes")
                        }
                        
                        
                    } label: {
                        Text(totalMinutes)
                            .foregroundColor(.secondary)
                    }

                }
                
                Section {
                    Toggle("Is this a recurring event?", isOn: $reccuring)
                        .tint(colorPriority)
                }
                
                Button {
                    
                    totalMinutesInt += (totalHoursInt * 60)
                    
                    let dateFormatter = DateFormatter()
                    
                    let dateFormatter2 = DateFormatter()
                     
                    dateFormatter.dateFormat = "HH"
                    dateFormatter2.dateFormat = "mm"
                     
                    var result: Float
                    
                    if (!timeMatters) {
                        
                        let str1 = dateFormatter.string(from: selectedTime)
                        let str2 = dateFormatter2.string(from: selectedTime)
                        
                        let finalFloat = ((Float)(str1) ?? 1) * 60 + ((Float)(str2) ?? 1)
                        
                        result = finalFloat
                        
                    } else {
                        result = Float.random(in: getTime(date: Date())...(1440 - (Float)(totalMinutesInt)))
                    }
                    
                    if nameOfEvent == "" {
                        nameOfEvent = "untitled event"
                    }
                    
                    if (totalMinutesInt != 0) {
                        coreDM.saveEvent(name: nameOfEvent, date: selectedDate, repeats: reccuring, length: totalMinutesInt, anytime: timeMatters, time: result, selectedTime: selectedTime, priority: Int16(priority), anyday: anytimeBeforeBool, dateSave: selectedDate)
                        showEventPicker = false
                    }
                    
                } label: {
                    HStack {
                        Spacer()
                        Text("Add Task +")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(5)
                            .padding(.horizontal, 10)
                            .background(colorPriority)
                            .cornerRadius(10)
                        Spacer()
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .listRowBackground(Color.clear)
                
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(coreDM: CoreDataManager(), showEventPicker: .constant(true))
            .preferredColorScheme(.dark)
    }
}
