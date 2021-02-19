//
//  TrendingCatDetail.swift
//  Spine
//
//  Created by apple on 07/12/20.
//

import SwiftUI
//import Combine


struct SpineButtonView1: View {
    @State var label: String
    @ObservedObject var trendingModel = TrendingCatViewModel()

    var body: some View {
        ZStack {
            
          
            HStack(spacing: 5)
            {
                Text(label)
                    .frame(width: 200, height: 35)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .foregroundColor(Color.white)
                    .cornerRadius(18)
                    .shadow(radius: 5)
                
                Spacer()
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
                           .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                   }
    
            }
                
            }
        }
    }



struct TrendingCatDetail: View {
    
//        var trending: TrendingCatModel.Data
        @ObservedObject var trendingModel = TrendingCatViewModel()
    
    var body: some View {
        ScrollView(.vertical){
       
            HStack(){
           
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("All")
                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 18)
                           .font(.system(size: 18))
                           .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                        .cornerRadius(18)
//
                   }
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                    Text("Trending")
                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight:18)
                           .font(.system(size: 18))
                           .padding()
                           .foregroundColor(.gray)
                           .overlay(
                               RoundedRectangle(cornerRadius: 18)
                                   .stroke(Color.gray, lineWidth: 2)
                       )
                   }

                
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
