//
//  TextField.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/3/15.
//

import SwiftUI

protocol TextFielddata {
    var text: String { get set }
}

struct TextField: View, TextFielddata {
    @State var text: String = ""
    
    var body: some View {
        TextField("hello", text: text)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct TextFielddata: PreviewProvider {
    static var previews: some View {
        CustomTextField()
    }
}
