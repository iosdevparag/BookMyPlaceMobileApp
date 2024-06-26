//
//  CustomTextFieldView.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 22/03/24.
//

import SwiftUI

struct CustomTextFieldView: View{
    
    @Binding var data: String
    var title: String?
    @State var isTextFieldValid : Bool = true

    
    var body : some View {
        VStack(alignment: .leading) {

            ZStack {
                TextField("", text: $data, onEditingChanged: { (isChanged) in
                    if(!isChanged){
                        if TextFieldIsNotEmpty(self.data)
                        {
                            isTextFieldValid = true
                        }else{
                            isTextFieldValid = false
                        }
                    }
                    
                })
                .padding(.horizontal, 10)
                .frame(height: 55)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                
                HStack {
                    Text(title ?? "Input")
                        .font(.headline)
                        .fontWeight(.thin)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(4)
                        .background(.white)
                    
                    Spacer()
                }
                .padding(.leading, 19)
                .offset(CGSize(width: 0, height: -28))
            }.padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
            if !self.isTextFieldValid {
                Text("\(title ?? "") is Not Valid")
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .font(.callout)
                    .foregroundColor(Color.red)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 10))
            }
        }
    }
    
    
    func TextFieldIsNotEmpty(_ string : String) -> Bool {
        if(string.isEmpty){
            return false
        }
        return true
    }
}


/**
 Custom Text Field for password
 */
struct CustomSecuredTextField: View{
    
    @Binding var data: String
    var title: String?
    @State var isTextFieldValid : Bool = true
    @State var isPasswordVisible : Bool = false
    @State private var isEditing : Bool = false
    
    var body : some View {
        VStack(alignment: .leading) {

            ZStack {
                if isPasswordVisible {
                    
                    TextField("", text: $data, onEditingChanged: { (isChanged) in
                        if(!isChanged){
                            if TextFieldIsNotEmpty(self.data)
                            {
                                isTextFieldValid = true
                            }else{
                                isTextFieldValid = false
                            }
                        }
                        
                    })
                    .padding(.horizontal, 10)
                    .disableAutocorrection(true)
                    .frame(height: 55)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                            .stroke(Color.gray, lineWidth: 0.5))
                    
                }else {
                    SecureField("", text: $data, onCommit: { isEditing = false
                    }  )
                    .onTapGesture {
                        isEditing = true
                    }
                        .padding(.horizontal, 10)
                        .disableAutocorrection(true)
                        .frame(height: 55)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                }
               
                
                
                HStack {
                    Text(title ?? "Input")
                        .font(.headline)
                        .fontWeight(.thin)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(4)
                        .background(.white)
                    Spacer()
                }
                .padding(.leading, 19)
                .offset(CGSize(width: 0, height: -28))
            }.padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                .overlay( alignment: .trailing){
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 20))
                        .onTapGesture {
                            isPasswordVisible.toggle()
                        }
                }
            if !self.isTextFieldValid {
                Text("\(title ?? "") is Not Valid")
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .font(.callout)
                    .foregroundColor(Color.red)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 10))
            }
        }
    }
    
    
    func TextFieldIsNotEmpty(_ string : String) -> Bool {
        if(string.isEmpty){
            return false
        }
        return true
    }
}
