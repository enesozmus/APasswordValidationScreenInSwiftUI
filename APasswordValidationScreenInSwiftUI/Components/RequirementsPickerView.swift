//
//  RequirementsPickerView.swift
//  APasswordValidationScreenInSwiftUI
//
//  Created by enesozmus on 15.06.2024.
//

import SwiftUI

enum RequirementsType {
    case eightChar, spacialChar, oneDigit, upperCaseChar, confirmation
    
    var description: LocalizedStringKey {
        switch self {
        case .eightChar:
            return "8 characters"
        case .spacialChar:
            return "One special character"
        case .oneDigit:
            return "One digit"
        case .upperCaseChar:
            return "One uppercase letter"
        case .confirmation:
            return "The password and confirmation must match"
        }
    }
}

struct RequirementsPickerView: View {
    var type: RequirementsType
    @Binding var toggleState: Bool
    
    var body: some View {
        HStack {
            Toggle("", isOn: $toggleState.animation(.easeInOut))
                .toggleStyle(CheckboxToggleStyle())
                .disabled(true)
                .frame(width: 30, height: 30)
            Text(type.description)
                .font(.headline)
            Spacer()
        }
    }
}

#Preview {
    RequirementsPickerView(type: RequirementsType.confirmation, toggleState: .constant(false))
}
