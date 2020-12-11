//
//  Home.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI
import AVKit

struct Trail: Identifiable {
    var id = UUID()
    var name: String
    var day: String

}


struct TrailRow: View {
    var trail: Trail
    
    var body: some View {
        ZStack{
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
        }
            Spacer()
        }
    }


struct SpineRect: View{
    private let player = AVPlayer(url: URL(string: "http://wiesoftware.com/spine/assets/upload/welcome/160544651620201115.mov")!)
       
    var body: some View{
        ZStack{
        Rectangle()
            .frame(width: 200, height: 150)
            VStack{
//            Text("SPINE").foregroundColor(.white).font(.title2)
//            Text("the Spiritual Network").foregroundColor(.white).font(.subheadline)
                VideoPlayer(player: player)
                    .onAppear() {
                        player.play()
                    }
//                VideoPlayer(player: AVPlayer(url:  URL(string: "https://bit.ly/swswift")!))
            }
        }
//            .overlay(
//            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//        )

    }
            
           
}
    

struct SpineCircle: View{
    var body: some View{
        ZStack{
           
        Circle().strokeBorder(Color.white,lineWidth: 4)
            .frame(width: 80, height: 80)
            .padding()
            
            VStack{
//            Text("SPINE").foregroundColor(.white).font(.title2)
                Image("user").resizable().frame(width: 50, height: 50)
              
            }
        }
    }
}

struct SpineCircle2: View{
    var body: some View{
        ZStack{
           
        Circle().strokeBorder(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255),lineWidth: 4)
            .frame(width: 80, height: 80)
            .padding()
            
            VStack{
//            Text("SPINE").foregroundColor(.white).font(.title2)
                Image("userb").resizable().frame(width: 50, height: 50)
              
            }
        }
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

struct SpineButtonView: View {
    @State var label: String
        
    var body: some View {
        ZStack {

            HStack(){
            NavigationLink(destination: Home()){
                Text("CBI_FOR_SSR").padding()
//                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .foregroundColor(Color.white)
                    .cornerRadius(18)
                    .shadow(radius: 5)
//                    .padding()
                
            }
            NavigationLink(destination: Home()){
                Text("CBI_FOR_SSR").padding()
//                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .foregroundColor(Color.white)
                    .cornerRadius(18)
                    .shadow(radius: 5)
//                    .padding()
                
            }
                NavigationLink(destination: Home()){
                    Text("CBI_FOR_SSR").padding()
    //                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                        .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                        .foregroundColor(Color.white)
                        .cornerRadius(18)
                        .shadow(radius: 5)
    //                    .padding()
                    
                }
                
                NavigationLink(destination: Home()){
                    Text("CBI_FOR_SSR").padding()
    //                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                        .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                        .foregroundColor(Color.white)
                        .cornerRadius(18)
                        .shadow(radius: 5)
    //                    .padding()
                    
                }
            }
        }
    }
}


struct Home: View {
    
    var body: some View {
//        NavigationView{
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
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }.accentColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
//        }.navigationBarHidden(false)
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
    private let triathlonSports = ["FOR YOU", "FOLLOWING"]
    private let ironmanDistances = ["2.4 miles", "112 miles", "26.2 miles"]
    let people = ["Adam", "James", "Adam", "James"]
    let people1 = ["Living with nature", "Living with nature", "Living with nature", "Living with nature"]
    
    
    var body: some View{
         
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
//                    viewArray[$0]

                   }

               }.pickerStyle(SegmentedPickerStyle())
            if (selectedSport == 0){
            ScrollView(.vertical){
               
                VStack(alignment: .leading, spacing: 1){
                    VStack(alignment: .leading){
                        Text("Hello,").padding(.leading,20).foregroundColor(.white)
                        Text("Gaurav").padding(.leading,20).foregroundColor(.white)
                        Text("WELCOME").padding(.leading,20).padding(.bottom, 10).foregroundColor(.white)
                    }
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<2){_ in
                        SpineRect()
                    }
                   
                }.padding()
            }.frame(height: 170)
                    
//                    NavigationView{
                    HStack(spacing: 100){
                    Text("SPINE IMPULSE").foregroundColor(.white).font(.title3).padding()
                       
                        NavigationLink(destination: SpineImpulseDetail()){
                            Text("See All").foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255)).font(.title3)
                        }
                    }
//                }

                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(0..<4){_ in
                            SpineImpulse()
                        }
                       
                    }.padding()
                }.frame(height: 300)
                    
                    HStack(spacing: 160){
//                        NavigationView{
                    Text("STORIES").foregroundColor(.white).font(.title3).padding()
                        NavigationLink(destination: StoriesDetail()){
                            Text("See All").foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255)).font(.title3)
                        }
                    }.accentColor(.black)
//                }.accentColor( .black)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 1) {
                            ForEach(people, id: \.self){person in
                                VStack(spacing: 1){
                                    SpineCircle()
                                    Text("\(person)").foregroundColor(.white).padding()
//                                    Text("\(person)").foregroundColor(.white)
                                }
                                
                            }
                           
                        }.padding()
                    }.frame(height: 120)
                    
                   
                    HStack(spacing: 160){
                    Text("TRENDING CATEGORIES").foregroundColor(.white).font(.title3).padding()
                        NavigationLink(destination: TrendingCatDetail()){
                            Text("See All").foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255)).font(.title3)
                        }
                    }
                    
                  
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                           SpineButtonView(label: " ")
                        }.padding()
                    }.frame(height: 60)
                    
                    HStack(spacing: 160){
                    Text("RECOMMENDED FOLLOWERS").foregroundColor(.white).font(.title3).padding()
                        NavigationLink(destination: Home()){
                            Text("See All").foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255)).font(.title3)
                        }
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing: 1) {
                            ForEach(people, id: \.self){person in
                                VStack(spacing: 1){
                                    SpineCircle()
//                                    Text("\(person)")
                                }
                                
                            }
                           
                        }.padding()
                    }.frame(height: 100)

                }.background(Color.black)
                
                List(hikingTrails) { trail in
                TrailRow(trail: trail)
                }.frame(minWidth:0, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        }
    }
            else if (selectedSport == 1){
//                Text("fljksdf")
                ScrollView(.vertical){
                VStack(spacing:10){
                ScrollView(.horizontal) {

                    HStack(spacing: 1) {
                        ForEach(people, id: \.self){person in
                            VStack(spacing: 1){
                                SpineCircle2()
                                Text("\(person)")
                                Text("\(person)")
                                
                            }

                        }

                    }.padding()
                }.frame(height: 160)
            }
                
                List(hikingTrails) { trail in
                TrailRow(trail: trail)
                }.frame(minWidth:0, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        }
            }
           
            Spacer()
            
        }.navigationBarHidden(true)
//        }
    }

}





struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
