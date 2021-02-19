//
//  StoriesDetail.swift
//  Spine
//
//  Created by apple on 07/12/20.
//

import SwiftUI


struct DataModel: Identifiable {
    let id: String
    let name: String
    let desc: String
    let imageName: String
}

struct StoriesDetail: View {
    
    let data: [DataModel] = [
    .init(id: "0", name: "SteveJobs", desc: "Living with nature", imageName: "back"),
    .init(id: "1", name: "Satya Nadella", desc: "Living with nature", imageName: "back"),
    .init(id: "2", name: "Jeff Bezos", desc: "Living with nature", imageName: "back"),
    .init(id: "3", name: "Tim Cook", desc: "Living with nature", imageName: "back")
    ]
    
    var body: some View {
        VStack(){
       
        List {
            Text("Discover moments of People's lifes and inspired by them.").font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center)
            }.padding()
        ForEach(data) { items in
        ForEach(0..<3) { item in
        CollectionView(data: items)
          }
        }
    }
        .navigationTitle("STORIES").foregroundColor(.black)
//        .navigationBarTitleDisplayMode(.inline)

    }
}

struct CollectionView: View {
    let data: DataModel
    var body: some View {
       
        VStack {
          
            HStack {
                ForEach(0..<3) { items in
                    Spacer()
                    Image(self.data.imageName)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.yellow)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    Spacer()
                }.padding(.bottom, 2)
            }
            HStack {
                Spacer()
                VStack{
                    Text(self.data.name)
                        .multilineTextAlignment(.center).font(Font.system(size: 15))
                        .padding(.bottom, 5)
                    Text(self.data.desc).multilineTextAlignment(.center).font(Font.system(size: 12))
                    Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                }
                
                Spacer()
                VStack{
                    Text(self.data.name).multilineTextAlignment(.center).font(Font.system(size: 15))
                        .padding(.bottom, 5)
                    Text(self.data.desc).multilineTextAlignment(.center).font(Font.system(size: 12))
                    Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                }
                Spacer()
                VStack{
                    Text(self.data.name).multilineTextAlignment(.center).font(Font.system(size: 15))
                        .padding(.bottom, 5)
                    Text(self.data.desc).multilineTextAlignment(.center).font(Font.system(size: 12))
                    Text("+Follow").foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                }
                Spacer()
            }
        }.navigationBarItems(trailing:Button(action: {
//            self.selected.toggle()
        }) {
            Image("search").resizable().frame(width: 30, height: 30, alignment: .trailing)
                .foregroundColor(.black)
            }.padding(.all)
            
       
)
    }
}


struct StoriesDetail_Previews: PreviewProvider {
    static var previews: some View {
        StoriesDetail().environment(\.colorScheme, .light)
    }
}
