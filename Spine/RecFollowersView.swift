//
//  RecFollowersView.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/02/21.
//

import SwiftUI


struct DesignView: View{
    
    var followersDetail: FollowersDetailModel.Data

    
    var body: some View{
        VStack(alignment: .leading){
            HStack(){
        AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/user/" + (followersDetail.profile_pic ?? ""))!,
                      placeholder: { Image("userb") },
                      image: { Image(uiImage: $0).resizable() })
            .frame(width:80, height:80)
          
            .clipShape(Circle())
                        .overlay(Circle().stroke(Color("backColor"), lineWidth: 3.0))
            .frame(width: 80.0, height: 80.0).padding(.leading, 5)
//                Spacer()

       
            VStack(){
            Text(followersDetail.user_name ?? "")
            Text(followersDetail.town ?? "")
            }
            
                Spacer()
            Button(action: {
                                print("sign up bin tapped")
                            }) {
                            
              
                Text("+FOLLOW")
                   
                    .padding()
                    .background(Color("backColor"))
                    .cornerRadius(40)
                    .foregroundColor(.white)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 40)
//                            .stroke(Color("backColor"), lineWidth: 2)
//                    )
                            }
                
              


            }
        }
    }
}

struct RecFollowersView: View {
    @ObservedObject var followersDetailModel = FollowersDetailViewModel()
  
    var body: some View {
        VStack(alignment:.center){
            Text("Discover people on Spine you might want to follow").foregroundColor(.gray).multilineTextAlignment(.center)
            if($followersDetailModel.woofUrl.wrappedValue != false){
            List(followersDetailModel.data, id: \.self){ data in
                DesignView(followersDetail: data)
            } .frame(minWidth:300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
            
            }
            
        }.navigationBarHidden(false)
        .onAppear(perform: getFollowersDetail)

        .navigationTitle("Members").foregroundColor(.black)
        .toolbar {
            Button(action: {
                     print("button pressed")

                   }) {
                       Image("search")
                        .resizable()
                        .frame(width: 20, height:20)
                   }
                }.navigationBarTitleDisplayMode(.inline)
//        Spacer()

        }
    
    private func getFollowersDetail() {
        followersDetailModel.getFollowersDetailData()
        }
    }


struct RecFollowersView_Previews: PreviewProvider {
    static var previews: some View {
        RecFollowersView()
    }
}
