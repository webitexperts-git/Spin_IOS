//
//  TrendingCatDetail.swift
//  Spine
//
//  Created by apple on 07/12/20.
//

import SwiftUI

struct TrendingCatDetail: View {
    var body: some View {
        ScrollView(.vertical){
        VStack(alignment:.leading){
            HStack(spacing: 5){
            NavigationLink(destination: Home()){
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
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255), lineWidth: 2)
//                       )
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
        }
            
            HStack(spacing:15){
            NavigationLink(destination: Home()){
                Text("LIFE TRANSFORMATION")
                    .padding()
//                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .cornerRadius(18)
                    .padding()
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
//                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 20)
                           .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color.gray, lineWidth: 2)
//                       )
                   }

                }
            }
            
            HStack(spacing:100){
            NavigationLink(destination: Home()){
                Text("MEDITATION")
                    .padding()
//                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .cornerRadius(18)
                    
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                    Text("+FOLLOW").bold()
//                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 20)
                        .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color.gray, lineWidth: 2)
//                       )
                   }

                }
            }
            
            HStack(spacing:.infinity){
            NavigationLink(destination: Home()){
                Text("MEDITATION")
                    .padding()
//                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .cornerRadius(18)
                    .padding()
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
//                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 20)
                           .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color.gray, lineWidth: 2)
//                       )
                   }

                }
            }
            
            HStack(spacing:.infinity){
            NavigationLink(destination: Home()){
                Text("MEDITATION")
                    .padding()
//                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .cornerRadius(18)
                    .padding()
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
//                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 20)
                           .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color.gray, lineWidth: 2)
//                       )
                   }

                }
            }
            
            HStack(spacing:.infinity){
            NavigationLink(destination: Home()){
                Text("MEDITATION")
                    .padding()
//                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .cornerRadius(18)
                    .padding()
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
//                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 20)
                           .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color.gray, lineWidth: 2)
//                       )
                   }

                }
            }
            
            HStack(spacing:.infinity){
            NavigationLink(destination: Home()){
                Text("MEDITATION")
                    .padding()
//                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .cornerRadius(18)
                    .padding()
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
//                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 20)
                           .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color.gray, lineWidth: 2)
//                       )
                   }

                }
            }
            
            HStack(spacing:.infinity){
            NavigationLink(destination: Home()){
                Text("MEDITATION")
                    .padding()
//                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .cornerRadius(18)
                    .padding()
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
//                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 20)
                           .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color.gray, lineWidth: 2)
//                       )
                   }

                }
            }
            
            HStack(spacing:.infinity){
            NavigationLink(destination: Home()){
                Text("MEDITATION")
                    .padding()
//                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                    .cornerRadius(18)
                    .padding()
                
                Button(action: {
                       print("sign up bin tapped")
                   }) {
                       Text("+FOLLOW")
//                           .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 20)
                           .font(.system(size: 15))
                           .padding()
                           .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 18)
//                                   .stroke(Color.gray, lineWidth: 2)
//                       )
                   }

                }
            }
            
            
        }.navigationTitle("CATEGORIES")
        Spacer()
    }
    }
}

struct TrendingCatDetail_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCatDetail()
    }
}
