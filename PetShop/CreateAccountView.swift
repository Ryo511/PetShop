//
//  CreateAccountView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/3/5.
//

import SwiftUI

struct CreateAccountView: View {
    
    @Binding var name: String
    @Binding var phonenumber: String
    @Binding var birthday: String
    @Binding var address: String
    @Binding var save: Bool
    
    var body: some View {
        NavigationStack {
                VStack {
                 
                        Text("名前：")
                            .font(.system(size: 18))
                        TextField("例：田中　太朗", text: $name)
                    
                    
                    HStack {
                        Text("電話番号：")
                            .font(.system(size: 18))
                        TextField("例：070 - 1234 - 5678", text: $phonenumber)
                    }
                    
                    HStack {
                        Text("生年月日：")
                            .font(.system(size: 18))
                        TextField("例：1990 / 12 / 25", text: $birthday)
                    }
                    
                    HStack {
                        Text("住所：")
                            .font(.system(size: 18))
                        TextField("例：東京都新宿区歌舞伎町 1-2-3", text: $address)
                    }
                    Spacer()
                    
                    Button("登録") {
                        save = true
                    }
                    .padding()
                }
                .navigationTitle("新規登録")
                .padding(.leading)
            }
        }
    }



struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(name: .constant(""), phonenumber: .constant(""), birthday: .constant(""), address: .constant(""), save: .constant(false))
    }
}
