 //
 //  RunScreen.swift
 //  HotSeatEhs
 //
 //  Created by Andrea on 12/29/18.
 //  Copyright © 2018 district196.org. All rights reserved.
 //
 
 import UIKit
 
 var groups: Int!
 var people: Int!
 var colors: [String]!

 
 class RunScreen: UIViewController, UICollectionViewDataSource {
    
    @IBAction func history(_ sender: Any) {
        whiteOut()
        History().callHistory()
    }
    @IBOutlet weak var perName: UILabel!
    
    @IBOutlet weak var runCollection: UICollectionView!
    var collectionCell: [Seat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = list[classIndex].name
        let colNum = list[classIndex].columnDimension!
        let s = collectionView.frame.size
        let sC = (s.width) / (CGFloat(colNum + 2))
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: sC, height: sC)
        perName.text = name
        groups = 5
        people = 7
        colors = ["red","green","yellow","blue","purple","cyan","magenta","orange","lightGray"]
        NotificationCenter.default.addObserver(self, selector: #selector(loadGroup), name: NSNotification.Name(rawValue: "loadGroup"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadHistory), name: NSNotification.Name(rawValue: "loadHistory"), object: nil)
    }
    
    @objc func loadHistory(notification: NSNotification){
        //load data here
        runCollection.reloadData()
    }
    
    
    @objc func loadGroup(notification: NSNotification){
        //load data here
        makeGroups()
        runCollection.reloadData()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionCell = list[classIndex].seatingChart
        return collectionCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = list[classIndex]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RunScreenCollectionViewCell", for: indexPath) as! RunScreenCollectionViewCell
        let s = collection.seatingChart[indexPath.row]
        cell.backgroundColor = UIColor.white
        if s.studentName != ""{
            cell.cellID.text = s.studentName
        }
        else{
            cell.cellID.text = s.id
            
        }
        let color = s.backColor as! String
        
        cell.backgroundColor = stringToColor(color)
        
        return cell
    }
    
    
    func onSave (_ g: UITextField, _ p: UITextField) -> Void {
        groups = Int(g.text!)
        people = Int(p.text!)
    }
    var rand: Int!
    var rowStart : Int!
    var runSeatCountOld = 0
    var runSeatCountNew = 0
    var runRowCountOld = 0
    var runRowCountNew = 0
    var runColCountOld = 0
    var runColCountNew = 0
    var runGroupCountOld = 0
    var runGroupCountNew = 0
    func whiteOut(){
        for i in stride(from: 0, through: list[classIndex].seatingChart.count-1, by: 1){
            list[classIndex].seatingChart[i].backColor = "white"
        }
    }
    
    @IBAction func runButton(_ sender: Any) {
        whiteOut()
        if groupChosen == "Single Seat" {
            if runSeatCountOld < runSeatCountNew{
                historyS = rand
                runSeatCountOld += 1
            }
            rand = Int.random(in: 0...list[classIndex].seatingChart.count - 1)
            let cell = list[classIndex].seatingChart[rand]
            runSeatCountNew += 1
            cell.backColor = "red"
            runCollection.reloadData()
            //performSegue(withIdentifier: "SingleSeatSegue", sender: self)
        }
        else if groupChosen == "Row" {
            
            let rand = Int.random(in: 0...list[classIndex].rowDimension - 1)
            if runSeatCountOld < runSeatCountNew{
                historyR = rowStart
                runRowCountOld += 1
            }
            rowStart = list[classIndex].columnDimension * rand
            for i in 0...list[classIndex].columnDimension - 1 {
                let cell = list[classIndex].seatingChart[rowStart+i]
                cell.backColor = "red"
            }
            runRowCountNew += 1
            runCollection.reloadData()
            
            //performSegue(withIdentifier: "RowColumnSegue", sender: self)
        }
        else if groupChosen == "Column"{
            if runColCountOld < runColCountNew{
                historyC = rand
                runSeatCountOld += 1
            }
            rand = Int.random(in: 0...list[classIndex].columnDimension - 1)
            runColCountNew += 1
            for i in 0...list[classIndex].rowDimension - 1 {
                let cell = list[classIndex].seatingChart[rand+(list[classIndex].columnDimension*i)]
                print(cell.id)
                cell.backColor = "red"
            }
            runCollection.reloadData()
        }
        else if groupChosen == "Random Group"{
            performSegue(withIdentifier: "GroupPropertiesPopUp", sender: self)
        }
    }
    func makeGroups(){
        var seats = list[classIndex].seatingChart
        for _ in 0...seats.count*list[classIndex].rowDimension{
            let i = Int.random(in: 0...seats.count-1)
            let temp = seats[i]
            seats.remove(at: i)
            seats.append(temp)
        }
        let seatGroups = seats.chunked(into: people)
        var holder = [String()]
        for _ in seatGroups{
            for x in 0...seatGroups.count-1{
                if(colors.count == 0){
                    holder.removeFirst()
                    colors.append(contentsOf: holder)
                    
                    if runGroupCountOld < runGroupCountNew{
                        historyG = list[classIndex].seatingChart
                        runGroupCountOld += 1
                    }
                    runGroupCountNew += 1
                    return
                }
                let part = Int.random(in: 0...colors.count-1)
                let color = colors[part]
                holder.append(colors.remove(at: part))
                for z in seatGroups[x]{
                    z.backColor = color
                }
                print(holder)
            }
        }
        for i in list[classIndex].seatingChart{
            for z in seatGroups{
                for x in z{
                    if i.id == x.id{
                        i.backColor = x.backColor
                    }
                }
            }
        }
        
    }
    
    func colorToString(_ color: UIColor)->String{
        var chosen = ""
        if (color == UIColor.red) {
            chosen = "red"
        }
        else if (color == UIColor.white) {
            chosen = "white"
        }
        else if (color == UIColor.gray) {
            chosen = "gray"
        }
        else if (color == UIColor.green) {
            chosen = "green"
        }
        else if (color == UIColor.yellow) {
            chosen = "yellow"
        }
        else if (color == UIColor.blue) {
            chosen = "blue"
        }
        else if (color == UIColor.purple) {
            chosen = "purple"
        }
        else if (color == UIColor.cyan) {
            chosen = "cyan"
        }
        else if (color == UIColor.magenta) {
            chosen = "magenta"
        }
        else if (color == UIColor.lightGray) {
            chosen = "lightGray"
        }
        else{
            chosen = "orange"
        }
        return chosen
    }
    
    func stringToColor(_ color: String)->UIColor{
        var chosen = UIColor()
        if (color == "red") {
            chosen = UIColor.red
        }
        else if (color == "white") {
            chosen = UIColor.white
        }
        else if (color == "gray") {
            chosen = UIColor.gray
        }
        else if (color == "green") {
            chosen = UIColor.green
        }
        else if (color == "yellow") {
            chosen = UIColor.yellow
        }
        else if (color == "blue") {
            chosen = UIColor.blue
        }
        else if (color == "purple") {
            chosen = UIColor.purple
        }
        else if (color == "cyan") {
            chosen = UIColor.cyan
        }
        else if (color == "magenta") {
            chosen = UIColor.magenta
        }
        else if (color == "lightGray") {
            chosen = UIColor.lightGray
        }
        else{
            chosen = UIColor.orange
        }
        return chosen
    }
    
 }
 
 
 extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
 }
 
 
