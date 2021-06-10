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
    @State var text = ""
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
            
            if #available(iOS 14.0, *) {
                Color("PostColor1").ignoresSafeArea(.all)
            } else {
                // Fallback on earlier versions
            }
        VStack(alignment: .leading){
            if #available(iOS 14.0, *) {
                TabView {
                    
                    ForEach(colors2, id: \.self) { color in
                        
                        ZStack(alignment: .leading) {
                            
                            let gold = UIColor(hex: color)
                            Color(gold)
                            VStack(alignment: .leading){
                                HStack(alignment: .top){
                                    btnBack
                                        .padding()
                                    Spacer()
                                    //                                    Text("Next")
                                    NavigationLink(destination: PostHashTagView(post : text)) {
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                    .padding()
                                }
                                Spacer()
                                
                                if text.isEmpty {
                                    
                                    VStack() {
                                        Text(placeholder)
                                            .font(.custom("Helvetica", size: 34))
                                            .foregroundColor(.white)
                                            .padding(.all)
                                        Spacer()
                                    }
                                    
                                }
                            }
                            
                            if #available(iOS 14.0, *) {
                                TextEditor(text: $text)
                                    .font(.custom("Helvetica", size: 34))
                                    .foregroundColor(.white)
                                    .padding(.all)
                                    .padding(.top, 50)
                            } else {
                                // Fallback on earlier versions
                            }
                            
                        }.onAppear{
                            //                            UserDefaults.standard.set(UIColor(Int(rgb:color)), forKey: "postColor")
                            //                            let color2 = UIColor(rgb: color)
                            UserDefaults.standard.set(color, forKey: "color")
                        }
                        
                        //                        .background(Color(red: 123, green: 234, blue: 123)).edgesIgnoringSafeArea(.all)
                        
                        //                           .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        
                    }
                    //                       .padding(.all, 10)
                    //                       .edgesIgnoringSafeArea(.all)
                }
                //                   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .tabViewStyle(PageTabViewStyle())
            } else {
                // Fallback on earlier versions
            }
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
