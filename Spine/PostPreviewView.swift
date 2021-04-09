//
//  PostPreviewView.swift
//  Spine
//
//  Created by Aashita Tyagi on 24/02/21.
//

import SwiftUI

struct PostPreviewView: View {
    @State var postPreview = ""
    @State var hashTag = ""
   
    var body: some View {
        
        ZStack(){
//            Color.green.edgesIgnoringSafeArea(.all)
            
            
            VStack {
                PageView1(postPreview1: $postPreview, hashTag1: $hashTag)
            }
            
        }
    }
}



struct PageView1: View {
    
    @Binding var postPreview1: String
    @Binding var hashTag1: String
    @State private var advertising = false
    var advertise = false
    @State var tag:Int? = nil
    @Environment(\.presentationMode) var presentation
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   
       var btnBack : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
        HStack(alignment: .top) {
               Image("backBtn") // set image here
                .resizable()
                .renderingMode(.template)
                   .foregroundColor(.white)
                .frame(width: 20, height: 20)
                   .aspectRatio(contentMode: .fit)
               
               }
           }
       }

//    @State private var post = ""
    @ObservedObject var userSetting = UserSetting()
    @ObservedObject var postModel = PostPreviewViewModel()
    @State private var placeholder = "Post a question or share what's on your mind"
    
//    init() {
//           UITextView.appearance().backgroundColor = .clear
//       }
    
  
    var body: some View {
        
        ZStack(){
            let color = UserDefaults.standard.color(forKey: "postColor")
            let _ = print("color",color)
            Color(color!).ignoresSafeArea(.all)
//            ZStack(alignment: .leading) {
                
                VStack(alignment: .leading){
                    HStack(alignment: .top){
                        btnBack
                            .padding()
                        Spacer()
//                                    Text("Next")
                        NavigationLink(destination: Home(), isActive: .constant($postModel.woofUrl.wrappedValue != false)) {
                            Text("Post")
                                .foregroundColor(.white)
                                .bold()
                            }.onAppear(perform: getPostData)
                            .padding()
                    }
                    
                    Text(postPreview1)
                        .font(.custom("Helvetica", size: 24))
                        .foregroundColor(.white)
                        .padding(.all)
                
                
                Text(hashTag1)
                    .font(.custom("Helvetica", size: 24))
                    .foregroundColor(.white)
                    .padding(.all)
                    
                    HStack(alignment: .center){
//                        Text("Do you wish to advertise your post?")
//                            .multilineTextAlignment(.leading)
                        Spacer()
                        
                        Toggle("Do you wish to advertise your post?", isOn: $advertising).foregroundColor(.white)
                            .padding(.trailing, 20)
                            .toggleStyle(SwitchToggleStyle(tint: .white))

                                   if advertising {
                                      
                                    
                                   }
                        
                    }
                    HStack(){
                        Button(action:{
                            
                        }){
                            Text("Delete")
                                .foregroundColor(.white)
                        }.padding()
                        Spacer()
                        Button(action:{
                            
                        }){
                            Text("Preview")
                                .foregroundColor(.white)
                        }.padding()
                        
                    }
                    
                    Spacer()
                    
                

//                    if postPreview1.isEmpty {
//
//                        VStack() {
//                           Text(placeholder)
//                            .font(.custom("Helvetica", size: 34))
//                            .foregroundColor(.white)
//                            .padding(.all)
//                           Spacer()
//                        }
//
//                    }
                    
                   
                }
//
//                TextEditor(text: $postPreview1)
//                    .font(.custom("Helvetica", size: 34))
//                    .foregroundColor(.white)
//                    .padding(.all)
//                    .padding(.top, 50)
                    
          
               
//            }
            
//            .background(Color.red).edgesIgnoringSafeArea(.all)
               .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            
//            .onDisappear{
//                UserDefaults.standard.setValue(nil, forKey: "postColor")
//            }
            
            Spacer()
           
        }.navigationBarHidden(true)
//        .toolbar {
//            NavigationLink(destination: PostPreviewView(), tag: 1, selection: $tag) {
//                  Button("Post") {
//                      self.tag = 1
//                  }
//                        }
//        }

                   }
    func getPostData(){
        postModel.getPostData(title: postPreview1, hashTag:hashTag1)
        
    }
          
        }
//        .navigationBarColor(.green)
       
    
   
          
        
    

     
    


struct PostPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PostPreviewView()
    }
}
