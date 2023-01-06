//
//  Profile.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
//

import SwiftUI
import CoreImage

struct Profile: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var FirsName: String = "Name"
    @State private var Email: String = "wdj31104@yuoia.com"
    var language = ["French", "Arabic", "English"]
    @State  var selectedlanguage = "Arabic"
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView{
            VStack{
                
            }
            /*VStack{
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
                    viewModel.logout()
                } label: {
                    Text("Edit")
                        .bold()
                        .font(.title3)
                        .frame(width: 350, height: 40)
                        .foregroundColor(.white)
                }
                .background(Color.green)
                .cornerRadius(10)
                Spacer()
                
                }*/
           // .onChange(of: inputImage) { _ in loadImage() }
            //.sheet(isPresented: $showingImagePicker) {
                //ImagePicker(image: $inputImage)
        
           // }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}



