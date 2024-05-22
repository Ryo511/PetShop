//
//  KeyIn.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/4/1.
//

import SwiftUI

struct KeyIn: View {
    let label: String
    var placeholder: String = ""
    var height: CGFloat = 200.0
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(Color(.darkGray))
            
//            TextEditor(text: $value)
//                .frame(maxWidth: .infinity)
//                .frame(height: height)
//                .padding(10)
//                .overlay(
//                RoundedRectangle(cornerRadius: 5)
//                    .stroke(Color(.systemGray5), lineWidth: 1)
//                )
            
            TextField(placeholder, text: $value)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(PlainTextFieldStyle())
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                .padding(.top, 10)
        }
    }
}

#Preview {
    KeyIn(label: "name", value: .constant(""))
}
