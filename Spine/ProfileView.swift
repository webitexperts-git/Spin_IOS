//
//  ProfileView.swift
//  Spine
//
//  Created by apple on 04/12/20.
//

import SwiftUI

struct ProfileView: View{
    var body: some View{
        ZStack{
            VStack(){
               
                HStack(spacing: 50){
//                    GeometryReader { geometry in
                       
                    Image("email").resizable().frame(width: 25, height: 25, alignment: .leading)
//                        .position(x: 45, y: 25)
                        Image("back").resizable().frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(80/2)
//                            .position(x: geometry.size.width/2, y: 25+20)
                        
                    Image("settings").resizable().frame(width: 25, height: 25, alignment: .trailing)
//                        .position(x: geometry.size.width-45, y: 25)
                        
//                    }
                   
                }
//                Divider()
                Spacer()
                VStack{
                Text("VIEW PROFILE")
                Divider()
               
                    HStack(spacing: 30){
                        Text("POST")
                        Text("EVENTS")
                        Text("PODCASTS")
                    }
                    Divider()
                    Spacer()
               
                }
          
        }
           
    }.navigationBarHidden(true)
   
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
