//
//  EventPostView.swift
//  Spine
//
//  Created by Aashita Tyagi on 22/02/21.
//

import SwiftUI

struct EventPostView: View {
    @State private var name: String = ""
    var body: some View {
    
        ScrollView{
                ZStack{
                Rectangle()
                    .overlay(
                        Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                        )
        //            .frame(width: 200, height: 150)
                    .frame(minWidth:0, maxWidth: .infinity, minHeight: 250, maxHeight: 250)
                    VStack{
//                    Image("camera")
                        Button(action: {
                            
                            print("Button Tapped")
                            
                        }) {
                            
//                            Text("Press Me")
                            Image("camera")
                            
                        }
                    Text("Add Photo").foregroundColor(.white).font(.subheadline)
                    }.navigationBarTitle("NEW EVENT")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding()
                    
                   
                }
        VStack(alignment:.leading){
            Text("Event Title").bold().padding()
            ZStack(alignment: .leading) {
                if name.isEmpty{
                    Text("Event Title").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("", text: $name)
                .padding(10)
                .foregroundColor(Color.black)
//                .frame(width:250.0, height: 40.0)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
            }.padding(.leading,20)
            .padding(.trailing, 20)
           
            Text("Event Type").bold().padding(.leading)
            ZStack(alignment: .leading) {
                if name.isEmpty{
                    Text("").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("Event Type", text: $name)
                .padding(10)
                .foregroundColor(Color.black)
//                .frame(width:250.0, height: 40.0)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
        }.padding(20)
            HStack(){
            Text("Start").bold().padding(.leading)
                .padding(.trailing,160)
            Text("End").bold().padding(.leading)
            }
            VStack(){
            HStack(){
            ZStack(alignment: .leading) {
                if name.isEmpty{
                    Text("").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("Event Type", text: $name)
                .padding(10)
                .foregroundColor(Color.black)
//                .frame(width:250.0, height: 40.0)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
        }.padding(20)
                
                
                ZStack(alignment: .leading) {
                    if name.isEmpty{
                        Text("").foregroundColor(.gray)
                            .padding(.bottom, 10)
                            .padding(.leading, 10)
                    }
              
                TextField("End", text: $name)
                    .padding(10)
                    .foregroundColor(Color.black)
    //                .frame(width:250.0, height: 40.0)
                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                    .padding(.bottom,10)
            }.padding(20)
            }
                
                
                HStack(){
                ZStack(alignment: .leading) {
                    if name.isEmpty{
                        Text("").foregroundColor(.gray)
                            .padding(.bottom, 10)
                            .padding(.leading, 10)
                    }
              
                TextField("Event Type", text: $name)
                    .padding(10)
                    .foregroundColor(Color.black)
    //                .frame(width:250.0, height: 40.0)
                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                    .padding(.bottom,10)
                    }.padding(20)
                    
                    
                    ZStack(alignment: .leading) {
                        if name.isEmpty{
                            Text("").foregroundColor(.gray)
                                .padding(.bottom, 10)
                                .padding(.leading, 10)
                        }
                  
                    TextField("End", text: $name)
                        .padding(10)
                        .foregroundColor(Color.black)
        //                .frame(width:250.0, height: 40.0)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                        .padding(.bottom,10)
                }.padding(20)
                }
            }
            
            
            
            
            ZStack(){
                VStack(){
                    Text("TIME ZONE").bold()
                    TextField("Time zone", text: $name)
                        .padding()
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                }
            }
        }
            Spacer()

        }
    }
}

struct EventPostView_Previews: PreviewProvider {
    static var previews: some View {
        EventPostView()
        
    }
}
