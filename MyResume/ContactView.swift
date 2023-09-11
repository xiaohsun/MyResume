//
//  ContactView.swift
//  MyResume
//
//  Created by 徐柏勳 on 2023/08/27.
//

import SwiftUI

struct ContactView: View {
    @Binding var isShowing: Bool
    // 不是創立新的 State，而是指向我們需要變動的 State
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "phone.fill")
                    .resizable().aspectRatio(contentMode: .fit).foregroundColor(.white).padding(10)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.brown))
                    .padding(10)
                    .onTapGesture{openUrl(Resume.shared.phoneUrl)}
                
                ForEach(Resume.shared.socialMedia, id: \.name) { media in
                    Image(media.name.lowercased())
                        .resizable().aspectRatio(contentMode: .fit)
                        .padding(10)
                        .onTapGesture {openUrl(media.url)}
                }
            }
            Text("取消").font(.title3).foregroundColor(.secondary).onTapGesture {
               isShowing = false
            }
        }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(uiColor: .tertiarySystemBackground))).padding()
        // 次要顏色，處理深色模式
    }
    
    func openUrl(_ url: String) {
        let url = URL(string: url)!
        
        if  UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
            return
        }
    } // 建立一個打開連結的 func，如果打不開就不要做事（如果那個裝置不能打電話）
    
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(isShowing: .constant(true)).background(.yellow)
    }
}
