//
//  CustomAlertView.swift
//  Orange
//
//  Created by Vishwa Pandian on 9/17/22.
//

import SwiftUI

struct CustomAlertView : View {
    
    let coreDM: CoreDataManager
    
    @Binding var showTaskManager: Bool
    
    @Binding var event: Event?
    
    @State var name = ""
    
    @State var date = Date()
    @State var dateMin = Date()
    
    @State var totalHours = "0 hours"
    @State var totalMinutes = "0 minutes"
    
    @State var totalHoursInt: Int16 = 0
    @State var totalMinutesInt: Int16 = 0
    
    @State var priority = 1
    
    //@State var anytime = false
    //@State var anyday = false
    
    var body: some View {
        VStack {
            
          //  /*
            HStack {
                
                Image(systemName: "xmark.circle")
                    .font(Font.system(size: 20))
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .opacity(0)
                
                Spacer()
            
                
                TextField(event?.name ?? "", text: $name)
                    //.bold()
                    .foregroundColor(.primary)
                    .padding(5)
                    .multilineTextAlignment(.center)
                    .background(Color(.gray).opacity(0.1))
                    .cornerRadius(10)
                
                
                Spacer()
                
                Button {
                    showTaskManager.toggle()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(Font.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                }

            }
            .padding(.top, 30)
            
            
            HStack {
                Spacer()
                Button {
                    priority = 1
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
            .padding(.top, 30)
            
            
            HStack {
                
                DatePicker("Date", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(DefaultDatePickerStyle())
                    .labelsHidden()
                    .padding(.top, 30)
                
                DatePicker("Time", selection: $dateMin, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(DefaultDatePickerStyle())
                    .labelsHidden()
                    .padding(.top, 30)
            }
            
            
            
            HStack {
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
                        .foregroundColor(.primary)
                        .padding(7)
                        .background(Color(.gray).opacity(0.1))
                        .cornerRadius(10)
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
                        .foregroundColor(.primary)
                        .padding(7)
                        .background(Color(.gray).opacity(0.1))
                        .cornerRadius(10)
                }

            }.padding(.top, 25)
            
            
            HStack {
                
                Button {
                    
                    let dateFormatter = DateFormatter()
                    
                    let dateFormatter2 = DateFormatter()
                     
                    dateFormatter.dateFormat = "HH"
                    dateFormatter2.dateFormat = "mm"
                    
                    let str1 = dateFormatter.string(from: dateMin)
                    let str2 = dateFormatter2.string(from: dateMin)
                    
                    let result = ((Float)(str1) ?? 1) * 60 + ((Float)(str2) ?? 1)
                    
                    event!.date = date
                    
                    event!.length = (totalMinutesInt + (totalHoursInt * 60))
                    
                    event!.time = result
                    
                    event!.selectedTime = dateMin
                    
                    event!.name = name
                    
                    event!.priority = (Int16)(priority)
                    
                    if ((totalMinutesInt + (totalHoursInt * 60)) != 0) {
                        coreDM.updateEvent()
                        
                        showTaskManager.toggle()
                    }
                    
                } label: {
                    Text("Save")
                        //.bold()
                        .foregroundColor(Color("color0"))
                        .padding(.horizontal)
                }
                
                Button {
                    coreDM.deleteEvent(event: event!)
                    showTaskManager.toggle()
                } label: {
                    Text("Delete")
                        //.bold()
                        .foregroundColor(Color("color2"))
                        .padding(.horizontal)
                }
            }
            .padding()
            
            
        }
        .background(RoundedRectangle(cornerRadius: 20).shadow(color: .primary.opacity(0.2), radius: 3))
        .padding(.horizontal)
        .transition(.move(edge: .bottom))
        .foregroundColor(Color("backgroundColor"))
        .onAppear {
            
            name = event?.name ?? ""
            
            priority = (Int)(event!.priority)
            
            //anytime = event!.anytime
            //anyday = event!.anyday
            
            date = event!.date ?? Date()
            dateMin = event!.selectedTime ?? Date()
            totalHoursInt = event!.length / 60
            totalMinutesInt = event!.length % 60
            
            if (totalHoursInt == 1) {
                totalHours = "1 hour"
            } else {
                totalHours = "\(totalHoursInt) hours"
            }
            
            totalMinutes = "\(totalMinutesInt) minutes"
            
        }
        
    }
    
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(coreDM: CoreDataManager())
    }
}
