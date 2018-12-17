import UIKit
import PlaygroundSupport

class MyView:UIView {
    override func draw(_ rect:CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.close()
        UIColor.yellow.setStroke()
        UIColor.green.setFill()
        path.fill()
    }
}
    
class Controller:UIViewController{
    var label:UILabel!
    var triangle:MyView!
    @IBAction func clicked(){ //生成点击事件
        print("i am clicked")
        label?.text = "i am clicked!!"
        UIView.animate(withDuration: 1){
            self.triangle.center = CGPoint(x: 200, y: 0)
        }
    }
    override func loadView() { //加载视图
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
        view.backgroundColor = UIColor.lightGray
        label = UILabel(frame: CGRect(x: 100, y: 20, width: 200, height: 50))
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "hello,word"
        view.addSubview(label)
        let imageUrl = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540030557483&di=5d78e09d2d71a7c131e4a37cf75f6ca0&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Da74c4e8d007b020818c437a20ab098a6%2F7af40ad162d9f2d39e6642c7a3ec8a136327cca7.jpg")!
        let data = try! Data(contentsOf: imageUrl)  //保证成功
        let image = UIImage(data: data)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 200, width: 400, height: 400))//coder只能在文件里使用
        imageView.image = image
        view.addSubview(imageView)
        //添加按钮
        let button = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 50))
        button.backgroundColor = UIColor.brown
        button.setTitle("clicked me", for: .normal)
        button.addTarget(self, action: #selector(Controller.clicked), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        //画图
        triangle = MyView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        triangle.backgroundColor = UIColor.clear
        view.addSubview(triangle)
    }
}
let ct = Controller()
PlaygroundPage.current.liveView = ct
