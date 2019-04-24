//
//  ViewController.swift
//  eight-day-ColorGradient
//
//  Created by MacBook Pro on 2019/4/21.
//  Copyright © 2019年 MacBookPro. All rights reserved.
//

import UIKit
import SnapKit
var timeLabel : UILabel!
var temperatureLabel : UILabel!
var gradientLayer :CAGradientLayer!


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
    cell.backgroundColor = UIColor.yellow
    cell.textLabel?.text = "12345"
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(gradientLayer)
//
//        gradientLayer.colors = [UIColor.red.cgColor,UIColor.blue.cgColor,UIColor.white.cgColor];
//
//       let gradientLocations:[NSNumber] = [0.0,0.8,1.0]
//
//        gradientLayer.locations = gradientLocations
//
//        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
//
//        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
//
//        timeLabel = UILabel(frame: CGRect(x: 50, y: 40, width: 100, height: 100))
//        timeLabel.text = "1:00"
//        timeLabel.textColor = UIColor.white
//        timeLabel.font = UIFont.systemFont(ofSize: 28)
//        self.view.addSubview(timeLabel)
//
//        temperatureLabel = UILabel(frame: CGRect(x: 250, y: 40, width: 100, height: 100))
//        temperatureLabel.text = "18 ℃"
//        temperatureLabel.textColor = UIColor.white
//        temperatureLabel.font = UIFont.systemFont(ofSize: 28)
//        self.view.addSubview(temperatureLabel)
        
        
       
        //原理同文字渐变色，但是使用的是透明度渐变。依然为容器view设置遮罩，主要代码如下
        
        let containerView = UIView.init(frame: CGRect.init(x: 0, y: 150, width: view.frame.size.width, height: view.frame.size.height-150))
        view.addSubview(containerView)
        
        let tableview = UITableView()
        
        tableview.frame = containerView.bounds
       // tableview.backgroundColor = .clear
      tableview.backgroundColor = UIColor.red
        tableview.separatorStyle = .none
        tableview.rowHeight = 30
        //tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    //设置重用ID
        tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        tableview.dataSource = self
        tableview.delegate = self
        containerView.addSubview(tableview)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.0).cgColor,
                                UIColor.black.cgColor]
        gradientLayer.frame = containerView.frame
        gradientLayer.locations = [0,0.15,1]
        containerView.layer.mask = gradientLayer
        _ = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.0).cgColor,
                                UIColor.black.cgColor]
        gradientLayer.frame = containerView.frame
        gradientLayer.locations = [0,0.15,1]
        containerView.layer.mask = gradientLayer
    }


}

