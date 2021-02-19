//
//  Home.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI
import AVKit



struct TrailRow: View {
    var trail:UserPostModel.Data
    
    @ObservedObject var favouriteModel = FavouritViewModel()
    @ObservedObject var userPostModel = UserPostViewModel()
    @ObservedObject var commentModel = CommentViewModel()

    @State private var comment: String = ""
    @State private var isShowingRed = false

    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 20) {
                
              
                HStack(){
                    AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/spine-post/" + (trail.profile_pic ?? "default.jpg"))!,
                                  placeholder: { Text("") },
                                  image: { Image(uiImage: $0).resizable() })
                        .frame(width:80, height:80)
                        .cornerRadius(80/2)
                        .padding(.leading,5)
                Text(trail.post_user_name!).font(.subheadline).foregroundColor(.black)
                    Spacer()
                    
                    Text("2 days").font(.subheadline).foregroundColor(.gray)
                    
                    
                }

                
                AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/spine-post/" + (trail.files ?? "http://wiesoftware.com/spine/assets/upload/profile/default.jpg"))!,
                              placeholder: { Text("") },
                              image: { Image(uiImage: $0).resizable() })
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: .topLeading)
                    .overlay(Text(trail.title!))
                
                HStack{
                    Image("heart").resizable().frame(width: 20, height: 20)
                        .gesture(TapGesture().onEnded() {
                            print(trail.id!)
                            setFavourit()
                          
                                    })
                    
                    if($favouriteModel.woofUrl.wrappedValue != false){
                       
//                           let _ = changeFav()
                       
                    }
                  
                    Text(trail.total_like!).foregroundColor(.gray).font(.system(size: 12))
                    Image("message").resizable().frame(width:20, height: 20)
                        .gesture(TapGesture().onEnded() {
                                        print("message")
                            self.isShowingRed.toggle()
                                    })
                    let x = String(trail.user_like_status ?? 0)
                    Text(x).foregroundColor(.gray).font(.system(size: 12))
                    Image("curved-arrow").resizable().frame(width:20, height: 20)
                        .gesture(TapGesture().onEnded() {
                                        print("curved")
                                    })
                    Spacer()
                    Image("bookmark").resizable().frame(width:20, height: 20)
                        .gesture(TapGesture().onEnded() {
                                        print("bookmark")
                                    })
                    Image("menu").resizable().frame(width:20, height: 20)
                        .gesture(TapGesture().onEnded() {
                                        print("menu")
                                    })
//                    Text("18")
                }
                if isShowingRed {
                VStack(){
                    ZStack(alignment: .leading) {
                        HStack(){
                        if comment.isEmpty{
                            Text("").foregroundColor(.gray)
                                .padding(.bottom, 10)
                                .padding(.leading, 10)
                        }

                        TextField("Comment", text: $comment)
                            .foregroundColor(Color.gray)
                            .padding(5)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color("backColor"), lineWidth: 2))
                            .padding(.bottom,10)
                        Spacer()
                            Image("sent").resizable()
                                .gesture(TapGesture().onEnded() {
                                        print("sent")
                                        })
                            .frame(width:30, height:30)
                            .padding()
                        }
                           
                    }
                }
                }
            }
        }
            Spacer()
    }
    
    private func setFavourit(){
        favouriteModel.getFavouriteData(id:trail.id!)
    }
    
}


struct SpineRect: View{
    
    let player = AVPlayer(url: URL(string: "http://homeofbulldogs.com/dev/geev/assets/upload/images/160544651620201115.mov")!)
    

