//
//  EndAlarmView.swift
//  AMplify_Sufi_watchOS Watch App
//
//  Created by Sufi Arifin on 16/05/25.
//

import SwiftUI

struct EndAlarmView: View {
    @State private var alarmTime = "04:30"
    @State private var currentDate = "JUN 18"
    @State private var currentTime = "04:40"

    var body: some View {
        VStack {
            HStack {
                Text(currentDate)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Text(currentTime)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.vertical, 1)
            .padding(.top, -15)

            Text("Great, Sufi")
                .font(.system(size: 23, weight: .semibold, design: .rounded))
                .foregroundColor(.orange)
                .padding(.top, 3)
            
            Text("You're Awake!")
                .font(.system(size: 23, weight: .semibold, design: .rounded))
                .foregroundColor(.orange)
                .padding(.top, -12)
            
            Spacer()
            
            HStack {
                Text("+50 XP")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                
                Text("added for your")
                    .font(.system(size: 15, weight: .regular, design: .rounded))
            }
            .padding(.top, 8)
            
            Text("Punctuality!")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.white)

            Spacer()

            VStack {
                Button {
                    print("Next to Daily Routine tapped")
                } label: {
                    Text("Next to Daily Routine")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                }
                .frame(maxWidth: 170, maxHeight: 50)
                .background(Color.green)
                .cornerRadius(40)
                .padding(.top, 15)

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

struct EndAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        EndAlarmView()
    }
}
