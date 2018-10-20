//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
//1.    文件缓存处理：
//    判断沙盒的Document目录下是否存在某文件夹，如果没有则新建一个该文件夹；
//b)    判断是否该文件夹下存在一个图片文件，如果存在该文件，读取该文件到一个图片对象中并进行显示，如果不存在则从网上下载一张图片并保存/到该图片文件中。
var image:UIImage?
let fileManager = FileManager.default
if var docpath = fileManager.urls(for:.documentDirectory,in :.userDomainMask).first{
    docpath.appendPathComponent("image")//图片文件夹
    print(docpath)
    if fileManager.fileExists(atPath: docpath.path){//文件夹是否存在
        if  fileManager.fileExists(atPath: "photo.png"){//文件是否存在
            let data = try Data(contentsOf: docpath)
             image = UIImage(data:data)
        }else{
            let url = URL(string: "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1680003337,926266018&fm=173&app=25&f=JPEG?w=639&h=412&s=F68AB54586823EE4EC39F5070300A0E0")!
            let data1 = try! Data(contentsOf: url)
            try?data1.write(to: docpath)//将图片存到该文件夹›中
            image = UIImage(data: data1)!
            
        }
    }else{//如果文件夹不存在则新建该文件夹
        try fileManager.createDirectory(atPath: docpath.path, withIntermediateDirectories: true, attributes: nil)
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .blue
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 300, height: 300))
        imageView.image = image
        view.addSubview(imageView)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
