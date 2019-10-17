//
//  AnswerQuestionAPI.swift
//  WePeiYang
//
//  Created by Elijah on 8/20/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import Foundation
import Alamofire

struct AnswerQuestionAPI {
    static let root = "https://theory-new.twtstudio.com/index.php"
    static let paper = "/api/random?paper_id=\(testInfo.id)"
    static let test = "/api/getTests"
    static let score = "/api/score"
//    static let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIyMzU2LCJpc3MiOiJodHRwczovL29wZW4udHd0c3R1ZGlvLmNvbS9hcGkvdjIvYXV0aC9zc28vY2FsbGJhY2siLCJpYXQiOjE1Njg0NDg2NTgsImV4cCI6MTU2OTA1MzQ1OCwibmJmIjoxNTY4NDQ4NjU4LCJqdGkiOiIySDFQQkZJMmZabk5pVXBMIn0.HmQ06q-kJ4D3Tt4seyuoFRfFRlLlIA_TYLEr3xeG1VM"
}

struct getPaperHelper {
    
//    static func getToken(username: String, password: String, success: ((String) -> Void)?, failure: ((String) -> Void)?) {
//        let para: [String: String] = ["twtuname": username, "twtpasswd": password]
//        SolaSessionManager.solaSession(type: .get, baseURL: "https://open.twtstudio.com/api/v2", url: "/auth/token/get", token: nil, parameters: para, success: { dic in
//            if let data = dic["data"] as? [String: Any],
//                let token = data["token"] as? String {
//                success?(token)
//            } else {
//                failure?(dic["message"] as? String ?? "解析失败 请稍候重试")
//            }
//        }, failure: { error in
//            failure?(error.localizedDescription)
//        })
//        
//    }
    
    static func getTests(success: @escaping (MyTests)->(), failure:  @escaping (Error)->()) {
        
        SolaSessionManager.solaSession(baseURL: AnswerQuestionAPI.root, url: AnswerQuestionAPI.test, token: TwTUser.shared.token, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let tests = try?                 MyTests(data: data){
                success(tests)
                print("网络请求成功")
            }
        }, failure: { _ in
            print("网络请求失败")
        })
    }
    
    static func getpaper(success: @escaping (ExamPaper)->(), failure: @escaping (Error)->()) {
        SolaSessionManager.solaSession(baseURL: AnswerQuestionAPI.root, url: AnswerQuestionAPI.paper, token: TwTUser.shared.token, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let paper = try? ExamPaper(data: data) {
                success(paper)
                print("网络请求成功")
            }
        }, failure: { _ in
            print("网络请求失败")
            
        })

    }
}

