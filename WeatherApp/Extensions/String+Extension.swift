//
//  String+Extension.swift
//  weatherAppMVP
//
//  Created by MacOS on 08/10/2022.
//

import Foundation

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
    
    func separateIntoParats(separator: Character)->[String] {
        return self.split(separator: separator).map{String($0)}
    }
    
    func hoursFromDate()-> Self{
            let hoursInDetail = (self.split(separator: " ").last)
            guard let hours = hoursInDetail?.split(separator: ":").first else { return  "" }
            return Self.init(hours)
        }
    
    func getDay()->Int{
        let date = self.separateIntoParats(separator: " ").first
        let day = date?.separateIntoParats(separator: "-").last ?? "No Data"
        return Int(day)!
    }
    
  }
