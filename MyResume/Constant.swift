//
//  Constant.swift
//  MyResumeApp
//
//  Created by Jane Chao on 22/04/20.
//

import Foundation

typealias Experience = (title: String, company: String, start: String, end: String)

struct Resume {
    static let shared = Resume()
    let name     = "Bobby Hsu"
    let title    = "Front-end Developer"
    let location = "位置：台灣"
    let bio      = "見習轉職生，正在體會前端的美好中，未來還請多多指教 🙋🏻‍♂️ "
    let skills   = ["CSS", "HTML", "JS", "Swift"]
    let experiences: [Experience] = [("iOS 學習之旅",
                                      "",
                                      "2023 年 8 月",
                                      "現在"),
                                     ("前端學習之旅",
                                      "",
                                      "2022 年 10 月",
                                      "現在"),
                                     ("兼職譯者",
                                      "Coupang 酷澎",
                                      "2022 年 10 月",
                                      "2023 年 3 月"),
                                     ("交換學生",
                                      "韓國釜山大學",
                                      "2022 年 2 月",
                                      "2022 年 8 月"),
                                     ("內容行銷實習生",
                                      "Dcard",
                                      "2021 年 7 月",
                                      "2022 年 1 月"),
                                     ("創立 Podcast 音樂劇",
                                      "疤比唱聊室 B.B Musical",
                                      "2020 年 8 月",
                                      "2021 年 6 月")
    ]
    let phoneUrl = "tel://0972955561"
    let socialMedia: [(name: String, url: String)] = [("Instagram","https://www.instagram.com/xiaohsun/"),
                                                      ("Line","https://line.me/ti/p/uOKzu_63fn"),
                                                      ("Podcast","https://podcasts.apple.com/podcast/id1526263711")]
}

