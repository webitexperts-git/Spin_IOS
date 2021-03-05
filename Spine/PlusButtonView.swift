//
//  PlusButtonView.swift
//  Spine
//
//  Created by apple on 24/12/20.
//

import SwiftUI


struct PlusButtonView: View {
    var body: some View {
        VStack{
//            Text("What would you like to post?").font(.system(size: 25))

                    List {
                        HStack(){
                            
                            NavigationLink(destination: PostQuestionView()){
                                Text("+")
                                    .font(.system(size: 50))
                                    .foregroundColor(Color("backColor"))
                                    .padding(.bottom, 5)
                                Text("Post a question or thought")
                            }

                        }
                        HStack(){
                            Text("+")
                                .font(.system(size: 50))
                                .foregroundColor(Color("backColor"))
                               
                                .padding(.bottom, 5)
                            Text("Post a picture or video")
                        }
                        HStack(){
                            Text("+")
                                .font(.system(size: 50)).foregroundColor(Color("backColor"))
                               
                                .padding(.bottom, 5)
                            Text("Post a story")
                        }
                      
                    }
            Spacer()
        }.navigationBarTitleDisplayMode(.inline)
        .navigationTitle("What would you like to post?")
       
       
    }
}


struct ListView:View{
    var body: some View{
        VStack(){
            NavigationView {
                List {
                    
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
            }
    }
    }
}


struct PlusButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlusButtonView()
    }
}
