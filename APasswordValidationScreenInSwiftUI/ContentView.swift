//
//  ContentView.swift
//  APasswordValidationScreenInSwiftUI
//
//  Created by enesozmus on 15.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var authVM = AuthenticationViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Password")
                            .font(.title)
                            .bold()
                        Text("Password must have more than 8 characters, contain some special character, one digit, one uppercase letter")
                            .font(.caption)
                    }
                    Group {
                        UserFormTextField(text: $authVM.password, type: .password)
                        VStack(alignment: .leading) {
                            RequirementsPickerView(type: .eightChar, toggleState: $authVM.hasEightChar)
                            RequirementsPickerView(type: .spacialChar, toggleState: $authVM.hasSpacialChar)
                            RequirementsPickerView(type: .oneDigit, toggleState: $authVM.hasOneDigit)
                            RequirementsPickerView(type: .upperCaseChar, toggleState: $authVM.hasOneUpperCaseChar)
                        }
                        UserFormTextField(text: $authVM.confirmPassword, type: .repeatPassword)
                        RequirementsPickerView(type: .confirmation, toggleState: $authVM.confirmationMatch)
                    }.padding(.vertical, 5)
                    Spacer()
                }
                .padding()
            }
            .keyboardIgnoring()
            
            Button {
                // sign up action
            } label: {
                Text("Sign Up")
                    .font(.system(size: 19.5, weight: .medium))
                
            }
            .frame(width: 300, height: 50)
            .foregroundStyle(.white)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}

#Preview {
    ContentView()
}
