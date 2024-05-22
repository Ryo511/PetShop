//
//  SettingView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/3/5.
//

import SwiftUI

    struct SettingView: View {
        @State private var mail: String = ""
        @State private var password: String = ""
        @State private var isLoggedIn: Bool = false //登入
        @State private var showSignUpView: Bool = false //新用戶註冊介面

        var body: some View {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()

                TextField("メール", text: $mail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("パスワード", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("登録") {
        
                    if mail == "admin" && password == "password" {
                        isLoggedIn = true
                    }
                }
                .padding()

                if isLoggedIn {
                    Text("Logged In as \(mail)")
                        .foregroundColor(.green)
                        .padding()
                } else {
                    Text("パスワード忘れた？")
                        .foregroundColor(.red)
                        .padding()

                    Button("新規登録") {
                        showSignUpView = true
                    }
                    .padding()
                    .sheet(isPresented: $showSignUpView) {
                        SignUpView(showSignUpView: $showSignUpView)
                    }
                }
            }
            .padding()
        }
    }
        

#Preview {
    SettingView()
}
