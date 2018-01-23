//
//  TableViewCell.swift
//  verMas
//
//  Created by Arturo Sanhueza on 22-01-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {
    @IBOutlet weak var botonExpandirTexto: UIButton!
    @IBOutlet weak var botonReducirTexto: UIButton!
    @IBOutlet weak var label: UILabel!
    var tamano = CGFloat()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        botonExpandirTexto.addTarget(self, action: #selector(expandirTamano), for: .touchUpInside)
        botonReducirTexto.addTarget(self, action: #selector(reducirTamano), for: .touchUpInside)


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func expandirTamano(sender: UIButton!){
        let label = sender.superview?.subviews.last as! UILabel
        label.frame.size.height = 400000.0
        label.numberOfLines = 0
        label.sizeToFit()
        self.frame.size.height = label.frame.maxY
        let tabla = sender.superview?.superview?.superview as! UITableView
        tabla.reloadData()
        tamano = self.frame.height
        print(self.frame.height)


    }
    
    @objc func reducirTamano(sender: UIButton!){
        
        self.frame.size.height = 40.0
        let tabla = sender.superview?.superview?.superview as! UITableView
        tabla.reloadData()
        tamano = self.frame.height
        
    }
}
