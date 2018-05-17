import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    router.post(User.self, at:"users"){ req, user -> Future<User> in
        return user.save(on: req)
        
    }
    router.get("users"){ req -> Future<[User]> in
        
        return User.query(on: req).all()
        
    }
    
    router.get("users",User.parameter) { req -> Future<User> in
        
       let user = try req.parameters.next(User.self)
        return user
    }
}
