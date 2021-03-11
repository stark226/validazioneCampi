//
//  TableCell+delegation.swift
//  Consip8
//
//  Created by Stefano Cardia Dev on 29/01/21.
//

import UIKit


///used to comunicate events between custom cells with an identity. the class used to send the "content" to the cells needs to conform to it, and to have the delegate property. di fatto viene usato come tipo nell'array chiamato rows, che contiene gli oggetti da mostrare nelle varie celle.
protocol TableViewCellProtocol /*UpperDelegate*/ {

    var identity: String { get set }
    var cellClass: UITableViewCell.Type { get set }
    func config(cell: UITableViewCell)
}


extension UIView {
//    static var identifier: String { //usa questa nel mondo reale

    static var identifier_GivenByExtension: String {
        return String(describing: self)
    }
}
