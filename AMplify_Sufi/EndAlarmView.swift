//
//  EndAlarmView.swift
//  AMplify_Sufi
//
//  Created by Sufi Arifin on 16/05/25.
//

import SwiftUI

struct EndAlarmView: View {
    let dates = ["16", "17", "18", "19", "20"]
    @State private var selectedDateIndex = 2 // Index for "18 FRI"
    let alarmTime = "04.40"

    let tealColor = Color(red: 0/255, green: 159/255, blue: 184/255)
    let lightGrayBackground = Color(red: 255/255, green: 255/255, blue: 255/255)
    let darkGrayText = Color(red: 0/255, green: 159/255, blue: 184/255)

    // Computed property for formatted alarm time text
      private var formattedAlarmTime: some View {
          let components = alarmTime.split(separator: ".")
          let hour = String(components.first ?? "00")
          let minute = String(components.last ?? "00")

          return HStack(spacing: 0) {
              Text(hour)
                  .font(.system(size: 90, weight: .bold, design: .rounded))
                  .foregroundColor(.black)
              Text(".")
                  .font(.system(size: 90, weight: .bold, design: .rounded))
                  .foregroundColor(.black)
              Text(minute)
                  .font(.system(size: 90, weight: .bold, design: .rounded))
                  .foregroundColor(.black)
          }
      }


    var body: some View {
        VStack {
            Text("WAKE UP ALARM")
                .font(.headline)
                .foregroundColor(tealColor)
                .padding(.top, 40)

            HStack {
                ForEach(0..<dates.count, id: \.self) { index in
                    Button(action: {
                        selectedDateIndex = index
                    }) {
                        Text(dates[index])
                            .font(.system(size: selectedDateIndex == index ? 28 : 20, weight: selectedDateIndex == index ? .bold : .regular))
                            .foregroundColor(selectedDateIndex == index ? .black : .black)
                            .frame(width: selectedDateIndex == index ? 75 : 65, height: selectedDateIndex == index ? 75 : 55 )
                            .background(selectedDateIndex == index ? .orange : .orange.opacity(0.55))
                            .clipShape(Circle())
                    }
                }
            }
            .padding()

            formattedAlarmTime
             .padding(.top, 100)
             .padding(.bottom, 8)

            HStack {
                Image(systemName: "alarm")
                    .foregroundColor(darkGrayText)
                Text("ALARM \(alarmTime)")
                    .font(.system(size: 20))
                    .foregroundColor(darkGrayText)
            }
            .padding(.bottom, 70)

            VStack(spacing: 20) {
                Text("Great, Sufi")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.orange)
                    .padding(.top, -10)
                
                Text("You're Awake!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.orange)
                    .padding(.top, -23)
                
                HStack {
                    Text("+50 XP")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(tealColor)
                    
                    Text("added for your")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(tealColor)
                }
                Text("Punctuality!")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(tealColor)
                    .padding(.top, -20)
                
                Button(action: {
                    // Action for Next Daily Routine
                    print("Next to Daily Routines tapped")
                }) {
                    Text("Next to Daily Routines")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 70)
                        .background(tealColor)
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                        .padding(.top, -1)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)

            Spacer() // Pushes content to the top
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(lightGrayBackground) // Use custom light gray
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct EndAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        EndAlarmView()
    }
}

