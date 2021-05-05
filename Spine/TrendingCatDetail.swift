//
//  TrendingCatDetail.swift
//  Spine
//
//  Created by apple on 07/12/20.
//

import SwiftUI
//import Combine



struct HeaderButton1:View{
    var body: some View{
        VStack(alignment: .leading){
            Text("ALL")
            .frame(minWidth: 0, maxWidth: 150, minHeight: 40, maxHeight:40)
            .background(Color("backColor"))
            .foregroundColor(Color.white)
            .cornerRadius(18)
            .shadow(radius: 5)
            .padding(.leading, 10)
    }
    }
}

struct HeaderButton2:View{
    var body: some View{
        Text("Trending")
            .frame(minWidth: 0, maxWidth: 180, minHeight: 40, maxHeight:40)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.gray, lineWidth: 2)
        )
            .foregroundColor(Color.gray)
            .cornerRadius(18)
            .shadow(radius: 5)
            .padding(.leading, 10)
            
    }
}


struct SpineButtonView1: View {
    @State var label: String
    @ObservedObject var trendingModel = TrendingCatViewModel()

    var body: some View {
        ZStack {
            
          
            HStack(spacing: 0)
            {
                Text(label)
                    .frame(width: 200, height: 35)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .foregroundColor(Color.white)
                    .cornerRadius(18)
                    .shadow(radius: 5)
                    .padding(.leading, 10)
                
                Spacer()
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
                        .font(.system(size: 15)).bold()
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                   }
    
            }
                
            }
        }
    }



struct TrendingCatDetail: View {
    
        @ObservedObject var trendingModel = TrendingCatViewModel()
    
    var body: some View {
        VStack(spacing: 5){
        ScrollView(.vertical){

            HStack(){
                HeaderButton1()
                HeaderButton2()
        }
            
            HStack(){
            
                ScrollView(.vertical){
                   
                if($trendingModel.woofUrl.wrappedValue != false){
                    ForEach(trendingModel.data, id: \.self){data in
                        VStack(spacing: 1){
                            SpineButtonView1(label: data.hash_title!)

                        }
                        
                    }
                }
                
            }
        }
            
    }
            
}.navigationTitle("CATEGORIES")
.onAppear(perform: getTrending)
    Spacer()
}
    

    
    func getTrending(){
        trendingModel.getTrendingData()
    }
}


struct TrendingCatDetail_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCatDetail()
    }
}
