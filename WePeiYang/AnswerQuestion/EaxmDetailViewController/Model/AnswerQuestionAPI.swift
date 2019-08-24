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
    static let root = "http://theory-new.twtstudio.com"
    static let paper = "/api/random?paper_id=1"
}

struct Helper {
    static func dataManager(url: String, success: (([String: Any])->())? = nil, failure: ((Error)->())? = nil)  {
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value  {
                    if let dict = data as? [String: Any] {
                        success?(dict)
                        log("请求成功")

                    }
                }
            case .failure(let error):
                failure?(error)
                if let data = response.result.value  {
                    if let dict = data as? [String: Any],
                        let errmsg = dict["message"] as? String {
                        print(errmsg)
                        log("请求失败")
                    }
                } else {
                    print(error)
                }
            }
        }
    }
}

struct getPaperHelper {
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - success: <#success description#>
    ///   - failure: <#failure description#>
    static func getpaper(success: @escaping (ExamPaper)->(), failure: @escaping (Error)->()) {
        let Url = AnswerQuestionAPI.root + AnswerQuestionAPI.paper
        Helper.dataManager(url: Url, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let paper = try? ExamPaper(data: data) {
                success(paper)
                print("网络请求成功")
            }
        }, failure: { _ in
            print("网络请求失败")
            
        })
    }
}

struct questionType {
    static let type0 = "sc" // 单选
    static let type = "mc" // 多选
}