    var body: some View{
    
        ZStack(){
       
        Rectangle()
            .frame(width: 200, height: 150)
            VideoPlayer(player: player)
                .onAppear() {
                    player.play()
            }
        }
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
    @State var title: String
    var body: some View{
        ZStack{
        Rectangle()
            .frame(width: 200, height: 300)
            VStack{
                Circle().strokeBorder(Color.white,lineWidth: 4)
                .frame(width: 80, height: 80)
                    .padding()
            Text("").foregroundColor(.white).font(.title2)
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
    @ObservedObject var trendingModel = TrendingCatViewModel()
//    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
   
        
    var body: some View {
        ZStack {
            
            HStack(){
            NavigationLink(destination: EventView()){
                Text(label).padding()
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
    
        TabView {
            NavigationView{
            SpineView()
            }
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
            ActivitiesView()
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
    
    @ObservedObject var model = HomeViewModel()
    @ObservedObject var impulseModel = HomeViewImpulseModel()
    @ObservedObject var storiesModel = StoriesViewModel()
    @ObservedObject var trendingModel = TrendingCatViewModel()
    @ObservedObject var followersModel = FollowersViewModel()
    @ObservedObject var postModel = PostViewModel()
    @ObservedObject var userPostModel = UserPostViewModel()
    @ObservedObject var followingModel = FollowingViewModel()
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var actionState: Int? = 0
    @State private var favoriteColor = 0
    
    @State var hikingTrails = [UserPostModel.Data]()
    
    var xxx = [StoriesModel.Data.Stories_data]()
    
    let img = "default"
    
    @State private var selectedSport = 0
    private let triathlonSports = ["FOR YOU", "FOLLOWING"]
    private let ironmanDistances = ["2.4 miles", "112 miles", "26.2 miles"]
    let people = ["Adam", "James", "Adam", "James"]

    let people1 = ["Living with nature", "Living with nature", "Living with nature", "Living with nature"]
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    
    var body: some View{
     
//        print("xx",xx)
        VStack (alignment: .leading){
            
            HStack {
//                NavigationView{
                NavigationLink(destination: PlusButtonView()){
                    Text("+")
                        .font(.system(size: 50))
                       
                        .padding(.bottom, 5)
                }
//                }
                
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
                    if($model.woofUrl.wrappedValue != false){
                
//                    let url = model.newData[0]
//                    print("url", url)
                    let x =  model.newData
//                        let _ =  print("aaaaaa", x)
                        ForEach(x, id: \.self) { data in
//                        ZStack(){
//                            Text(data).foregroundColor(.white)

                            let player = AVPlayer(url: URL(string: "http://wiesoftware.com/spine/assets/upload/welcome/" + data.image!)!)
                            let _ =  print("player",data.image!)

                            ZStack{
                            Rectangle()
                                .frame(width: 200, height: 150)
                            VideoPlayer(player: player)
                                .onAppear() {
                                    player.play()
                                }
                        }
//                        }

//
////                                       .padding()
////                                       .background(data)
//                               }
                       
                    
                    
                 
                    
                    
//                        ForEach(0..<2){ _ in
//
//
//
//                            let player = AVPlayer(url: URL(string: "http://homeofbulldogs.com/dev/geev/assets/upload/images/160544651620201115.mov")!)
//
//
//
//
                           

                        }
                      
                           
                        }
                } .onAppear(perform: fetch)
                    
                   
                }.padding()
            .frame(height: 170)
                    
//                    NavigationView{
                    HStack(){
//                        NavigationView{
                    Text("SPINE IMPULSE").foregroundColor(.white).font(.system(size: 16)).padding()
                       Spacer()
//                        NavigationView{
                        NavigationLink(destination: SpineImpulseDetail()){
                            Text("See All").foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255)).font(.title3)
                                .padding()
                        }
                    }
//                }

                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        if($impulseModel.woofUrl.wrappedValue != false){
                            ForEach(impulseModel.data, id: \.self) { data in
                                ZStack{
                                Rectangle()
                                    .frame(width: 200, height: 300)
                                    ZStack{
//                                        Image(data.image!)
                                            
                                        AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/impulse/" + (data.image ?? "default.jpg"))!,
                                                      placeholder: { Text("") },
                                                      image: { Image(uiImage: $0).resizable() })
                                            
//                                               .resizable()
                                        .frame(width:200, height:300)
                                               .scaledToFill()
                                               .edgesIgnoringSafeArea(.all)
                                    }
                                    .overlay(
                                        LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(.all)
                                    )
                                    
                                    VStack{
                                       
                                        Circle().strokeBorder(Color.white,lineWidth: 4)
                                        .frame(width: 80, height: 80)
                                            .padding()
                                        Text(data.description!).foregroundColor(.white).font(.title2)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(5)
                                        .frame(width: 180)
                                        .padding(.bottom, 30)
                                        
                                        Text(data.created_on!).foregroundColor(.white).font(.subheadline)
                                       
                                        
                                        HStack(spacing:20){
                                            Image("heart").resizable().frame(width:20, height:20)
                                            
                                            Text(data.total_like!).foregroundColor(.white)
                                            NavigationLink(destination: ImpulseCommentView()) {
                                            Image("message").resizable().frame(width:20, height: 20)
                                            }
                                            Text(data.total_comment!).foregroundColor(.white)
                                        }
                                        Spacer()
                                    }
                                   
                                }

                                
                            }
                           
                        }
                    }.padding()
                    .onAppear(perform: getImpulse)
                }.frame(height: 300)
                .padding(.trailing, 10)
                    
                    HStack(){
//                        NavigationView{
                        Text("STORIES").foregroundColor(.white).font(.system(size: 16)).padding(.leading)
                        Spacer()
                        NavigationLink(destination: StoriesDetail()){
                            Text("See All").foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255)).font(.title3)
                                .padding()
                                
                                
                        }
                    }.accentColor(.black)

                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                        if($storiesModel.woofUrl.wrappedValue != false){
                            ForEach(storiesModel.data, id: \.self){data in
                                VStack(spacing: 1){
                                        
                                        ZStack{
                                            VStack(){
                                               
                                            let url1 : String = "http://wiesoftware.com/spine/assets/upload/spine-stories/" + (data.stories_data![0].media_file ?? "default.jpg")

                                            let imageExtensions = ["png", "jpg", "gif"]

                                            let url: URL? = NSURL(fileURLWithPath: url1) as URL

                                            let pathExtention = url?.pathExtension
                                              
                                            if imageExtensions.contains(pathExtention!){
                                               
                                                AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/spine-stories/" + (data.stories_data![0].media_file ?? "http://wiesoftware.com/spine/assets/upload/profile/default.jpg"))!,
                                                              placeholder: { Text("") },
                                                              image: { Image(uiImage: $0).resizable() })
                                               
                                                
                                                    .clipShape(Circle())
                                                                .overlay(Circle().stroke(Color.white, lineWidth: 3.0))
                                                                .frame(width: 70.0, height: 70.0)
                                            }
                                            else{
                                                ZStack{
                                                    let player = AVPlayer(url: URL(string: "http://wiesoftware.com/spine/assets/upload/spine-stories/" + data.stories_data![0].media_file!)!)
                                                    Circle().strokeBorder(Color.white,lineWidth: 2)
                                                    .padding()
                                                    .frame(width: 80, height: 80)
//                                                    .clipShape(Circle())
                                                VideoPlayer(player: player)
                                                    .frame(width: 80, height: 80)
                                                    .clipShape(Circle())
                                                    .onAppear() {
                                                        player.play()
                                                    }
                                            }
                                        }
                                                    Text(data.stories_data![0].title ?? "")
                                                    .foregroundColor(.white)
//                                            }


                                            }
                                        }
                                }
                                
                            }
                        }
                           
                           
                        }.padding()
                        .onAppear(perform: getStories)
                    }.frame(height: 120)
                    
                   
                    HStack(){
                    Text("TRENDING CATEGORIES").foregroundColor(.white).font(.system(size: 16)).padding()
                        Spacer()
                        NavigationLink(destination: TrendingCatDetail()){
                            Text("See All").foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255)).font(.title3)
                                .padding()
                        }
                    }
                    
                  
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            if($trendingModel.woofUrl.wrappedValue != false){
                                ForEach(trendingModel.data, id: \.self){data in
                                    VStack(spacing: 1){
                                        SpineButtonView(label: data.hash_title!)
   
                                    }
                                    
                                }
                            }
                               
                        }.padding()
                        .onAppear(perform: getTrendingData)
                    }.frame(height: 60)
                    
                    HStack(){
                    Text("RECOMMENDED FOLLOWERS").foregroundColor(.white).font(.system(size: 16)).padding()
                        Spacer()
                        NavigationLink(destination: RecFollowersView()){
                            Text("See All").foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255)).font(.title3)
                                .padding()
                        }
                    }
                    ScrollView(.horizontal) {
                       
                        HStack(spacing: 10) {
                            if($followersModel.woofUrl.wrappedValue != false){
                            ForEach(followersModel.data, id: \.self){data in
                                VStack(spacing: 1){
//
                                    ZStack{
//
                                       
                                        AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/profile/" + (data.profile_pic ?? "default.jpg"))!,
                                                      placeholder: { Text("") },
                                                      image: { Image(uiImage: $0).resizable() })
                                            .frame(width:80, height:80)
                                            .clipShape(Circle())
                                            
                                        }
                                    
                                    }

                                }
                            }
                        }.padding()
                        .onAppear(perform: getFollowersData)
                    }.frame(height: 100)

                }.background(Color.black)
                
