//
//  ViewController.swift
//  TestScroll
//
//  Created by Linhao CUI 崔林豪 on 2022/6/18.
//

import UIKit
//import MarqueeLabel

struct Person {
    var age: Int
    var name: String
    var job : String
}

extension Person: CustomStringConvertible {
    var description: String {
        return "\(age) \(name) \(job)"
    }
}

class ViewController: UIViewController {
    
    private var firstLabel: UILabel?
    
    @IBOutlet weak var markView: UIView!
    
    
    lazy var iconImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "aaa")
        //img.contentMode = .center
        markView.addSubview(img)
        //img.autoLayout(in: contentView, top: 15, bottom: nil, leading: 30, trailing: nil)
        //img.autoLayout(fixingHeight: 24, fixingWidth: 24)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 12.0
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: markView.topAnchor, constant: 15),
            img.leadingAnchor.constraint(equalTo: markView.leadingAnchor, constant: 30),
            img.widthAnchor.constraint(equalToConstant: 24),
            img.heightAnchor.constraint(equalToConstant: 24)
        ])
        img.backgroundColor = .systemGreen
        
        return img
    }()
    
    //mark 图标
    lazy var markIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "111")
        //        img.translatesAutoresizingMaskIntoConstraints = false
        //        stackView.addSubview(img)
        //        NSLayoutConstraint.activate([
        //            img.widthAnchor.constraint(equalToConstant: 60),
        //            img.heightAnchor.constraint(equalToConstant: 60)
        //        ])
        return img
    }()
    
    lazy var bgImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "111")
        img.contentMode = .center
        //        view.addSubview(img)
        //        img.autoLayout(in: view, top: 0, bottom: nil, leading: 0, trailing: 0)
        //        img.autoLayout(fixingHeight: 406, fixingWidth: nil)
        return img
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 10
        stack.addArrangedSubview(markIcon)
        //stack.addArrangedSubview(markIcon.copy() as! UIView)
        stack.addArrangedSubview(bgImageView)
        self.markView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        //let leadConstraint = stack.leadingAnchor.constraint(greaterThanOrEqualTo: endLocationLabel.trailingAnchor, constant: 10)
        NSLayoutConstraint.activate([
            //leadConstraint,
            stack.leadingAnchor.constraint(equalTo: markView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: markView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: markView.bottomAnchor),
            stack.topAnchor.constraint(equalTo: markView.topAnchor)
        ])
        //leadConstraint.priority = .defaultLow
        return stack
    }()
    
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
        print("____")
        _ = tableView
        tableView.frame = view.bounds
        
        
        let ff = Calendar()
        let comps = self.dateComponents([.year, .month], from: date)
            let setp: DateComponents = {
              var s = DateComponents()
              s.setValue(1, for: Calendar.Component.month)
              s.setValue(-1, for: Calendar.Component.second)
              return s
         }()
        now.date(byAdding: setp, to: $0)
        
        
    }
    
}

extension ViewController {
    
    func testStackView() {
        _ = iconImageView
        _ = stackView
    }
    
    
    func testaa() {
        
        var lengthyLabel = MarqueeLabel.init(frame: CGRect(x: 100, y: 300, width: 160, height: 100), duration: 5.0 , fadeLength: 0)
        view.addSubview(lengthyLabel)
        lengthyLabel.speed = .duration(5.0)
        lengthyLabel.type  = .continuous
        lengthyLabel.text = "快捷场景: 下班回家模式 "
        lengthyLabel.backgroundColor = .systemPurple
        self.firstLabel = lengthyLabel
        
        let pp = Person(age: 20, name: "aa", job: "11")
        print(pp)
        
        
        let lab = UILabel()
        lab.backgroundColor = .systemGreen
        lab.text = "shdj"
        lab.frame = CGRect(x: 0, y: 100, width: 90, height: 40)
        view.addSubview(lab)
        
        
        let lab2 = UILabel()
        lab2.backgroundColor = .systemGreen
        lab2.text  = "hahha "
        view.addSubview(lab2)
        lab2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lab2.topAnchor.constraint(equalTo: lab.bottomAnchor, constant: 10),
            //lab2.centerYAnchor.constraint(equalTo: lab.centerYAnchor)
            lab2.centerXAnchor.constraint(equalTo: lab.centerXAnchor)
        ])
        
        self.firstLabel = lab
        let layer = self.firstLabel!.layer
        layer.cornerRadius = 5.0
        
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOpacity = 1.0
        //半径
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
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
        cell.backgroundColor = UIColor.white
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = .systemYellow
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        //点击删除会触发
         print("____shan chu cell")
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //guard let cell = self.feelCell else { return  }
        //cell.topLayer?.frame = cell.bgImageView.bounds
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
    }
    
    
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: UIContextualAction.Style.normal, title: "删除") { [weak self] _, _, complete in
            print("___删除了 cell")
            complete(true)
        }
        //delete.image = UIImage(named: "aaa")
        //delete.imageView!.contentMode = .scaleAspectFill
        //delete.image.contentMode = .scaleAspectFill

        delete.backgroundColor = UIColor.systemGreen
        let action = UISwipeActionsConfiguration(actions: [delete])
        action.performsFirstActionWithFullSwipe = false
        return action
    }
    
    //滑动删除的时候会调用
    func tableView(_ tab: UITableView, willBeginEditingRowAt: IndexPath) {
        print("____开始删除")
        test()
    }
    
    
    
}

