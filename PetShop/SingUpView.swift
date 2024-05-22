//
//  SingUpView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/4/3.
//

import SwiftUI

struct SingUpView: View {
    
    @State private var name: String = ""
    @State private var katakana: String = ""
    var body: some View {
        VStack {
            TextField("名前", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

#Preview {
    SingUpView()
}
