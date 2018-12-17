//: Playground - noun: a place where people can play

import UIKit
enum MyError:Error{
    case ZERO
    case NotURL
}

guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
    else{
        throw MyError.NotURL
}
let jsondata = try Data(contentsOf:weatherUrl)
let json = try!JSONSerialization.jsonObject(with:jsondata,options:.allowFragments)
guard let dic = json as?[String:Any] else{
    throw MyError.NotURL
}
if let weather = dic["weatherinfo"] as? [String:Any]{
    let cityid = weather["cityid"]!
    let city = weather["city"]!
     let temp1 = weather["temp1"]!
     let img1 = weather["img1"]!
    print("城市代码:\(cityid) 城市名称\(city) 城市天气\(temp1) 城市图片\(img1)")
}

