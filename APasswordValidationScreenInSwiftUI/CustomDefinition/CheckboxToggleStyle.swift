//
//  CheckboxToggleStyle.swift
//  APasswordValidationScreenInSwiftUI
//
//  Created by enesozmus on 15.06.2024.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(configuration.isOn ? .blue : .white)
            .overlay {
                if !configuration.isOn {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 5)
                }
            }
            .cornerRadius(8)
            .onTapGesture {
                configuration.isOn.toggle()
            }
    }
}
