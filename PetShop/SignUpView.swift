//
//  SignUpView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/4/3.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name: String = ""
    @State private var furigana: String = ""
    @State private var phonenumber: String = ""
    @State private var birthday: String = ""
    @State private var password: String = ""
    @State private var gender: String = "男性"
    @State private var mail: String = ""
    @Binding var showSignUpView: Bool
    let genders = ["女性", "男性", "其他"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("名前")
                .font(.system(size: 18))
            TextField("田中　太朗", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("ふりがな")
                .font(.system(size: 18))
            TextField("たなか　たろう", text: $furigana)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("誕生日")
                .font(.system(size: 18))
            TextField("2020/10/10", text: $birthday)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("メール")
                .font(.system(size: 18))
            TextField("Mail", text: $mail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("パスワード")
                .font(.system(size: 18))
            TextField("xxxxxxxx", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("電話番号")
                .font(.system(size: 18))
            TextField("070-1234-5678", text: $phonenumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("性別")
                .font(.system(size: 18))
            Picker("性別", selection: $gender) {
                ForEach(genders, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .font(.system(size: 18))
            Spacer()
            
            Button("登録") {
                
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(showSignUpView: .constant(false))
    }
}
