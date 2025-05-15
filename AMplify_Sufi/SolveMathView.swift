//
//  SolveMathView.swift
//  AMplify_Sufi
//
//  Created by Sufi Arifin on 11/05/25.
//

import SwiftUI

struct SolveMathView: View {
    @State private var userAnswer: String = ""
    let problemMath = "12x10+13-9 = ?"

    let tealColor = Color(red: 0/255, green: 159/255, blue: 184/255)
    let lightGrayBackground = Color(red: 0/255, green: 159/255, blue: 184/255)
    let darkGrayText = Color(red: 0/255, green: 159/255, blue: 184/255)
    
    // Function to handle number button taps
    func handleNumberTap(_ number: String) {
        userAnswer += number
    }
    
    // Function to handle delete button tap
    func handleDeleteTap() {
        if !userAnswer.isEmpty {
            userAnswer.removeLast()
        }
    }

    var body: some View {
        VStack {
            Text("POST ALARM ACTIVITY")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 40)
            
            Text("SOLVE MATH")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 115)
                .padding(.vertical, 15)
                .background(.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.top, 25)
            
            Text(problemMath)
                .font(.system(size: 46, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.top, 70)
            
            TextField("Type your answer", text: $userAnswer)
                .font(.system(size: 25, weight: .light, design: .default)).italic()
                .keyboardType(.numberPad)
                .padding(.top, 90)
                .padding(.bottom, 15)
                .padding(.horizontal, 90)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal, 40)
                        .foregroundColor(.white),
                    alignment: .bottom
                )
                .padding(.horizontal)
            
            VStack {
                HStack {
                    NumberButton(text: "1", action: { handleNumberTap("1") })
                    NumberButton(text: "2", action: { handleNumberTap("2") })
                    NumberButton(text: "3", action: { handleNumberTap("3") })
                }
                HStack {
                    NumberButton(text: "4", action: { handleNumberTap("4") })
                    NumberButton(text: "5", action: { handleNumberTap("5") })
                    NumberButton(text: "6", action: { handleNumberTap("6") })
                }
                HStack {
                    NumberButton(text: "7", action: { handleNumberTap("7") })
                    NumberButton(text: "8", action: { handleNumberTap("8") })
                    NumberButton(text: "9", action: { handleNumberTap("9") })
                }
                HStack {
                    NumberButton(text: "+*#", action: { handleNumberTap("+*#") })
                    NumberButton(text: "0", action: { handleNumberTap("0") })
                    DeleteButton(action: handleDeleteTap)
                }
            }
            .padding(.horizontal)
            .padding(.top, 55)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(lightGrayBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

// Custom button for numbers
struct NumberButton: View {
    let text: String
    let action: () -> Void
    let tealColor = Color(red: 0/255, green: 0/255, blue: 0/255)
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .frame(width: 120, height: 50)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
        }
    }
}

// Custom button for delete
struct DeleteButton: View {
    let action: () -> Void
    let tealColor = Color(red: 0/255, green: 0/255, blue: 0/255)
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "delete.left")
                .font(.title2)
                .foregroundColor(.black)
                .frame(width: 120, height: 50)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
        }
    }
}

struct SolveMathView_Previews: PreviewProvider {
    static var previews: some View {
        SolveMathView()
    }
}


