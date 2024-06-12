//
//  DiaryView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/6/8.
//

import SwiftUI

struct DiaryView: View {
    var date: Date
    @Environment(\.managedObjectContext) private var viewContext
    @State private var text: String = ""
    @State private var imageData: Data? = nil
    //    @State var selectedItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            Text("Diary")
                .font(.title)
                .padding()
            
            TextEditor(text: $text)
                .frame(height: 200)
                .border(Color.gray, width: 1)
            
            //            PhotosPicker(selection: $selectedItem) {
            //                Image(systemName: "photo")
            //                    .font(.largeTitle)
            //                    .padding()
            //            }
            //            .onChange(of: selectedItem) { newItem in
            //                Task {
            //                    guard let data = try? await newItem?.loadTransferable(type: Data.self) else { return }
            //                    imageData = data
            //                }
            //            }
            
            if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            }
            
//            Button(action: saveEntry) {
//                Text("保存")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
//            .padding()
        }
        .padding()
    }
}
//    private func saveEntry() {
//        let entry = Diary(context: viewContext)
//        entry.date = date
//        entry.text = text
//        entry.imageData = imageData
//        try? viewContext.save()
//    }
//}

#Preview {
    CalendarView()
}
