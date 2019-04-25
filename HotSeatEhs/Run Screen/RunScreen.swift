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
    
    @IBOutlet weak var perName: UILabel!
    
    @IBOutlet weak var runCollection: UICollectionView!
    var collectionCell: [Seat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = list[classIndex].name
        perName.text = name
        colors = ["red","green","yellow","blue","purple","cyan","magenta","orange"]
        NotificationCenter.default.addObserver(self, selector: #selector(loadGroup), name: NSNotification.Name(rawValue: "loadGroup"), object: nil)
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
        makeGroups(groups,people)
        //runCollection.reloadData()
    }
    
    @objc func loadGroup(notification: NSNotification){
        //load data here
        runCollection.reloadData()
    }
    
    @IBAction func runButton(_ sender: Any) {
        
        for i in stride(from: 0, through: list[classIndex].seatingChart.count-1, by: 1){
            list[classIndex].seatingChart[i].backColor = "white"
        }
        if groupChosen == "Single Seat" {
            let rand = Int.random(in: 0...list[classIndex].seatingChart.count - 1)
            let cell = list[classIndex].seatingChart[rand]
            cell.backColor = "red"
            runCollection.reloadData()
            //performSegue(withIdentifier: "SingleSeatSegue", sender: self)
        }
        else if groupChosen == "Row" {
            
            let rand = Int.random(in: 0...list[classIndex].rowDimension - 1)
            let rowStart = list[classIndex].columnDimension * rand
            for i in 0...list[classIndex].columnDimension - 1 {
                let cell = list[classIndex].seatingChart[rowStart+i]
                cell.backColor = "red"
                runCollection.reloadData()
            }
            
            
            //performSegue(withIdentifier: "RowColumnSegue", sender: self)
        }
        else if groupChosen == "Column"{
            let rand = Int.random(in: 0...list[classIndex].columnDimension - 1)
            for i in 0...list[classIndex].rowDimension - 1 {
                let cell = list[classIndex].seatingChart[rand+(7*i)]
                print(cell.id)
                cell.backColor = "red"
                runCollection.reloadData()
            }
        }
        else if groupChosen == "Random Group"{
            performSegue(withIdentifier: "GroupPropertiesPopUp", sender: self)
        }
    }
    func makeGroups(_ groups: Int, _ people: Int){
        var seats = list[classIndex].seatingChart
        for _ in 0...seats.count*5{
            let i = Int.random(in: 0...seats.count-1)
            let temp = seats[i]
            seats.remove(at: i)
            seats.append(temp)
        }
        let seatGroups = seats.chunked(into: people)
        var holder = [String()]
        for i in seatGroups{
            for x in 0...seatGroups.count-1{
                if(colors.count == 0){
                    holder.removeFirst()
                    colors.append(contentsOf: holder)
                    return
                }
                var part = Int.random(in: 0...colors.count-1)
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
 
 
