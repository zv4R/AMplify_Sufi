//
//  AlarmView.swift
//  AMplify_Sufi_watchOS Watch App
//
//  Created by Sufi Arifin on 15/05/25.
//

import SwiftUI

struct AlarmView: View {
    @State private var alarmTime = "04:30"
    @State private var currentDate = Date()
    @State private var currentTime = Date()

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    @State private var showSolveMathView = false
    @State private var showStepCountView = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text(dateFormatter.string(from: currentDate).uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(timeFormatter.string(from: currentDate))
                        .font(.caption)
                }
                .padding(.horizontal)
                .padding(.vertical, 1)
                .padding(.top, 6)
                
                Text("Wake Up Alarm")
                    .font(.headline)
                    .padding(.top)
                
                Text(alarmTime)
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                    .padding(.vertical, -10)
                
                HStack {
                    Image(systemName: "timer")
                        .font(.system(size: 13, weight: .light, design: .default))
                    Text("ALARM \(alarmTime)")
                        .font(.system(size: 13, weight: .light, design: .default))
                }
                .padding(.top, 1)
                
                Spacer()
                
                VStack {
                    Button {
                        showSolveMathView = true
                        
                        print("Solve Math tapped")
                    } label: {
                        Text("Solve Math")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: 170, maxHeight: 40)
                    .background(Color.green)
                    .cornerRadius(40)
                    .padding(.top, 8)
                    
                    Button {
                        showStepCountView = true
                        
                        print("Step Count tapped")
                    } label: {
                        Text("Step Count")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: 170, maxHeight: 40)
                    .background(Color.green)
                    .cornerRadius(40)
                }
                .navigationDestination(isPresented: $showSolveMathView){
                    SolveMathView()
                }
                .navigationDestination(isPresented: $showStepCountView){
                    StepCountView()
                }
                
        }
        .padding(.vertical, 45)
        .padding(.horizontal)
        .padding(.top, -15)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0/255, green: 89/255, blue: 86/255))
        .foregroundColor(.white)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
