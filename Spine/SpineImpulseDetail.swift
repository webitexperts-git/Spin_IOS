//
//  SpineImpulseDetail.swift
//  Spine
//
//  Created by apple on 04/12/20.
//

import SwiftUI



struct Impulse: Identifiable {
    var id = UUID()
    var name: String
    var day: String

}

struct ImpulseRow: View {
    var impulse: Impulse
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 20) {
               
                HStack{
                Image("back") .resizable().frame(width: 80, height: 80)
                .cornerRadius(80/2)
                    .padding(.leading,5)
                Text(impulse.name).font(.subheadline).foregroundColor(.black)
                Text(impulse.day).font(.subheadline).foregroundColor(.gray)
                }
                
                VStack{
                
                Rectangle()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, maxHeight: 150, alignment: .topLeading)
//                    VStack{
                    Text("SPINE").foregroundColor(.white).font(.title2)
                    Text("the Spiritual Network").foregroundColor(.white).font(.subheadline)
//                    }
                }.overlay(
                    LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(.all)
                )
                HStack{
                    Image("heart").resizable().frame(width: 20, height: 20)
                    Text("322").foregroundColor(.gray).font(.system(size: 12))
                    Image("message").resizable().frame(width:20, height: 20)
                    Text("18").foregroundColor(.gray).font(.system(size: 12))
                    Image("curved-arrow").resizable().frame(width:20, height: 20)
                        .padding(.trailing, 150)
                    Image("bookmark").resizable().frame(width:20, height: 20)
                    Image("menu").resizable().frame(width:20, height: 20)
                }
            }
        }
            Spacer()
        }
    }


struct SpineImpulseDetail: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let hikingTrails = [
        Impulse(name: "Stanford Dish", day: "2 days"),
        Impulse(name: "Stanford Dish", day: "2 days"),
        Impulse(name: "Stanford Dish", day: "2 days"),
        Impulse(name: "Stanford Dish", day: "2 days"),
        Impulse(name: "Stanford Dish", day: "2 days"),
       ]
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack(alignment:.leading){
            Button(action: { self.mode.wrappedValue.dismiss() })
                   { Text("fghfghfgh") }
            Image("backBtn").resizable().frame(width: 25, height: 25).padding()
            
            List(hikingTrails) { impulse in
            ImpulseRow(impulse: impulse)
            }.frame(minWidth:0, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
            
        }.navigationBarHidden(true)
        Spacer()

        }
}

struct SpineImpulseDetail_Previews: PreviewProvider {
    static var previews: some View {
        SpineImpulseDetail()
    }
}
