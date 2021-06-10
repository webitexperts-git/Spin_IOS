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
    @State var post = ""
    @State var hashTag = ""
    var body: some View {
        if #available(iOS 14.0, *) {
            ZStack{
                //        Text("ADD HASHTAGS")
                if hashTag.isEmpty {
                    
                    VStack() {
                        Text(placeholder)
                            .font(.custom("Helvetica", size: 34))
                            .foregroundColor(.gray)
                            .padding(.all)
                        Spacer()
                    }
                    
                }
                
                TextEditor(text: $hashTag)
                    .font(.custom("Helvetica", size: 34))
                    .foregroundColor(.black)
                    .padding(.all)
                
                
            }.navigationTitle("ADD HASHTAGS")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: PostPreviewView(postPreview: post, hashTag: hashTag), tag: 1, selection: $tag) {
                    Button("Next") {
                        self.tag = 1
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
        }
    }


struct PostHashTagView_Previews: PreviewProvider {
    static var previews: some View {
        PostHashTagView()
    }
}
