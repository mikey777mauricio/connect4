//
//  ViewController.swift
//  Connect4
//
//  Created by Mikey Mauricio on 4/21/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var viewController: UIView!
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var TurnImage: UIImageView!
    var redScore = 0
    var yellowScore = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
        setCellWidthHeight()
        
    }
    
    func setCellWidthHeight(){
        let width = (collectionView.frame.size.width / 12)
        let height = (collectionView.frame.size.height / 10)
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func numberOfSections(in cv: UICollectionView) -> Int {
        print(board.count)
        return board.count
    }
    
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(board[section].count)
        return board[section].count
    }
    
    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! BoardCell
        let boardItem = getBoardItem(indexPath)
        cell.image.tintColor = boardItem.titleColor()
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let column = indexPath.item
        if var boardItem = getLowestEmptyBoardItem(column){
            if let cell = collectionView.cellForItem(at: boardItem.indexPath) as? BoardCell
            {
                cell.image.tintColor = currentTurnColor()
                boardItem.tile = currenTurnTile()
                updateBoardWithBoardItem(boardItem)
           
                
                if victoryAchieved(){
                    if yellowTurn(){
                        yellowScore += 1
                    }
                    if redTurn(){
                        redScore += 1
                    }
                    resultAlert(currentTurnVictoryMessage())
                }
                
                
                if boardIsFull(){
                    resultAlert("Draw")
                    
                }
                toggleTurn(TurnImage)
            }
        }
    }
    
    func resultAlert(_ title: String){
        let message = "\nRed: " + String(redScore) + "\n\nYellow: " + String(yellowScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: {
            [self] (_) in
            resetBoard()
            self.resetCells()
        }))
        self.present(ac, animated: true)
    }
    
    func resetCells(){
        for cell in collectionView.visibleCells as! [BoardCell]{
            cell.image.tintColor = .white
        }
    }


}

