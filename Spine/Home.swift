//
//  Home.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI



struct Trail: Identifiable {
    var id = UUID()
//    var roundImage :
    var name: String
    var day: String
//    var fullImage: Image
//    var distance: Double
}

struct TrailRow: View {
    var trail: Trail
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                Image("back") .resizable().frame(width: 80, height: 80)
                .cornerRadius(80/2)
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
//            Text(String(format: "%.1f miles", trail.distance))
        }
    }
}



struct Home: View {
    
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
    
    var body: some View {
        
        //        NavigationView {
        VStack (alignment: .leading){
            // Search view
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
                       .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
                   }
        Spacer()
                   
        
        
        TabView {
//
//            Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
//                           Text("Red").tag(0)
//                           Text("Green").tag(1)
//                           Text("Blue").tag(2)
//                       }.pickerStyle(SegmentedPickerStyle())

//            Text("Spine1")
            
//            List(1...10, id: \.self) { index in
//                            Image("back")
//                                .resizable().frame(width: 80, height: 80)
//                                .cornerRadius(80/2)
//                               Text("Shanu Nag")
//                                   .font(.system(size: 14, design: .rounded))
//
//                                .padding(.horizontal, 40)
//                                Text("2 days ago")
//                                    .font(.system(size: 12, design: .rounded))
//                                    .foregroundColor(.gray)
//                   }
            List(hikingTrails) { trail in
                       TrailRow(trail: trail)
                   }
            
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Spine")
                }
            
            Text("Events")
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
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
