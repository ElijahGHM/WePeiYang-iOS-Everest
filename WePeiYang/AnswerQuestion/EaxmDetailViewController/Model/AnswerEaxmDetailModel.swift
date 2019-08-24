//
//  AnswerEaxmDetailModel.swift
//  WePeiYang
//
//  Created by Elijah on 8/20/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import Foundation

// MARK: - ExamPaper
struct ExamPaper: Codable {
    let head: Head?
    let body: [Body]?
}

// MARK: ExamPaper convenience initializers and mutators

extension ExamPaper {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ExamPaper.self, from: data)
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
        head: Head?? = nil,
        body: [Body]?? = nil
        ) -> ExamPaper {
        return ExamPaper(
            head: head ?? self.head,
            body: body ?? self.body
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Body
struct Body: Codable {
    let id: Int?
    let question, objA, objB, objC: String?
    let objD: String?
    let type: TypeEnum?
    let objE, objF: String?
}

// MARK: Body convenience initializers and mutators

extension Body {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Body.self, from: data)
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
        question: String?? = nil,
        objA: String?? = nil,
        objB: String?? = nil,
        objC: String?? = nil,
        objD: String?? = nil,
        type: TypeEnum?? = nil,
        objE: String?? = nil,
        objF: String?? = nil
        ) -> Body {
        return Body(
            id: id ?? self.id,
            question: question ?? self.question,
            objA: objA ?? self.objA,
            objB: objB ?? self.objB,
            objC: objC ?? self.objC,
            objD: objD ?? self.objD,
            type: type ?? self.type,
            objE: objE ?? self.objE,
            objF: objF ?? self.objF
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum TypeEnum: String, Codable {
    case mc = "mc"
    case sc = "sc"
}

// MARK: - Head
struct Head: Codable {
    let id: Int?
    let name, collegeCode, testTime, duration: String?
    let startedAt, createdAt, updatedAt, isExist: String?
    let endedTime: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case collegeCode
        case testTime
        case duration
        case startedAt
        case createdAt
        case updatedAt
        case isExist
        case endedTime
    }
}

// MARK: Head convenience initializers and mutators

extension Head {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Head.self, from: data)
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
        createdAt: String?? = nil,
        updatedAt: String?? = nil,
        isExist: String?? = nil,
        endedTime: String?? = nil
        ) -> Head {
        return Head(
            id: id ?? self.id,
            name: name ?? self.name,
            collegeCode: collegeCode ?? self.collegeCode,
            testTime: testTime ?? self.testTime,
            duration: duration ?? self.duration,
            startedAt: startedAt ?? self.startedAt,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            isExist: isExist ?? self.isExist,
            endedTime: endedTime ?? self.endedTime
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}








