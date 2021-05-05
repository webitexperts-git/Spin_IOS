//
//  BookEventView.swift
//  Spine
//
//  Created by Aashita Tyagi on 09/04/21.
//

import SwiftUI

struct BookEventView: View {
    var body: some View {
        ZStack(){
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    
        } .background(BackgroundBlurView())
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct BookEventView_Previews: PreviewProvider {
    static var previews: some View {
        BookEventView()
    }
}
