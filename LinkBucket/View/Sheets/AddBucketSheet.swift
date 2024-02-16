//
//  AddBucketSheet.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI
import SwiftData

struct AddBucketSheet: View {
    @Environment(\.modelContext) var context
    @Binding var showFolderCreationSheet: Bool
    @State var inputValue: String = ""
    @FocusState var isTextFieldFocused: Bool
    @State var showErrorAlert: Bool = false
    @Query var folders: [Folder]
    @State var alert: Alert?
    
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
                        var uniqueBucketName = true
                        for folder in folders {
                            if folder.title == inputValue{
                                uniqueBucketName = false
                            }
                        }
                        if uniqueBucketName{
                            createFolder()
                        }
                        else{
                            alert = Alert.duplicateName(folderName: inputValue)
                            showErrorAlert = true
                            inputValue = ""
                        }
                    }
                    else{
                        showErrorAlert = true
                        //TODO: SET EMPTY ALERT
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
        .alert(alert?.title ?? "", isPresented: $showErrorAlert) {
            
        } message: {
            Text(alert?.message ?? "")
        }

    }
}

#Preview {
    AddBucketSheet(showFolderCreationSheet: .constant(false))
}
