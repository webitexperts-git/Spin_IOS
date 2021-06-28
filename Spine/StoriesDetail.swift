//
//  StoriesDetail.swift
//  Spine
//
//  Created by apple on 07/12/20.
//

import SwiftUI
import Combine



struct StoriesDetail: View {
    
     
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    @ObservedObject var storiesDetailModel = StoriesDetailViewModel()
//    var storiesDetailData:StoriesDetailModel.Data
    
    
    var body: some View {
        Text("Discover moments of People's lifes and get inspired by them").multilineTextAlignment(.center).foregroundColor(.gray)
        ScrollView {
            VStack(){
            if($storiesDetailModel.woofUrl.wrappedValue != false){
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(storiesDetailModel.data, id: \.self) { data in
                    VStack(){
                    AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/profile/" + (data.profile_pic ?? "http://wiesoftware.com/spine/assets/upload/profile/default.jpg"))!,
                               placeholder: { Image("user").frame(width: 80, height: 80) },
                                                             image: { Image(uiImage: $0).resizable() })
                                                   .clipShape(Circle())
                                                    .overlay(Circle().stroke(Color("backColor"), lineWidth: 3.0))
                        .frame(width: 80, height: 80)
                        
                        let name = data.user_display_name ?? data.user_name
                        
                        Text(name ?? "")
                            .multilineTextAlignment(.center).font(Font.system(size: 15))
                            .padding(.bottom, 5)
                        let town = data.town ?? ""
                        Text(town).multilineTextAlignment(.center).font(Font.system(size: 12))
                        Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255)).font(Font.system(size: 20))
                    }
                }
            }
            }
            }.navigationBarTitle("Stories")
//            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: getStoriesDetail)
        }
       
    }
    func getStoriesDetail(){
           storiesDetailModel.getStoriesDetailData()
       }
    }
    
//    var body: some View {
//        VStack(alignment:.center){
//        if($storiesDetailModel.woofUrl.wrappedValue != false){
//        List() {
//               ForEach(storiesDetailModel.data, id: \.self) { data in
//                HStack(alignment: .center) {
//                       ForEach(storiesDetailModel.data, id: \.self) { data in
//                        VStack(){
////                           Image("back")
//                            AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/profile/" + (data.profile_pic ?? "http://wiesoftware.com/spine/assets/upload/profile/default.jpg"))!,
//                                          placeholder: { Text("") },
//                                          image: { Image(uiImage: $0).resizable() })
//
//
//                                .clipShape(Circle())
//                                            .overlay(Circle().stroke(Color.white, lineWidth: 3.0))
//                                            .frame(width: 70.0, height: 70.0)
//
//
//
////                               .resizable()
////                               .scaledToFit()
////                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color("backColor"), lineWidth: 3.0))
////                            .frame(width: 70.0, height: 70.0)
//
//                            let name = data.user_display_name ?? data.user_name
//
//                            Text(name!)
//                            .multilineTextAlignment(.center).font(Font.system(size: 15))
//                            .padding(.bottom, 5)
//                            let town = data.town ?? ""
//                            Text(town).multilineTextAlignment(.center).font(Font.system(size: 12))
//                            Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255)).font(Font.system(size: 20))
//                            }
//                        Spacer()
//                       }
////                    Spacer()
//                   }
////                Spacer()
//               }
//        }
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationTitle("Stories")
//
//            }
//        }.onAppear(perform: getStoriesDetail)
//    }
//
//    func getStoriesDetail(){
//        storiesDetailModel.getStoriesDetailData()
//    }
//}

//struct CollectionView: View {
//    let data: DataModel
//    var body: some View {
//
//        VStack {
//
//            HStack {
//                ForEach(0..<3) { items in
//                    VStack(){
//                    Image(self.data.imageName)
//                        .resizable()
//                        .frame(width: 80, height: 80)
//                        .foregroundColor(.yellow)
//                        .clipShape(Circle())
//                        .shadow(radius: 10)
//
//                        Text(self.data.name)
//                        .multilineTextAlignment(.center).font(Font.system(size: 15))
//                        .padding(.bottom, 5)
//                        Text(self.data.desc).multilineTextAlignment(.center).font(Font.system(size: 12))
//                        Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
//                    }
//
//                }.padding()
//            }
////            HStack {
////
////                VStack{
////                    Text(self.data.name)
////                        .multilineTextAlignment(.center).font(Font.system(size: 15))
////                        .padding(.bottom, 5)
////                    Text(self.data.desc).multilineTextAlignment(.center).font(Font.system(size: 12))
////                    Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
////                }
////
////
////                VStack{
////                    Text(self.data.name).multilineTextAlignment(.center).font(Font.system(size: 15))
////                        .padding(.bottom, 5)
////                    Text(self.data.desc).multilineTextAlignment(.center).font(Font.system(size: 12))
////                    Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
////                }
////
////                VStack{
////                    Text(self.data.name).multilineTextAlignment(.center).font(Font.system(size: 15))
////                        .padding(.bottom, 5)
////                    Text(self.data.desc).multilineTextAlignment(.center).font(Font.system(size: 12))
////                    Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
////                }
////
////            }
//        }
////        .navigationBarItems(trailing:Button(action: {
////        }) {
////            Image("search").resizable().frame(width: 30, height: 30, alignment: .trailing)
////                .foregroundColor(.black)
////            }.padding(.all)
////
////
////)
//    }
//}


struct StoriesDetail_Previews: PreviewProvider {
    static var previews: some View {
        StoriesDetail().environment(\.colorScheme, .light)
    }
}
