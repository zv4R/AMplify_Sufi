//
//  StepCountView.swift
//  AMplify_Sufi
//
//  Created by Sufi Arifin on 12/05/25.
//


import SwiftUI

struct StepCountView: View {
    // Custom colors
    let tealColor = Color(red: 52/255, green: 211/255, blue: 153/255)
    let lightGrayBackground = Color(red: 0/255, green: 159/255, blue: 184/255)
    let darkGrayText = Color(red: 142/255, green: 142/255, blue: 147/255)
    
    // Sample data
    @State private var steps: Int = 50
    let goal: Int = 750
    let distance: Double = 0.50
    let timerString = "00.05.00"
    
    var body: some View {
        VStack {
            Text("POST ALARM ACTIVITY")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 40)
            
            Text("STEP COUNT")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 115)
                .padding(.vertical, 15)
                .background(.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.top, 25)
            HStack (alignment: .lastTextBaseline){
                Image(systemName: "timer")
                    .foregroundColor(.white)
                Text("TIMER : \(timerString)")
                                .font(.system(size: 20, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.top, 30)
            }
            
            // Circular progress indicator
            ZStack {
                Circle()
                    .stroke(lineWidth: 45)
                    .foregroundColor(.white.opacity(0.2))
                    .frame(width: 200, height: 200)
                    .padding(.top, 30)
                
                let progress = Double(steps) / Double(goal)
                Circle()
                    .trim(from: 0, to: CGFloat(progress))
                    .stroke(style: StrokeStyle(lineWidth: 45, lineCap: .round))
                    .foregroundColor(.orange)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .padding(.top, 30)
                
                VStack {
                    Text("\(steps)")
                        .font(.system(size: 70, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, -95)
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                // Add the down arrow image
                //Image(systemName: "arrow.down")
                .foregroundColor(.white) // White arrow
                .font(.system(size: 24)) // Adjust size as needed
                .offset(x: 0, y: 70) // Position it
            }
            .padding()
            
                VStack(alignment: .leading) {
                    Text("Activity")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 8)
                        .padding(.top, 15)
                    
                    VStack (spacing: 8){
                        HStack (alignment: .lastTextBaseline) {
                            Text("Goals")
                                .font(.system(size: 23, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                            Text("\(goal)")
                                .font(.system(size: 23, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                        }
                        HStack (alignment: .lastTextBaseline){
                            Text("Steps")
                                .font(.system(size: 23, weight: .medium, design: .rounded))
                                .foregroundColor(.orange)
                            Spacer()
                            Text("\(steps)")
                                .font(.system(size: 23, weight: .medium, design: .rounded))
                                .foregroundColor(.orange)
                        }
                        HStack (alignment: .lastTextBaseline){
                            Text("Distance")
                                .font(.system(size: 23, weight: .medium, design: .rounded))
                                .foregroundColor(.white.opacity(0.6))
                            Spacer()
                            Text("\(distance, specifier: "%.2f") KM")
                                .font(.system(size: 23, weight: .medium, design: .rounded))
                                .foregroundColor(.white.opacity(0.6))
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, -5)
                    Spacer()
                }
                .background(RoundedRectangle(cornerRadius: 0).fill(.opacity(0.5)))
                .padding(.top, 50)
        }
        //.navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(lightGrayBackground)
        .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    struct StepCountView_Previews: PreviewProvider {
        static var previews: some View {
            StepCountView()
        }
    }

