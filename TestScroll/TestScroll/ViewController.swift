//
//  ViewController.swift
//  TestScroll
//
//  Created by Linhao CUI 崔林豪 on 2022/6/18.
//

import UIKit
//import MarqueeLabel

class ViewController: UIViewController {
    let strings = ["When shall we three meet again in thunder, lightning, or in rain? When the hurlyburly's done, When the battle 's lost and won.",
                   "I have no spur to prick the sides of my intent, but only vaulting ambition, which o'erleaps itself, and falls on the other.",
                   "Double, double toil and trouble; Fire burn, and cauldron bubble.",
                   "By the pricking of my thumbs, Something wicked this way comes.",
                   "My favorite things in life don't cost any money. It's really clear that the most precious resource we all have is time.",
                   "Be a yardstick of quality. Some people aren't used to an environment where excellence is expected."]
    
     lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.register(UINib.init(nibName: "VehicleAuthorizationEditCell", bundle: Bundle.vehicle), forCellReuseIdentifier: VehicleAuthorizationEditCell.identifier)
        tableView.register(TestCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        return tableView
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = tableView
        tableView.frame = view.bounds
        
        var lengthyLabel = MarqueeLabel.init(frame: CGRect(x: 100, y: 300, width: 160, height: 100), duration: 5.0 , fadeLength: 0)
        view.addSubview(lengthyLabel)
        lengthyLabel.speed = .duration(20.0)
        lengthyLabel.type  = .continuous
        lengthyLabel.text = "快捷场景: 下班回家模式啊, "
        lengthyLabel.backgroundColor = .systemPurple
        
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
   
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TestCell
    
        // Set background, to improve scroll performance
        cell.backgroundColor = UIColor.white
         if indexPath.row % 2 == 0 {
             cell.contentView.backgroundColor = .systemYellow
         }
         
         /*
          var lengthyLabel = MarqueeLabel.init(frame: CGRect(x: 100, y: 700, width: 160, height: 100), duration: 5.0, fadeLength: 0)
          view.addSubview(lengthyLabel)
          
          lengthyLabel.type  = .continuous
          lengthyLabel.text = "快捷场景: 下班回家模式啊, "
          lengthyLabel.backgroundColor = .systemPurple
          
          */
         

//         cell.label.text = "这是一个测试文本sdkhfjdfhjdshf时代俊峰海底世界时间飞逝绝地逢生多久手机防盗封建时代好世纪东方九十多斤手机风华爵士电话分机"
//         cell.label.type = .continuous
//         cell.label.speed = .duration(15.0)
//         cell.label.animationCurve = .easeInOut
//         cell.label.fadeLength = 0
//         cell.label.leadingBuffer = 0
//         //暂停横向滚动 true 开始横向滚动 false
//         cell.label.labelize = false
         
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       90
    }
    
}



class TestCell: UITableViewCell {
    lazy var label: MarqueeLabel = {
        let lab = MarqueeLabel()
        //lab.font = .nio(1, category: .headLine)
        //lab.textColor = .mp(.mb1)
        lab.text = "新功能【一键启动】"
        contentView.addSubview(lab)
        //lab.autoLayout(in: bgView, top: 115, bottom: nil, leading: 25, trailing: nil)
        //lab.backgroundColor = .systemPurple
        lab.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lab.topAnchor.constraint(equalTo: contentView.topAnchor),
            lab.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lab.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lab.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        lab.text = "这是一个测试文本sdkhfjdfhjdshf时代俊峰海底世界时间飞逝绝地逢生多久手机防盗封建时代好世纪东方九十多斤手机风华爵士电话分机"
        lab.type = .continuous
        lab.speed = .duration(15.0)
        lab.animationCurve = .easeInOut
        lab.fadeLength = 0
        lab.leadingBuffer = 0
        //暂停横向滚动 true 开始横向滚动 false
        lab.labelize = false
        
        return lab
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    func initViews() {
        _ = label
    }
    
    
}
