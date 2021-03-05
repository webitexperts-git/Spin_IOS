//
//  PostQuestionView.swift
//  Spine
//
//  Created by Aashita Tyagi on 12/02/21.
//

import SwiftUI

struct PostQuestionView: View {
    @State var isActive = false
    var body: some View {
        
        ZStack(){
//            Color("PostColor1").edgesIgnoringSafeArea(.all)
            
            
            HStack {
                
                PageView()
            }
            
        }
    }
}



struct ColorModel: Identifiable {
    let value: Color
    let id = UUID()
}


struct PageView: View {

    let colors: [Color] = [Color("PostColor1"), Color("PostColor2"), Color("PostColor3"), Color("PostColor4")]
    let colors2:[String] = ["#B89A8A","#D7C5B9","#C86845","#2196F3"]
    @State var color1: Color = Color.red
    @Environment(\.presentationMode) var presentation
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

       var btnBack : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
        HStack(alignment: .top) {
            Image("backBtn")
                // set image here
                .resizable()
                .renderingMode(.template)
                   .foregroundColor(.white)
                .frame(width: 20, height: 20)
                   .aspectRatio(contentMode: .fit)
               
               }
           }
       }
    @State var tag:Int? = 0
//    @State private var post = ""
    @ObservedObject var userSetting = UserSetting()
    @ObservedObject var postColor = PostColor()
    @State private var placeholder = "Post a question or share what's on your mind"
//    @State var input = ""
//    @State var isEditing = false
    
    
    init() {
           UITextView.appearance().backgroundColor = .clear
       }
    
  
    var body: some View {
        ZStack(){
            
            Color("PostColor1").ignoresSafeArea(.all)
        VStack(alignment: .leading){
            TabView {
              
                       ForEach(colors2, id: \.self) { color in
                       
                        ZStack(alignment: .leading) {
                            
                            VStack(alignment: .leading){
                                HStack(alignment: .top){
                                    btnBack
                                        .padding()
                                    Spacer()
//                                    Text("Next")
                                    NavigationLink(destination: PostHashTagView()) {
                                        Text("Next")
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
                           
                        }.onAppear{
//                            UserDefaults.standard.set(UIColor(Int(rgb:color)), forKey: "postColor")
//                            let color2 = UIColor(rgb: color)
                        }
                      
//                        .background(UIColor(Int(rgb:color))).edgesIgnoringSafeArea(.all)
                       
//                           .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                       
                       }
//                       .padding(.all, 10)
//                       .edgesIgnoringSafeArea(.all)
                   }
//                   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .tabViewStyle(PageTabViewStyle())
        }.navigationBarHidden(true)
        .accentColor( .white)
//        .navigationBarColor(UIColor(color1))
            
//        .toolbar {
//            NavigationLink(destination: PostHashTagView(), tag: 1, selection: $tag) {
//                  Button("Next") {
//                      self.tag = 1
//                  }
//                        }
//        }
            
       
            
//        .navigationBarItems(trailing:
//                    NavigationLink(destination: PostHashTagView(), tag: 1, selection: $tag) {
//                          Button("Next") {
//                              self.tag = 1
//                          }
//                                }
//                   )
    
   
        }
        }
    }

     
    


struct PostQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        PostQuestionView()
    }
}
