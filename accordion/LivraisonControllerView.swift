//
//  LivraisonControllerView.swift
//  accordion
//
//  Created by MacOtwoo3 on 08/07/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class LivraisonControllerView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView:UITableView!
    var stackView:UIView!
    var etapeBtn:UIButton!
    var validateBtn:UIButton!
    var cells = [CellView]()
    
    @IBOutlet weak var nextStep: UIButton!
    
    var lastCell:StackViewCell = StackViewCell()
    var featureView = FeatureView.accessibilityContainerType()
    var t_count:Int = 0
    var button_tag:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //if let featureView2 = Bundle.main.loadNibNamed("FeatureView", owner: self, options: nil)?.first as? FeatureView{
        //self.view.addSubview(featureView2)
        //}
        
        cells.append(CellView(title:"Acheté à", icon:nil, expandable:true, viewName:"MatiereView"))
        cells.append(CellView(title:"Expédié depuis", icon:nil, expandable:true, viewName:"DimensionView"))
        cells.append(CellView(title:"Expédié en", icon:nil, expandable:true, viewName:"ColorView"))
        cells.append(CellView(title:"Livré sous", icon:nil, expandable:true, viewName:"TailleView"))
        
        tableView = UITableView(frame:view.frame)
        tableView.layer.frame.size.height = view.frame.height*1.5
        tableView.frame.origin.y += 60
        tableView.register(UINib(nibName:"StackViewCell",bundle:nil), forCellReuseIdentifier:"StackViewCell")
        tableView.register(UINib(nibName:"FeatureViewCell",bundle:nil), forCellReuseIdentifier:"FeatureViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .singleLine
        view.addSubview(tableView)
        addBottomMenu()
        appendNavigationItem()
    }
    
    @objc func gotonextPage(sender:UIButton){
        print("Go to Next page")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Sell") as! SellControllerView
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func appendNavigationItem(){
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 100))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "3 - Livraison");
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "close"), for: .normal)
        backbutton.addTarget(self, action: Selector(("backAction")), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        navBar.setItems([navItem], animated: false);
    }
    
    func backAction() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    func addBottomMenu(){
        let viewToLoad = Bundle.main.loadNibNamed("Menu", owner: self, options: nil)?.first as? MenuController
        viewToLoad?.frame = CGRect(x: 0, y: view.frame.maxY - 50, width: view.frame.width, height: 50)
        viewToLoad?.validateBtn.addTarget(self, action: #selector(gotonextPage(sender:)), for: .touchUpInside)
        viewToLoad?.text.text = "ETAPE 3"
        view.addSubview(viewToLoad! as UIView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected", indexPath)
    }
    
    func getValueFromEachSection(value:String, selector:Int){
        //let indexPath = IndexPath(row: 0, section: 0)
        print(value, cells.count)
    }
    
    /*func viewToLoadFunc(cell:UIView, viewLoad:UIView, indexPath:IndexPath){
     let viewToLoad = Bundle.main.loadNibNamed(cells[indexPath.row].viewName!, owner: self, options: nil)?.first as UIView
     cell.addSubview(viewToLoad! as UIView)
     viewToLoad?.frame = CGRect(x: 0, y: 0, width: cell.stuffView.frame.width, height: cell.stuffView.frame.height)
     }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == button_tag {
            return 320
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StackViewCell", for: indexPath) as! StackViewCell
        print("loading...")
        if !cell.cellExists{
            cell.open.setTitle(cells[indexPath.row].title, for: .normal)
            cell.icon.image = cells[indexPath.row].icon
            if cells[indexPath.row].expandable{
                switch cells[indexPath.row].viewName{
                case "CategorieView"?:
                    let viewToLoad = Bundle.main.loadNibNamed(cells[indexPath.row].viewName!, owner: self, options: nil)?.first as? CategorieView
                    cell.stuffView.addSubview(viewToLoad! as UIView)
                    viewToLoad?.frame = CGRect(x: 0, y: 0, width: cell.stuffView.frame.width, height: cell.stuffView.frame.height)
                case "CollectionView"?:
                    let viewToLoad = Bundle.main.loadNibNamed(cells[indexPath.row].viewName!, owner: self, options: nil)?.first as? CollectionView
                    cell.stuffView.addSubview(viewToLoad! as UIView)
                    viewToLoad?.frame = CGRect(x: 0, y: 0, width: cell.stuffView.frame.width, height: cell.stuffView.frame.height)
                case "CodeProduitView"?:
                    let viewToLoad = Bundle.main.loadNibNamed(cells[indexPath.row].viewName!, owner: self, options: nil)?.first as? CodeProduitView
                    cell.stuffView.addSubview(viewToLoad!)
                    viewToLoad?.frame = CGRect(x: 0, y: 0, width: cell.stuffView.frame.width, height: cell.stuffView.frame.height)
                    
                case "DescriptionView"?:
                    let viewToLoad = Bundle.main.loadNibNamed(cells[indexPath.row].viewName!, owner: self, options: nil)?.first as? DescriptionView
                    cell.stuffView.addSubview(viewToLoad!)
                    viewToLoad?.frame = CGRect(x: 0, y: 0, width: cell.stuffView.frame.width, height: cell.stuffView.frame.height)
                    
                case "DescriptionView"?:
                    let viewToLoad = Bundle.main.loadNibNamed(cells[indexPath.row].viewName!, owner: self, options: nil)?.first as? DescriptionView
                    cell.stuffView.addSubview(viewToLoad!)
                    viewToLoad?.frame = CGRect(x: 0, y: 0, width: cell.stuffView.frame.width, height: cell.stuffView.frame.height)
                case "NoteView"?:
                    let viewToLoad = Bundle.main.loadNibNamed(cells[indexPath.row].viewName!, owner: self, options: nil)?.first as? NoteView
                    cell.stuffView.addSubview(viewToLoad!)
                    viewToLoad?.frame = CGRect(x: 0, y: 0, width: cell.stuffView.frame.width, height: cell.stuffView.frame.height)
                default:
                    print("Inconnu")
                }
                
                
                cell.open.addTarget(self, action: #selector(cellOpened(sender:)), for: .touchUpInside)
            }
            
            cell.open.tag = t_count
            t_count+=1
            cell.cellExists = true
        }
        
        UIView.animate(withDuration: 0) {
            cell.contentView.layoutIfNeeded()
        }
        
        return cell
    }
    
    @objc func cellOpened(sender:UIButton){
        self.tableView.beginUpdates()
        
        let previousCellTag = button_tag
        
        if lastCell.cellExists{
            self.lastCell.animate(duration:0.2, c:{
                self.view.layoutIfNeeded()
            })
        }
        
        if sender.tag == button_tag{
            button_tag = -1
            lastCell = StackViewCell()
        }
        
        if sender.tag != previousCellTag {
            button_tag = sender.tag
            lastCell = tableView.cellForRow(at: IndexPath(row: button_tag, section: 0)) as! StackViewCell
            
            self.lastCell.animate(duration: 0.2, c: {
                self.view.layoutIfNeeded()
            })
        }
        
        self.tableView.endUpdates()
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}



