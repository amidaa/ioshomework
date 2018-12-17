//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
//自定制视图：
//从UIView中派生一个自定制的View；
//绘制一个椭圆（或则自己喜欢的任何图形）；
//新建视图对象并进行显示；
class TriangleView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: CGRect(x: 40, y: 40, width: 100, height: 160))
//        path.move(to: CGPoint(x:rect.size.width/2,y:0))
//        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
//        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
//        path.addClip()
        path.close()//封闭线条
        UIColor.yellow.setFill()//用黄色填充
        path.fill()//填充
    }
}
class Controller: UIViewController {//自定义视图控制器
    var triangleView:TriangleView!
    override func loadView() {
        view = UIView(frame: CGRect(x: 100, y: 20, width: 800, height: 800))
        view.backgroundColor = UIColor.green
        triangleView = TriangleView(frame: CGRect(x: 100, y: 200, width: 200, height: 400))
        triangleView.backgroundColor = UIColor.clear
        view.addSubview(triangleView)
        self.view = view
    }
}

//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = Controller()
