//
//  SignupView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 1/9/2022.
//

import SwiftUI

struct SignupView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var FirsName: String = "Name"
    @State private var Email: String = "wdj31104@yuoia.com"
    var language = ["French", "Arabic", "English"]
    @State  var selectedlanguage = "Arabic"
    @Binding var ShowHome : Bool
    @State var showLgn = false
    var body: some View {
        VStack{
        if showLgn == true {
            VStack{
            LogIn(ShowHome: $ShowHome)
            }
        } else {
            VStack{
                Spacer()
                ZStack{
                    if (image != nil){
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 100 )
                            .overlay(
                                    Circle()
                                        .stroke(.white, lineWidth: 7)
                                )
                            .clipShape(Circle())
                            .shadow(radius: 40)
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .offset(x:35,y:40)
                    } else {
                        Image("default-avatar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 100 )
                            .clipShape(Circle())
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .offset(y:40)
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 100 )
                            .clipShape(Circle())
                            .border(.green)
                            .shadow(radius: 40)
                    }
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                VStack{
                    
               Form{
                    Section("name"){
                    TextField("Name" , text: $FirsName)
                        .font(.system(size: 15 , weight: .bold))
                    }
                    Section(header:Text("Email")){
                        TextField("email" , text: $Email)
                    }
                    Section("language"){
                        Picker("Please choose a language", selection: $selectedlanguage) {
                                ForEach(language, id: \.self) {
                                            Text($0)
                                      }
                                    }
                    }
                }
                    Button{
                        withAnimation{
                        ShowHome.toggle()
                        }
                       print("reds")
                    } label: {
                        Text("Sign up")
                            .bold()
                            .font(.title3)
                            .frame(width: 330, height: 50)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(25)
                    }
                    Button{
                        withAnimation{
                        showLgn.toggle()
                        }
                    } label: {
                        Text("I ALREADY HAVE AN ACCOUNT")
                            .bold()
                            .font(.title3)
                            .frame(width: 330, height: 50)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(25)
                    }
                }
                }
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
                
            }
        }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(  ShowHome: .constant(true))
    }
}
