//
//  ActivitiesView.swift
//  Spine
//
//  Created by apple on 17/12/20.
//

import SwiftUI

struct ActivitiesView: View {
    @ObservedObject var activitiesModel = ActivitiesViewModel()
    @State private var selectedSport = 0
    private let triathlonSports = ["YOU", "FOLLOWING"]
    var body: some View {
       
        VStack(){
        Picker(selection: $selectedSport, label: Text("Select a Sport")) {
         ForEach(0 ..< triathlonSports.count) {
                Text(self.triathlonSports[$0])
                }
           
            }.pickerStyle(SegmentedPickerStyle())
            if (selectedSport == 0){
                ScrollView(.vertical){
                   
                if($activitiesModel.woofUrl.wrappedValue != false){
                    ForEach(activitiesModel.data, id: \.self){data in
//                        VStack(alignment: .leading){
                            HStack(spacing:10){
                            AsyncImage(url: URL(string: activitiesModel.profil_image + (data.profile_pic ?? "default.jpg"))!,
                                          placeholder: { Text("") },
                                          image: { Image(uiImage: $0).resizable() })
                                
                                .frame(width:80, height:80)
                                .clipShape(Circle())
                           
                            VStack(alignment: .leading){
                                Text(data.u_name ?? "").multilineTextAlignment(.leading)
                                    .font(.title3)
                                    .foregroundColor(.gray)
                                if(data.tbl_action == "Post-like"){
                                    let msg = data.u_name! + " has like your post"
                                    Text(msg).multilineTextAlignment(.leading)
                                    
                                    let url1: String = activitiesModel.post_image + (data.files ?? "http://162.214.165.52/~pirituc5/assets/upload/default.jpg")
//
//
                                    let imageExtensions = ["png", "jpg", "gif"]
//
                                    let url: URL? = NSURL(fileURLWithPath: url1) as URL
//
                                    let pathExtention = url?.pathExtension
//
                                    if imageExtensions.contains(pathExtention!){

                                        AsyncImage(url: URL(string: activitiesModel.post_image + (data.files ?? "http://162.214.165.52/~pirituc5/assets/upload/profile/default.jpg"))!,
                                                      placeholder: { Text("") },
                                                      image: { Image(uiImage: $0).resizable() })
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80, maxHeight: 80)

                                    }
                                    else{
                                        ZStack{
                                            let player = AVPlayer(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + data.files!))
                                           
//                                        VideoPlayer(player: player)
//                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .topLeading)

                        
                                            .onAppear() {
                                                player.play()
                                            }
                                    }
                                }
                                    
                                }
                                
                                else if(data.tbl_action == "Post-comment"){
                                    let msg = data.u_name! + " has commented on your post"
                                    Text(msg).multilineTextAlignment(.leading)
                                }
                                else if(data.tbl_action == "Post-save"){
                                    let msg = data.u_name! + " has save your post"
                                    Text(msg).multilineTextAlignment(.leading)
                                }
                                else if(data.tbl_action == "Post-share"){
                                    let msg = data.u_name! + " has share your post"
                                    Text(msg).multilineTextAlignment(.leading)
                                }
                                else if(data.tbl_action == "Impluse Like"){
                                    let msg = data.u_name! + " has like Impulse"
                                    Text(msg).multilineTextAlignment(.leading)
                                }
                                else if(data.tbl_action == "Impluse-Comment"){
                                    let msg = data.u_name! + " has comment on Impulse"
                                    Text(msg).multilineTextAlignment(.leading)
                                }
                                else if(data.tbl_action == "Event-comment"){
                                    let msg = data.u_name! + " has comment on Event"
                                    Text(msg).multilineTextAlignment(.leading)
                                }
                                else if(data.tbl_action == "Event-save"){
                                    let msg = data.u_name! + " has save Event"
                                    Text(msg).multilineTextAlignment(.leading)
                                }
                                else if(data.tbl_action == "Following-user"){
                                    let msg = data.u_name! + " has following you"
                                    Text(msg).multilineTextAlignment(.leading)
                                }
            
                                Divider()
                                
                            }
                            .frame(minWidth:0, maxWidth: .infinity)
                            .padding()
                        }
//
                }
            }
                
        }.onAppear(perform: getForYouActivities)
                .padding()
    }else if(selectedSport == 1){
        
        ScrollView(.vertical){
           
        if($activitiesModel.woofUrl.wrappedValue != false){
            ForEach(activitiesModel.data, id: \.self){data in
//                        VStack(alignment: .leading){
                    HStack(spacing:10){
                    AsyncImage(url: URL(string: activitiesModel.profil_image + (data.profile_pic ?? "default.jpg"))!,
                                  placeholder: { Text("") },
                                  image: { Image(uiImage: $0).resizable() })
                        
                        .frame(width:80, height:80)
                        .clipShape(Circle())
                   
                    VStack(alignment: .leading){
                        Text(data.u_name ?? "").multilineTextAlignment(.leading)
                            .font(.title3)
                            .foregroundColor(.gray)
                                
                        if(data.tbl_action == "Post-like"){
                            let msg = data.u_name! + " has like your post"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        else if(data.tbl_action == "Post-comment"){
                            let msg = data.u_name! + " has commented on your post"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        else if(data.tbl_action == "Post-save"){
                            let msg = data.u_name! + " has save your post"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        else if(data.tbl_action == "Post-share"){
                            let msg = data.u_name! + " has share your post"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        else if(data.tbl_action == "Impluse Like"){
                            let msg = data.u_name! + " has like Impulse"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        else if(data.tbl_action == "Impluse-Comment"){
                            let msg = data.u_name! + " has comment on Impulse"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        else if(data.tbl_action == "Event-comment"){
                            let msg = data.u_name! + " has comment on Event"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        else if(data.tbl_action == "Event-save"){
                            let msg = data.u_name! + " has save Event"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        else if(data.tbl_action == "Following-user"){
                            let msg = data.u_name! + " has following you"
                            Text(msg).multilineTextAlignment(.leading)
                        }
                        Divider()
                        
                    }
                    .frame(minWidth:0, maxWidth: .infinity)
                    .padding()
                }
//
        }
    }
        
}.onAppear(perform: getFollowingActivities)
        .padding()
        
        
    }
    Spacer()
            
}.navigationBarTitle("Activities")

     
}
    
    func getForYouActivities(){
        activitiesModel.getActivitiesData()
    }
    
    func getFollowingActivities(){
        activitiesModel.getFollowingActivitiesData()
    }
  
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
