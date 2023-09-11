//
//  ContentView.swift
//  MyResume
//
//  Created by 徐柏勳 on 2023/08/24.
//

import SwiftUI

struct ContentView: View {
    let me = Resume.shared
    @State var isShowingContact = false
    // @State 讓軟體知道這是需要做狀態管理的變數
    
    var body: some View {
        ScrollView{
            VStack(spacing:30){
                cardView
                
                Text(me.bio).lineSpacing(10)
                //Text(me[keyPath: \.bio])
                
                Button {
                    isShowingContact = true
                } label: {
                    Text("Contact Me")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.brown))
                }
                // 這種 Button 可以有回饋感、點到整個按鈕都能有反應
                
                
                Text("Skills").font(.title2.bold())
                    .frame(maxWidth: .infinity , alignment: .leading)
                // 對齊左側
                
                skillView
                
                Text("Experiences").font(.title2.bold())
                    .frame(maxWidth: .infinity , alignment: .leading)
                
                expView

                
            }.padding()
                .overlay(Color.black.opacity(isShowingContact ? 0.5 : 0)
                         // 加入黑色遮罩
                    .onTapGesture {isShowingContact = false})
                .overlay(alignment: .top){
                    contactView
                }.animation(.spring(), value: isShowingContact)
            // 加入動畫
        }.background(Color(uiColor: .secondarySystemBackground))
        
    }
    
    // 以下整理成 view
    // MARK: - subViews
    
    var cardView: some View {
        HStack{
            Image("avatar")
                .resizable().aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 200)
            
            VStack(spacing:20){
                Text(me.name)
                    .font(.title).bold()
                Text(me.title)
                Label(me.location, systemImage: "location.fill")
                    .foregroundColor(.secondary)
            }
        }
        
    }
    
    var skillView: some View {
        HStack{
            ForEach(me.skills , id: \.self){ skill in
                VStack{
                    Image(skill.lowercased())
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    Text(skill)
                }
            }.frame(width: 80)
        }
        // id 必須是 Hashable 的資料，self 為使用 skills 的名稱
    }
    
    var expView: some View {
        VStack(spacing: 0){
            ForEach(me.experiences.indices, id: \.self){ index in
                HStack{
                    DotLineshape(lineWidth: 2 ,
                                 dotSize: 10 ,
                                 style: index == 0 ? .bottomHalf : index == me.experiences.count - 1 ? .topHalf : .full)
                    .frame(width: 70).foregroundColor(.secondary)
                    
                    let exp = me.experiences[index]
                    
                    VStack(spacing: 8){
                        Group{
                            Text("\(exp.start) - \(exp.end)").foregroundColor(.secondary)
                            Text(exp.title).font(.title3.bold())
                            Text(exp.company).padding(.bottom, 30)
                        }.frame(maxWidth: .infinity , alignment: .leading)
                        // 用 Group 包成群組
                    }
                }
            }
        }
    }
    
    var contactView: some View {
        Group{
            if (isShowingContact){
                ContactView(isShowing: $isShowingContact)
                // 告訴它與哪個 Binding 有連結
                    .offset(y: UIScreen.main.bounds.maxY * 0.33)
                    .transition(.slide)
        }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
