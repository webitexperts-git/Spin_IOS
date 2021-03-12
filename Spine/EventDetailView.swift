//
//  EventDetailView.swift
//  Spine
//
//  Created by Aashita Tyagi on 01/03/21.
//

import SwiftUI



struct EventDetailView: View {
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
                .foregroundColor(.black)
             .frame(width: 20, height: 20)
                .aspectRatio(contentMode: .fit)
            
            }
        }
    }
    let colors: [Color] = [Color("PostColor1"), Color("PostColor2"), Color("PostColor3"), Color("PostColor4")]
    @State private var name = ""
    @State private var placeholder = ""
    init() {
           UITextView.appearance().backgroundColor = .clear
       }
    @State var index = 0

    var images = ["back", "back", "back", "back"]
    
    var body: some View {
//        Color.red.edgesIgnoringSafeArea(.all)
        ScrollView(){
        ZStack(){
          
             
           
          
        VStack() {
            
                  PagingView(index: $index.animation(), maxIndex: images.count - 1) {
                      ForEach(self.images, id: \.self) { imageName in
                          Image(imageName)
                              .resizable()
                              .scaledToFill()
                      }
                  }
                  .aspectRatio(4/3, contentMode: .fit)
                  .clipShape(RoundedRectangle(cornerRadius: 0))
                Spacer()

//                  Stepper("Index: \(index)", value: $index.animation(.easeInOut), in: 0...images.count-1)
//                      .font(Font.body.monospacedDigit())
            ZStack(alignment: .leading){
            Rectangle()
                .fill(Color("backColor"))
                .frame(width: UIScreen.main.bounds.width, height: 360, alignment: .topLeading)
                VStack(alignment: .leading){
                    Group{
                    
                Text("LOCAL EVENT")
                    .foregroundColor(.white)
                    .font(Font.system(size: 26))
                    .padding()
                
                Text("THE TEST EVENT")
                    .foregroundColor(.white)
                    .font(Font.system(size: 30))
                    .padding()
                    HStack(){
                        Image("calendar")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading)
                        VStack(alignment:.leading){
                    Text("Wed, 10 Mar, 2021")
                        .foregroundColor(.white)
                        .font(Font.system(size: 27))
                        
                            Text("15-46-40")
                                .foregroundColor(.white)
                                .font(Font.system(size: 22))
                                
                        }
                    }
                        
                        HStack(){
                            Image("pin")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            VStack(alignment:.leading){
                        Text("LOCAL")
                            .foregroundColor(.white)
                            .font(Font.system(size: 27))
                            
                                Text("www.dpsedfrg.com")
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 22))
                                    
                            }
                        }
                        
                        
                        
                        HStack(){
                            Image("microphone")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            VStack(alignment:.leading){
                        Text("Hosted in")
                            .foregroundColor(.white)
                            .font(Font.system(size: 27))
                            
                                Text("Delhi")
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 22))
                                    
                            }
                        }
                    
                  
                    
                }
                    Spacer()
                    
                    
               
                
                }
            }
            
         
            
        }.navigationBarHidden(true)
//              .padding()
            btnBack
                .position(x: 20.0, y: 20.0)

            Text("6 \nMay")
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 100, height: 100)
                .background(Rectangle().fill(Color("backColor")).shadow(radius: 3))
                .position(x: 60.0, y: 250.0)
                .font(.title).foregroundColor(.white)
            
            }
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
