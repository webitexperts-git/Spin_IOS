//
//  SpineImpulseDetail.swift
//  Spine
//
//  Created by apple on 04/12/20.
//

import SwiftUI


struct SpineRect2: View{
    var body: some View{
        ZStack{
        Rectangle()
//            .frame(width: 200, height: 150)
            .frame(minWidth:0, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
            VStack{
            Text("SPINE").foregroundColor(.white).font(.title2)
            Text("the Spiritual Network").foregroundColor(.white).font(.subheadline)
            }
        }.overlay(
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(.all)
        )
        
    }
}
//struct Impulse: Identifiable {
//    var id = UUID()
//    var name: String
//    var day: String
//
//}

struct ImpulseRow: View {
    var impulse: HomeImpulseModel.Data
    @ObservedObject var userPostModel = UserPostViewModel()
    @ObservedObject var impulseModel = HomeViewImpulseModel()
    @ObservedObject var date = HomeViewImpulseModel()
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 20) {
               
                HStack{

                    AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/impulse/" + (impulse.image ?? ""))!,
                                  placeholder: { Text("") },
                                  image: { Image(uiImage: $0).resizable() })
                        .frame(width:80, height:80)
                        .clipShape(Circle())
                   
                    Text(impulse.name!).font(.subheadline).foregroundColor(.black)
                    
                    
                    Text(impulse.created_on!).font(.subheadline).foregroundColor(.gray)
                }
                
                VStack(){
                
//               SpineRect2()
                    ZStack{
                    Rectangle()
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(.all)
                        )
        
                        .frame(minWidth:0, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
                        VStack{
                            Text(impulse.description!).foregroundColor(.white).font(.title2)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 30)
                           
                            Text(impulse.name!).foregroundColor(.white).font(.subheadline)
                             
                        }
                    }
                    
                HStack{
                    Image("heart").resizable().frame(width: 20, height: 20)
                    Text(impulse.total_like!).foregroundColor(.gray).font(.system(size: 12))
                    Image("message").resizable().frame(width:20, height: 20)
                    Text(impulse.total_comment!).foregroundColor(.gray).font(.system(size: 12))
                    Image("curved-arrow").resizable().frame(width:20, height: 20)
                        Spacer()
                    Image("bookmark").resizable().frame(width:20, height: 20)
                    Image("menu").resizable().frame(width:20, height: 20)
                }
            }
        }

        }

    }
    
}




struct SpineImpulseDetail: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//    @ObservedObject var userPostModel = UserPostViewModel()
    @ObservedObject var impulseModel = HomeViewImpulseModel()
//    let hikingTrails = [UserPostModel.Data]()
    var body: some View {

        VStack(alignment:.leading){

            if($impulseModel.woofUrl.wrappedValue != false){
            List(impulseModel.data, id: \.self){ data in
                ImpulseRow(impulse: data)
            } .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            }
            
        }.navigationBarHidden(false)
        .onAppear(perform: getImpulse)

        .navigationTitle("SPINE IMPULSES").foregroundColor(.black)
        .toolbar {
            Button("Follow") {
                print("Help tapped!")
                    }
                }
//        Spacer()

        }
    
    private func getImpulse() {
        impulseModel.getHomeImpulseData()
        }
}

struct SpineImpulseDetail_Previews: PreviewProvider {
    static var previews: some View {
        SpineImpulseDetail()
    }
}