//                List(hikingTrails) { trail in
//                TrailRow(trail: trail)
//                }.frame(minWidth:0, maxWidth: .infinity, minHeight: 1000, maxHeight: .infinity)
//                .onAppear(perform: getUserPostData)
                if($userPostModel.woofUrl.wrappedValue != false){
                List(userPostModel.data, id: \.self){ data in
                    TrailRow(trail: data)
                } .frame(minWidth:0, maxWidth: .infinity, minHeight: 1000, maxHeight: .infinity)
                
                }
        }.onAppear(perform: getUserPostData)
                
    }
            else if (selectedSport == 1){
                Text("STORIES").foregroundColor(.black).font(.system(size: 18)).padding()
             
                ScrollView(.vertical){
                   
                VStack(spacing:10){
                 
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                      
                        if($followingModel.woofUrl.wrappedValue != false){
                            ForEach(followingModel.data, id: \.self){data in
                            VStack(spacing: 1){
//                                Circle().strokeBorder(Color.white,lineWidth: 4)
                                AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/profile/" + (data.profile_pic ?? "default.jpg"))!,
                                              placeholder: { Text("") },
                                              image: { Image(uiImage: $0).resizable() })
                                    .frame(width:80, height:80)
                                    .clipShape(Circle())
                                    .overlay(
                                           RoundedRectangle(cornerRadius: 40)
                                               .stroke(Color("backColor"), lineWidth: 4)
                                       )
                                Text("\(data.tbl_users_user_name!)")
                                Text("\(data.bio ?? "")")

                            }

                        }
                        }

                    }.padding()
                    .onAppear(perform: getFollowingData)
                }.frame(height: 160)
            }
                

        }
            }
           
//            Spacer()
            
        } .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//        }
        
    }
    
    private func fetch() {
            model.getHomeWelcomeData()
        }
    
    private func getImpulse() {
        impulseModel.getHomeImpulseData()
        }
   
    private func getStories(){
       
        storiesModel.getStoriesData()
    }
    
    private func getFollowersData(){
        followersModel.getFollowersData()
    }
    
    private func getTrendingData(){
        trendingModel.getTrendingData()
    }
    
    private func getPostData(){
        postModel.getPostData()  //followesPostList
    }
    
    private func getUserPostData(){
        userPostModel.userPostData()
    }
    
    private func getFollowingData(){
        followingModel.getFollowingData()
    }
    
    func asyncTask() {
        //some task which on completion will set the value of actionState
        self.actionState = 1
    }

}





struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
