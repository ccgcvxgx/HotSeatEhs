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
 var backColorSave: [String]!
 
let color = UIColor(named: "SillyBlue")

 
 class RunScreen: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var groupType: UIButton!
    @IBOutlet weak var history: UIButton!
    @IBAction func history(_ sender: Any) {
        History().callHistory()
    }
    @IBOutlet weak var perName: UILabel!
    
    @IBOutlet weak var runCollection: UICollectionView!
    var collectionCell: [Seat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        history.layer.cornerRadius = 5
        groupType.layer.cornerRadius = 5
        runButton.layer.cornerRadius = 5
        let name = list[classIndex].name
        perName.text = name
        let colNum = list[classIndex].columnDimension!
        let s = collectionView.frame.size
        let sC: CGFloat
        if colNum != 6 {
            sC = (s.width) / (CGFloat(colNum) + 2)
        }
        else {
            sC = (s.width) / (CGFloat(colNum) + 1)
        }
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: sC, height: sC)
        groups = 5
        people = 7
        colors = ["red","green","yellow","blue","purple","cyan","magenta","orange","lightGray","SillyBlue", "MacNCheese", "BabyPink", "Lilac", "Sunset", "Scarlet", "Forest", "Spring", "BloodRed", "Sky", "Bear", "Kelly"]
        backColorSave = ["red","green","yellow","blue","purple","cyan","magenta","orange","lightGray","SillyBlue", "MacNCheese", "BabyPink", "Lilac", "Sunset", "Scarlet", "Forest", "Spring", "BloodRed", "Sky", "Bear", "Kelly"]
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
            if list[classIndex].seatingChart[i].backColor != "darkGray"{
                list[classIndex].seatingChart[i].backColor = "white"
            }
        }
    }
    
    @IBAction func runButton(_ sender: Any) {
        if groupChosen == "Single Seat" {
            whiteOut()
            if runSeatCountOld < runSeatCountNew{
                historyS = rand
                runSeatCountOld += 1
            }
            rand = Int.random(in: 0...list[classIndex].seatingChart.count - 1)
            var cell = list[classIndex].seatingChart[rand]
            if cell.disabled{
                print(cell.disabled)
                while cell.disabled{
                    rand = Int.random(in: 0...list[classIndex].seatingChart.count - 1)
                    cell = list[classIndex].seatingChart[rand]
                }
                cell.backColor = "red"
            }
            runSeatCountNew += 1
            runCollection.reloadData()
            //performSegue(withIdentifier: "SingleSeatSegue", sender: self)
        }
        else if groupChosen == "Row" {
            whiteOut()
            let rand = Int.random(in: 0...list[classIndex].rowDimension - 1)
            if runSeatCountOld < runSeatCountNew{
                historyR = rowStart
                runRowCountOld += 1
            }
            rowStart = list[classIndex].columnDimension * rand
            for i in 0...list[classIndex].columnDimension - 1 {
                let cell = list[classIndex].seatingChart[rowStart+i]
                if cell.backColor != "darkGray"{
                    cell.backColor = "red"
                }
            }
            runRowCountNew += 1
            runCollection.reloadData()
            
            //performSegue(withIdentifier: "RowColumnSegue", sender: self)
        }
        else if groupChosen == "Column"{
            whiteOut()
            if runColCountOld < runColCountNew{
                historyC = rand
                runSeatCountOld += 1
            }
            rand = Int.random(in: 0...list[classIndex].columnDimension - 1)
            runColCountNew += 1
            for i in 0...list[classIndex].rowDimension - 1 {
                let cell = list[classIndex].seatingChart[rand+(list[classIndex].columnDimension*i)]
                print(cell.id)
                if cell.backColor != "darkGray"{
                    cell.backColor = "red"
                }
            }
            runCollection.reloadData()
        }
        else if groupChosen == "Random Group"{
            performSegue(withIdentifier: "GroupPropertiesPopUp", sender: self)
        }
    }
    func makeGroups(){
        var seats = list[classIndex].seatingChart
        if runGroupCountOld < runGroupCountNew{
            historyG = Period(name: "testing", rows: list[classIndex].rowDimension, columns: list[classIndex].columnDimension)
            for i in 0...list[classIndex].seatingChart.count-1{
                historyG.seatingChart[i].backColor = list[classIndex].seatingChart[i].backColor
            }
            print(historyG.seatingChart[5].backColor + "h")
            runGroupCountOld += 1
        }
        runGroupCountNew += 1
        for _ in 0...seats.count*list[classIndex].rowDimension{
            let i = Int.random(in: 0...seats.count-1)
            let temp = seats[i]
            seats.remove(at: i)
            seats.append(temp)
        }
        for i in stride(from: seats.count-1, through: 0, by: -1){
            if seats[i].disabled{
                seats.remove(at: i)
            }
        }
        let seatGroups = seats.chunked(into: people)
        var holder = [String()]
        print(list[classIndex].seatingChart[5].backColor + "3")
        for x in 0...seatGroups.count-1{
            let part = Int.random(in: 0...colors.count-1)
            let color = colors[part]
            holder.append(colors.remove(at: part))
            for z in seatGroups[x]{
                z.backColor = color
            }
        }
        print(list[classIndex].seatingChart[5].backColor + "4")
        for seat in list[classIndex].seatingChart{
            for group in seatGroups{
                for x in 0...group.count-1{
                    if seat.id == group[x].id{
                        seat.backColor = group[x].backColor
                    }
                }
            }
        }
        print(list[classIndex].seatingChart[5].backColor + "5")
        colorupdate()
        
    }
    
    func colorupdate(){
            colors = backColorSave
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
        else if (color == UIColor.darkGray) {
            chosen = "darkGray"
        }
        else if (color == UIColor(named: "SillyBlue")) {
            chosen = "SillyBlue"
        }
        else if (color == UIColor(named: "MacNCheese")) {
            chosen = "MacNCheese"
        }
        else if (color == UIColor(named: "BabyPink")) {
            chosen = "BabyPink"
        }
        else if (color == UIColor(named: "Lilac")) {
            chosen = "Lilac"
        }
        else if (color == UIColor(named: "Sunset")) {
            chosen = "Sunset"
        }
        else if (color == UIColor(named: "Scarlet")) {
            chosen = "Scarlet"
        }
        else if (color == UIColor(named: "Forest")) {
            chosen = "Forest"
        }
        else if (color == UIColor(named: "Spring")) {
            chosen = "Spring"
        }
        else if (color == UIColor(named: "BloodRed")) {
            chosen = "BloodRed"
        }
        else if (color == UIColor(named: "Sky")) {
            chosen = "Sky"
        }
        else if (color == UIColor(named: "Bear")) {
            chosen = "Bear"
        }
        else if (color == UIColor(named: "Kelly")) {
            chosen = "Kelly"
        }
        else{
            chosen = "orange"
        }
        colorupdate()
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
        else if (color == "darkGray") {
            chosen = UIColor.darkGray
        }
        else if (color == "SillyBlue") {
            chosen = UIColor(named: "SillyBlue")!
        }
        else if (color == "MacNCheese") {
            chosen = UIColor(named: "MacNCheese")!
        }
        else if (color == "BabyPink") {
            chosen = UIColor(named: "BabyPink")!
        }
        else if (color == "Lilac") {
            chosen = UIColor(named: "Lilac")!
        }
        else if (color == "Sunset") {
            chosen = UIColor(named: "Sunset")!
        }
        else if (color == "Scarlet") {
            chosen = UIColor(named: "Scarlet")!
        }
        else if (color == "Forest") {
            chosen = UIColor(named: "Forest")!
        }
        else if (color == "Spring") {
            chosen = UIColor(named: "Spring")!
        }
        else if (color == "BloodRed") {
            chosen = UIColor(named: "BloodRed")!
        }
        else if (color == "Sky") {
            chosen = UIColor(named: "Sky")!
        }
        else if (color == "Bear") {
            chosen = UIColor(named: "Bear")!
        }
        else if (color == "Kelly") {
            chosen = UIColor(named: "Kelly")!
        }
        else{
            chosen = UIColor.orange
        }
        colorupdate()
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
 
 
