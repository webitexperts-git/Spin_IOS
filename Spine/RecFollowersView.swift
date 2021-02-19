//
//  RecFollowersView.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/02/21.
//

import SwiftUI


struct DesignView: View{
    
    var recFollowers: RecFollowersModel.Data
//    @ObservedObject var recFollowersModel = RecFollowersViewModel()
   
    
    var body: some View{
        HStack(){
        AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/user/" + (recFollowers.profile_pic ?? ""))!,
                      placeholder: { Image("user") },
                      image: { Image(uiImage: $0).resizable() })
            .frame(width:80, height:80)
            .clipShape(Circle())
            
      
        }
    }
}

struct RecFollowersView: View {
    @ObservedObject var recFollowersModel = RecFollowersViewModel()
    var body: some View {
        VStack(alignment:.leading){

            if($recFollowersModel.woofUrl.wrappedValue != false){
            List(recFollowersModel.data, id: \.self){ data in
                DesignView(recFollowers: data)
            } .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            }
            
        }.navigationBarHidden(false)
        .onAppear(perform: getRecFollowers)

        .navigationTitle("SPINE IMPULSES").foregroundColor(.black)
        .toolbar {
            Button("Follow") {
                print("Help tapped!")
                    }
                }
//        Spacer()

        }
    
    private func getRecFollowers() {
        recFollowersModel.getRecFollowerstData()
        }
    }


struct RecFollowersView_Previews: PreviewProvider {
    static var previews: some View {
        RecFollowersView()
    }
}
