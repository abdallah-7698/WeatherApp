import Foundation

struct WeatherCity : Codable {
    let id : Int?
    let name : String?
    let main : Temp
    let wind : Wind
    let weather : [Weather]
    let dt_txt : String?
}

struct Weather : Codable {
    let id : Int
    let main : String
    let description : String
}

struct Temp : Codable {
    var temp : Double
    var temp_min : Double
    var temp_max : Double
}

struct Wind : Codable{
    let speed : Double
}

struct ForecacastCity : Codable{
    let list : [WeatherCity]
    let city : City
}

struct City : Codable{
    let id : Int
    let name : String
}
