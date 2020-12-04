//
//  EventView.swift
//  Spine
//
//  Created by apple on 04/12/20.
//

import SwiftUI


struct ButtonView: View {
    @State var label: String
    
//    private let triathlonSports = ["You", "Following"]
    
    var body: some View {
        ZStack {
//            Circle()
//                .fill(Color.yellow)
//                .frame(width: 70, height: 70)
//            Text(label)
            HStack(){
            NavigationLink(destination: Home()){
                Text("All").padding()
//                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                    .background(Color.white)
                    .cornerRadius(18)
                    .shadow(radius: 5)
//                    .padding()
                
            }
            NavigationLink(destination: Home()){
                Text("Nearby").padding()
//                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                    .background(Color.white)
                    .cornerRadius(18)
                    .shadow(radius: 5)
//                    .padding()
                
            }
                NavigationLink(destination: Home()){
                    Text("Online").padding()
    //                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                        .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                        .background(Color.white)
                        .cornerRadius(18)
                        .shadow(radius: 5)
    //                    .padding()
                    
                }
                
                NavigationLink(destination: Home()){
                    Text("Following").padding()
    //                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                        .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                        .background(Color.white)
                        .cornerRadius(18)
                        .shadow(radius: 5)
    //                    .padding()
                    
                }
            }
        }
    }
}



struct Event: Identifiable {
    var id  = 2
    var retreat : String
    var des: String
    var city: String
    var state: String
    var name: String
    var day : String
    
}

struct EventRow: View {
    var event: Event
    
    var body: some View {
       
            VStack(alignment: .leading, spacing: 20) {
                Text("SAT, 9 MAY 2020")
                Divider()
                HStack{
                    
                Image("back") .resizable().frame(width: 80, height: 80)
                .cornerRadius(80/2)
                    .padding(.leading,5)
                    VStack(alignment: .leading){
                        HStack(spacing:160){
                            Text(event.retreat).font(.subheadline).foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255)).bold()
                            Image("bookmark").resizable().frame(width: 25, height: 25, alignment: .trailing)
                        }
                       
                        Text(event.des).font(.subheadline).foregroundColor(.black)  .lineLimit(2)
                        HStack{
                            Text(event.city).font(.subheadline).foregroundColor(.gray)
                            Text(event.state).font(.subheadline).foregroundColor(.gray)
                        }
                        HStack(spacing: 180){
                            Text(event.day).font(.subheadline).foregroundColor(.black)
                            Text("$75").font(.subheadline).foregroundColor(.black)
                        }
                       
                    }
                    
                }
                Text(event.name).font(.subheadline).foregroundColor(.black).padding(.leading, 20)

//                HStack{
//
//                }
            }
            Spacer()
        }
    }


struct EventView:View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var favoriteColor = 0
    
    let hikingTrails = [
        Event(retreat: "RETREATE", des: "Yoga Weekend Retreat - Reclaiming Your Center", city: "Mandrid", state: "Spain", name: "Oliver", day: "2 days"),
        Event(retreat: "RETREATE", des: "Yoga Weekend Retreat - Reclaiming Your Center", city: "Mandrid", state: "Spain", name: "Oliver", day: "2 days"),
        Event(retreat: "RETREATE", des: "Yoga Weekend Retreat - Reclaiming Your Center", city: "Mandrid", state: "Spain", name: "Oliver", day: "2 days"),
        Event(retreat: "RETREATE", des: "Yoga Weekend Retreat - Reclaiming Your Center", city: "Mandrid", state: "Spain", name: "Oliver", day: "2 days"),
        Event(retreat: "RETREATE", des: "Yoga Weekend Retreat - Reclaiming Your Center", city: "Mandrid", state: "Spain", name: "Oliver", day: "2 days")
       ]
    var body: some View{
        VStack(alignment: .leading) {
            HStack {

                Button(action: {

                }) {
                    Text("+")

                        .frame(width: 40, height: 40)
                        .font(.system(size: 50))
                        .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))

                }.padding(.bottom, 10)

                HStack {

                    Image(systemName: "magnifyingglass")
                    TextField("Search Spine", text: $searchText, onEditingChanged: { isEditing in
                                   self.showCancelButton = true
                               }, onCommit: {
                                   print("onCommit")
                               }).foregroundColor(.primary)

                               Button(action: {
                                   self.searchText = ""
                               }) {
                                   Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                               }
                           }
                           .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                           .foregroundColor(.secondary)
                           .background(Color(.secondarySystemBackground))
                           .cornerRadius(10.0)

                           if showCancelButton  {
                               Button("Cancel") {
//                        UIApplication.shared.endEditing(true)
                                // this must be placed before the other commands here
                                       self.searchText = ""
                                       self.showCancelButton = false
                               }
                               .foregroundColor(Color(.systemBlue))
                           }

                       }
                       .padding(.horizontal)
                       .navigationBarHidden(showCancelButton)

            
            
//                 Divider()
                 ScrollView(.horizontal) {
                     HStack(spacing: 10) {
//                         ForEach(0..<10) { index in
//                             CircleView(label: "\(index)")
//                         }
                        ButtonView(label: " ")
                     }.padding()
                 }.frame(height: 60)
                 Divider()
                 Spacer()
            
            
            
            List(hikingTrails) { event in
            EventRow(event: event)
            }
             }.navigationBarHidden(true)
    }
}


struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
