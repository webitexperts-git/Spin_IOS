//
//  PostHashTagView.swift
//  Spine
//
//  Created by Aashita Tyagi on 23/02/21.
//

import SwiftUI

struct PostHashTagView: View {
    @State var tag:Int? = 0
//    @State private var hash = ""
    @State private var placeholder = "Enter up to 5 hastags, e.g. #lorem #lorem"
    @ObservedObject var hashTags = HashTags()
    var body: some View {
        ZStack{
//        Text("ADD HASHTAGS")
            if hashTags.hash.isEmpty {
                
                VStack() {
                   Text(placeholder)
                    .font(.custom("Helvetica", size: 34))
                    .foregroundColor(.gray)
                    .padding(.all)
                   Spacer()
                }

            }
            
            TextEditor(text: $hashTags.hash)
                .font(.custom("Helvetica", size: 34))
                .foregroundColor(.black)
                .padding(.all)
               
            
        }.navigationTitle("ADD HASHTAGS")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationLink(destination: PostPreviewView(), tag: 1, selection: $tag) {
                  Button("Next") {
                      self.tag = 1
                  }
                        }
        }
        }
    }


struct PostHashTagView_Previews: PreviewProvider {
    static var previews: some View {
        PostHashTagView()
    }
}
