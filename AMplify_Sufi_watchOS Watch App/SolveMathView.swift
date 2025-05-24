//
//  SolveMathView.swift
//  AMplify_Sufi_watchOS Watch App
//
//  Created by Sufi Arifin on 15/05/25.
//

import SwiftUI

struct SolveMathView: View {
    @State private var currentDate = Date()
    @State private var currentTime = "04:35"
    @State private var mathProblem = "12x10+13-9=?"
    @State private var enteredNumbers: [String] = [] // Array to hold entered digits
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

    // Computed property to display the entered number string
    private var displayedAnswer: String {
        enteredNumbers.joined()
    }
    
    var body: some View {
        VStack {
            HStack {
                //Text(dateFormatter.string(from: currentDate).uppercased())
                    //.font(.caption)
                    //.foregroundColor(.gray)
                Spacer()
                Text(timeFormatter.string(from: currentDate))
                    .font(.caption)
            }
            .padding(.horizontal)
            .padding(.vertical, 1)
            .padding(.top, -3)
            
            Text(mathProblem)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .padding(.horizontal)
                .padding(.top, -1)
            
            // Display the entered answer
            Text(displayedAnswer)
                .font(.system(size: 20, weight: .light, design: .rounded))
                .frame(width: 80, height: 35, alignment: .center)
                .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                        .offset(y: 15)
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .padding(.top, -5)
                .padding(.bottom, -5)
            // Custom number pad
            VStack {
                HStack {
                    NumberButton(number: "1", enteredNumbers: $enteredNumbers)
                    NumberButton(number: "2", enteredNumbers: $enteredNumbers)
                    NumberButton(number: "3", enteredNumbers: $enteredNumbers)
                    NumberButton(number: "4", enteredNumbers: $enteredNumbers)
                }
                .frame(width: 180, height: 35, alignment: .center)
                .padding(.bottom, -2)
                .padding(.top, -2)
                .cornerRadius(0)
                HStack {
                    NumberButton(number: "5", enteredNumbers: $enteredNumbers)
                    NumberButton(number: "6", enteredNumbers: $enteredNumbers)
                    NumberButton(number: "7", enteredNumbers: $enteredNumbers)
                    NumberButton(number: "8", enteredNumbers: $enteredNumbers)
                }
                .frame(width: 180, height: 35)
                .padding(.bottom, -2)
                .padding(.top, -2)
                .cornerRadius(0)
                HStack {
                    NumberButton(number: "9", enteredNumbers: $enteredNumbers)
                    NumberButton(number: "0", enteredNumbers: $enteredNumbers)
                    NumberButton(number: ".", enteredNumbers: $enteredNumbers)
                    DeleteButton(enteredNumbers: $enteredNumbers)
                }
                .frame(width: 180, height: 35)
                .padding(.bottom, -2)
                .padding(.top, -2)
                .cornerRadius(0)
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .padding(.top)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0/255, green: 89/255, blue: 86/255))
        .foregroundColor(.white)
    }
    
    // MARK: - Number Button
    struct NumberButton: View {
        let number: String
        @Binding var enteredNumbers: [String]
        var body: some View {
            Button {
                enteredNumbers.append(number)
            } label: {
                Text(number)
                    .font(.system(size: 25, weight: .medium, design: .rounded))
                    .frame(width: 35, height: 35)
                    .background(Color.gray.opacity(0.01))
                    .cornerRadius(0)
                    .foregroundColor(.white)
            }
        }
    }
    
    // MARK: - Delete Button
    struct DeleteButton: View {
        @Binding var enteredNumbers: [String]
        var body: some View {
            Button {
                enteredNumbers.removeLast()
            } label: {
                Image(systemName: "delete.left")
                    .font(.system(size: 20))
                    .frame(width: 35, height: 35)
                    .background(Color.gray.opacity(0.01))
                    .cornerRadius(0)
                    .foregroundColor(.white)
            }
        }
    }
}
    // MARK: - Preview
    struct MathView_Previews: PreviewProvider {
        static var previews: some View {
            SolveMathView()
        }
    }
