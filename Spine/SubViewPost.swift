//
//  SubViewPost.swift
//  Spine
//
//  Created by apple on 06/05/21.
//

import SwiftUI

struct SubViewPost: View {
    
    var gridItemLayout = [GridItem(.adaptive(minimum: 100)), GridItem(.adaptive(minimum:100))]
    
    @ObservedObject var userPostModel = UserPostViewModel()
  
    var body: some View {
        ScrollView {
            VStack(){
            if($userPostModel.woofUrl.wrappedValue != false){
            LazyVGrid(columns: gridItemLayout, spacing: 5) {
                ForEach(userPostModel.data, id: \.self) { data in

                    let color = data.post_backround_color_id ?? "#B89A8A"


                    let url1: String = "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (data.files ?? "http://162.214.165.52/~pirituc5/assets/upload/default.jpg")!


                    let imageExtensions = ["png", "jpg", "gif"]

                    let url: URL? = NSURL(fileURLWithPath: url1) as URL

                    let pathExtention = url?.pathExtension
                      
                    if imageExtensions.contains(pathExtention!){
                        if data.type! == "1"{
                        AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (data.files ?? "http://162.214.165.52/~pirituc5/assets/upload/profile/default.jpg"))!,
                                      placeholder: { Text("") },
                                      image: { Image(uiImage: $0).resizable() })
                            .frame(maxHeight: 300)
                            .background(Color(UIColor(hex: color)))
                        }else{
                           
                        VStack(){
                            HStack(alignment:.top){
                            Text(data.title!).foregroundColor(.white).font(.title2).multilineTextAlignment(.center).padding(.bottom)
                        Text(data.hashtag_ids!).foregroundColor(.white).font(.title2).multilineTextAlignment(.center)
                        }
                        
                        }.frame(maxHeight: 300)
                        
                        .background(Color(UIColor(hex: color)))
                        }

                    }
                    else{
//
                    }
                }
            }
            }
            }.navigationTitle("STORIES")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: getUserPostData)
        }
       
    }
    func getUserPostData(){
        userPostModel.userPostData()
       }
//    func video(){
//        ZStack{
//            let player = AVPlayer(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + data.files!)!)
//
//            VideoPlayer(player: player)
//                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .topLeading)
//
//                .background(Color(UIColor(hex: color)))
//
//                //                        .overlay(Text(trail.title!))
//                .onAppear() {
//                    player.play()
//                }
//        }
//
//    }
}
  







struct SubViewPost_Previews: PreviewProvider {
    static var previews: some View {
        SubViewPost()
    }
}
