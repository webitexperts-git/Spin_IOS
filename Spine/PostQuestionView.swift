//
//  PostQuestionView.swift
//  Spine
//
//  Created by Aashita Tyagi on 12/02/21.
//

import SwiftUI


struct PostQuestionView: View {
  
    var body: some View {
        
               ScrollView {
                   LazyHStack {
                       PageView()
                   }
               }
           }
}

struct ColorModel: Identifiable {
    let value: Color
    let id = UUID()
}


struct PageView: View {
    let colors = [
       
        ColorModel(value: Color("firstPostColor")),
        ColorModel(value: Color("secondPostColor")),
        ColorModel(value: Color("thirdColorPost")),
        ColorModel(value: Color("fourthPostColor")),
    ]
    var body: some View {
        TabView {
            ForEach(0..<5) { i in
                ZStack {
//                    Color.black
//                    Text("Row: \(i)").foregroundColor(colors(ColorModel))
                }
//                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            }
            .padding(.all, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .tabViewStyle(PageTabViewStyle())
    }
}
     
    


struct PostQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        PostQuestionView()
    }
}
