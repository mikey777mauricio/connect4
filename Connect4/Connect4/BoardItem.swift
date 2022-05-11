//
//  BoardItem.swift
//  Connect4
//
//  Created by Mikey Mauricio on 4/21/22.
//

import Foundation
import UIKit

enum Tile{
    case Red
    case Yellow
    case Empty
    
}

struct BoardItem{
    var indexPath: IndexPath!
    var tile: Tile!
    
    func yellowTile() -> Bool {
        return tile == Tile.Yellow
    }
    func redTile() -> Bool {
        return tile == Tile.Red
    }
    func empyTile() -> Bool {
        return tile == Tile.Empty
    }
    
    func titleColor() -> UIColor{
        if redTile(){
            return .red
        }
        if yellowTile(){
            return .yellow
        }
        return .white
    }
    
    
    
}

