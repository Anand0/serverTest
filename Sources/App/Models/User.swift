final class User: Codable {
    var id: Int?
    var name: String
    var username: String
    
    init(name:String,username:String) {
        self.name = name
        self.username = username
    }
}

import FluentSQLite
import Vapor

extension User:SQLiteModel {}

extension User:Content {}
extension User: Migration {}
extension User: Parameter {}