/*
 ___sub:___<_UITableViewCellSwipeContainerView: 0x106106bb0; frame = (0 180; 390 90); autoresizesSubviews = NO; layer = <CALayer: 0x281351fe0>>
 ___sub:___<TestScroll.TestCell: 0x102f28640; baseClass = UITableViewCell; frame = (0 90; 390 90); autoresize = W; layer = <CALayer: 0x2813240a0>>
 ___sub:___<TestScroll.TestCell: 0x102f05d90; baseClass = UITableViewCell; frame = (0 0; 390 90); autoresize = W; layer = <CALayer: 0x2813451c0>>
 ___sub:___<_UIScrollViewScrollIndicator: 0x103813100; frame = (384 490.333; 3 261.667); alpha = 0; autoresize = LM; layer = <CALayer: 0x28135ef20>>
 ___sub:___<_UIScrollViewScrollIndicator: 0x103812cd0; frame = (44.3333 791; 301 3); alpha = 0; autoresize = TM; layer = <CALayer: 0x28135edc0>>

 */

extension ViewController {
    //iOS 11 和iOS 12获取删除按钮的方法
    private func test() {
        for subView in tableView.subviews {

            print("___sub:___\(subView)____\(subView.classForCoder)")
            
            //_UITableViewCellSwipeContainerView
            if NSStringFromClass(subView.classForCoder) == "_UITableViewCellSwipeContainerView"{
                for sub in subView.subviews {
                    if NSStringFromClass(sub.classForCoder) == "UISwipeActionPullView" {
                        sub.backgroundColor = .clear
                        if let delBtn: UIButton = sub.subviews.first as? UIButton  {
                            //此处可以拿到删除按钮后做一些相应的操作
                            print(">>>完全自定义___\(delBtn)")
                            delBtn.isHidden = false
                            delBtn.layer.cornerRadius = 9.0
//                            delBtn.layer.masksToBounds = true
                            delBtn.clipsToBounds = true
                        }
                        sub.backgroundColor = .systemRed
                        sub.layer.cornerRadius = 9.0
                        sub.layer.masksToBounds = true
                    }
                }
            }
        }
    }
    
}

extension ViewController {
    
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
        
        lab.text = "这是一个测试文本sdkhfjdfhjdshf说的很对家收到回复就是电话讲课asasasasas"
        //        lab.text = "这是一个文本"
        lab.type = .continuous
        lab.speed = .duration(15.0)
        lab.animationCurve = .easeInOut
        lab.fadeLength = 0
        lab.leadingBuffer = 0
        //暂停横向滚动 true 开始横向滚动 false
        lab.labelize = true
        lab.scrollDuration = 18.0
        lab.animationDelay = 0.0
        
        return lab
    }()
    
    lazy var vv: MNMarqueeView = {
        
        let vv = MNMarqueeView()
        vv.backgroundColor = .white
        contentView.addSubview(vv)
        //vv.frame = self.contentView.bounds
        vv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vv.topAnchor.constraint(equalTo: contentView.topAnchor),
            vv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        return vv
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let vv = UILabel()
        
        if vv is UILabel {
             print("____")
        }
        
        self.subviews.forEach { vv in
             print("______\(vv)")
//            if vv is UITableViewCellSelectedBackground.self {
//                print("+++")
//            }
        }
    }
}
