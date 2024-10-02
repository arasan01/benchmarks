import Foundation
import Vapor

let myos = ProcessInfo.processInfo.operatingSystemVersionString

let app = try Application(.detect())
app.http.server.configuration.hostname = "0.0.0.0"
app.http.server.configuration.port = 9000
defer { app.shutdown() }

app.get { _ in "Hello World, from \(myos)\n" }
app.get("ping") { _ in "pong" as StaticString }

try app.run()
