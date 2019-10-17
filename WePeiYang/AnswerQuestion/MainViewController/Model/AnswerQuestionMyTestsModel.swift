//
//  AnswerQuestionMyTests.swift
//  WePeiYang
//
//  Created by Elijah on 9/5/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import Foundation

// MARK: - MyTests
struct MyTests: Codable {
    let data: [Datum]?
}

// MARK: MyTests convenience initializers and mutators

extension MyTests {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MyTests.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        data: [Datum]?? = nil
        ) -> MyTests {
        return MyTests(
            data: data ?? self.data
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let name, collegeCode, testTime, duration: String?
    let startedAt, endedTime, isExist, createdAt: String?
    let updatedAt, status: String?
    let testedTime: Int?
    let score, stuStatus: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case collegeCode
        case testTime
        case duration
        case startedAt
        case endedTime
        case isExist
        case createdAt
        case updatedAt
        case status
        case testedTime
        case score
        case stuStatus
    }
}

// MARK: Datum convenience initializers and mutators

extension Datum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Datum.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int?? = nil,
        name: String?? = nil,
        collegeCode: String?? = nil,
        testTime: String?? = nil,
        duration: String?? = nil,
        startedAt: String?? = nil,
        endedTime: String?? = nil,
        isExist: String?? = nil,
        createdAt: String?? = nil,
        updatedAt: String?? = nil,
        status: String?? = nil,
        testedTime: Int?? = nil,
        score: String?? = nil,
        stuStatus: String?? = nil
        ) -> Datum {
        return Datum(
            id: id ?? self.id,
            name: name ?? self.name,
            collegeCode: collegeCode ?? self.collegeCode,
            testTime: testTime ?? self.testTime,
            duration: duration ?? self.duration,
            startedAt: startedAt ?? self.startedAt,
            endedTime: endedTime ?? self.endedTime,
            isExist: isExist ?? self.isExist,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            status: status ?? self.status,
            testedTime: testedTime ?? self.testedTime,
            score: score ?? self.score,
            stuStatus: stuStatus ?? self.stuStatus
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
