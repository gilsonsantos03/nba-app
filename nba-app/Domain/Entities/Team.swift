import Foundation

public struct Team: Codable {
    let data: [Datum]
    let meta: Meta
}

public struct Datum: Codable {
    let id: Int
    let abbreviation, city, conference, division: String
    let fullName, name: String

    enum CodingKeys: String, CodingKey {
        case id, abbreviation, city, conference, division
        case fullName = "full_name"
        case name
    }
}

public struct Meta: Codable {
    let totalPages, currentPage: Int
    let nextPage: Int?
    let perPage, totalCount: Int

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case perPage = "per_page"
        case totalCount = "total_count"
    }
}
