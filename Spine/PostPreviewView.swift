//
//  PostPreviewView.swift
//  Spine
//
//  Created by Aashita Tyagi on 24/02/21.
//

import SwiftUI

struct PostPreviewView: View {
    
    var body: some View {
        
        ZStack(){
//            Color.green.edgesIgnoringSafeArea(.all)
            
            
            VStack {
                PageView1()
            }
            
        }
    }
}



struct PageView1: View {

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
    
    init() {
           UITextView.appearance().backgroundColor = .clear
       }
    
  
    var body: some View {
        
        ZStack(){
            let color = UserDefaults.standard.color(forKey: "postColor")
            let _ = print("color",color)
            Color(color!).ignoresSafeArea(.all)
            ZStack(alignment: .leading) {
                
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
                            }
                            .padding()
                    }
                    Spacer()

                    if userSetting.post.isEmpty {
                        
                        VStack() {
                           Text(placeholder)
                            .font(.custom("Helvetica", size: 34))
                            .foregroundColor(.white)
                            .padding(.all)
                           Spacer()
                        }

                    }
                }
                
                TextEditor(text: $userSetting.post)
                    .font(.custom("Helvetica", size: 34))
                    .foregroundColor(.white)
                    .padding(.all)
                    .padding(.top, 50)
            }
            .onAppear(perform: getPostData)
//            .background(Color.red).edgesIgnoringSafeArea(.all)
               .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            
//            .onDisappear{
//                UserDefaults.standard.setValue(nil, forKey: "postColor")
//            }
           
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
        postModel.getPostData()
        
    }
          
        }
//        .navigationBarColor(.green)
       
    
   
          
        
    

     
    


struct PostPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PostPreviewView()
    }
}
