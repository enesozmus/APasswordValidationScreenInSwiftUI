//
//  UserFormTextField.swift
//  APasswordValidationScreenInSwiftUI
//
//  Created by enesozmus on 15.06.2024.
//

import SwiftUI

enum UserFormType {
    case password, repeatPassword
    
    var title: String {
        switch self {
        case .password:
            return "Password"
        case .repeatPassword:
            return "Repeat Password"
        }
    }
}

struct UserFormTextField: View {
    @FocusState private var focusedField: Field?
    
    enum Field {
        case maskedPassword
        case unmaskedPassword
    }
    @Binding var text: String
    var type: UserFormType
    @State private var isSecure = true {
        didSet {
            if isSecure {
                focusedField = .maskedPassword
            } else {
                focusedField = .unmaskedPassword
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if isSecure {
                SecureField("\(type.title)", text: $text)
                    .focused($focusedField, equals: .maskedPassword)
            } else {
                TextField("\(type.title)", text: $text)
                    .focused($focusedField, equals: .unmaskedPassword)
            }
        }
        .font(.body)
        .padding()
        .frame(maxHeight: 60)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 2)
        )
        .overlay {
            HStack {
                Spacer()
                Button("", systemImage: isSecure ? "eye.fill" : "eye.slash.fill") {
                    isSecure.toggle()
                }
                .padding(.trailing)
                .tint(.gray)
                .contentTransition(.symbolEffect(.replace))
            }
        }
        
    }
}

#Preview {
    UserFormTextField(text: .constant("default"), type: .password)
}
