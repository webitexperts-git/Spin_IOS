//
//  Home.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI



struct Trail: Identifiable {
    var id = UUID()
    var name: String
    var day: String

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
                        HStack(spacing:180){
                            Text(event.retreat).font(.subheadline).foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255)).bold()
                            Image("bookmark").resizable().frame(width: 25, height: 25, alignment: .trailing)
                        }
                       
                        Text(event.des).font(.subheadline).foregroundColor(.black)  .lineLimit(2)
                        HStack{
                            Text(event.city).font(.subheadline).foregroundColor(.gray)
                            Text(event.state).font(.subheadline).foregroundColor(.gray)
                        }
                        HStack(spacing: 200){
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



struct TrailRow: View {
    var trail: Trail
    
    var body: some View {
       
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                Image("back") .resizable().frame(width: 80, height: 80)
                .cornerRadius(80/2)
                    .padding(.leading,5)
                Text(trail.name).font(.subheadline).foregroundColor(.black)
                Text(trail.day).font(.subheadline).foregroundColor(.gray)
                }
                Image("back").resizable().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: .topLeading)
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
            Spacer()
        }
    }


struct SpineRect: View{
    var body: some View{
        ZStack{
        Rectangle()
            .frame(width: 200, height: 150)
            VStack{
            Text("SPINE").foregroundColor(.white).font(.title2)
            Text("the Spiritual Network").foregroundColor(.white).font(.subheadline)
            }
        }.overlay(
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
        
    }
}

struct SpineImpulse: View{
    var body: some View{
        ZStack{
        Rectangle()
            .frame(width: 200, height: 300)
            VStack{
                Circle().strokeBorder(Color.white,lineWidth: 4)
                .frame(width: 80, height: 80)
                    .padding()
            Text("Wenig Liebe fdrf fgtg gtht").foregroundColor(.white).font(.title2)
                .multilineTextAlignment(.center)
                .lineLimit(5)
                .frame(width: 180)
                .padding(.bottom, 30)
                
            Text("2020-11-15 19:15:05").foregroundColor(.white).font(.subheadline)
                HStack(spacing:20){
                    Image("heart").resizable().frame(width:20, height:20)
                    Text("0").foregroundColor(.white)
                    Image("message").resizable().frame(width:20, height: 20)
                    Text("0").foregroundColor(.white)
                }
                Spacer()
            }
           
        }.overlay(
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(.all)
        )
        
    }
   
}

struct Home: View {
    
    var body: some View {

        TabView {

            SpineView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Spine")
                }
            
            EventView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
                }
            Text("Podcasts")
                .tabItem {
                    Image(systemName: "headphones")
                    Text("Podcasts")
                }
            Text("Activities")
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Activities")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }.accentColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
        
    }
}

struct SpineView:View{
    
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var favoriteColor = 0
    
    let hikingTrails = [
        Trail(name: "Stanford Dish", day: "2 days"),
        Trail(name: "Stanford Dish", day: "2 days"),
        Trail(name: "Stanford Dish", day: "2 days"),
        Trail(name: "Stanford Dish", day: "2 days"),
        Trail(name: "Stanford Dish", day: "2 days"),
       ]
    
    @State private var selectedSport = 0
    private let triathlonSports = ["You", "Following"]
    private let ironmanDistances = ["2.4 miles", "112 miles", "26.2 miles"]
    
    var body: some View{
        
//        ScrollView(.vertical){
        VStack (alignment: .leading){
            
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
            
//            Text("\(triathlonSports[selectedSport]) \(ironmanDistances[selectedSport])")
               Picker(selection: $selectedSport, label: Text("Select a Sport")) {
                ForEach(0 ..< triathlonSports.count) {
                       Text(self.triathlonSports[$0])

                   }

               }.pickerStyle(SegmentedPickerStyle())
            Text("Hello,").padding(.leading,20)
            Text("Gaurav").padding(.leading,20)
        Text("WELCOME").padding(.leading,20).padding(.bottom, 10)
            ScrollView(){
               
            VStack{
            ScrollView(.horizontal) {
                
                HStack(spacing: 10) {
                    ForEach(0..<2){_ in
                        SpineRect()
                    }
                   
                }.padding()
            }.frame(height: 170)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(0..<4){_ in
                            SpineImpulse()
                        }
                       
                    }.padding()
                }.frame(height: 300)
            }
            
            }
           
            List(hikingTrails) { trail in
            TrailRow(trail: trail)
            }
            Spacer()
        }.navigationBarHidden(true)
//        }
    }

}



struct ButtonView: View {
    @State var label: String
    
    private let triathlonSports = ["You", "Following"]
    
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



struct youView:View{
    var body: some View{
        Text("YOU")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
