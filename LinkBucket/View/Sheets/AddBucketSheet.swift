//
//  AddBucketSheet.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI

struct AddBucketSheet: View {
    @Environment(\.modelContext) var context
    @Binding var showFolderCreationSheet: Bool
    @State var inputValue: String = ""
    @FocusState var isTextFieldFocused: Bool
   
    
    private func createFolder(){
        let folder = Folder(title: inputValue, links: [])
        context.insert(folder)
        inputValue = ""
        showFolderCreationSheet = false
    }
    
    var body: some View {
        VStack{
            HStack{
                Button(role: .destructive,action: {
                    showFolderCreationSheet = false
                }, label: {
                    Text("Cancel")
                })
                Spacer()
                Text("Create Bucket")
                    .font(.title3)
                    .bold()
                Spacer()
                Button(action: {
                    if !inputValue.isEmpty{
                        createFolder()
                    }
                    else{
                        //TODO: Avoid creating empty folder names
                    }
                }, label: {
                   Text("Done")
                })
            }
            Spacer()
            Image(systemName: "folder.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 240)
                .foregroundStyle(.folder)
                .padding(.bottom,4)
            TextField("Enter the bucket name",text: $inputValue)
                .focused($isTextFieldFocused)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .onAppear{
            isTextFieldFocused = true
        }
    }
}

#Preview {
    AddBucketSheet(showFolderCreationSheet: .constant(false))
}
