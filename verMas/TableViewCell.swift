//
//  TableViewCell.swift
//  verMas
//
//  Created by Arturo Sanhueza on 22-01-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var botonCambioTamanoTexto: UIButton!
    @IBOutlet weak var label: UILabel!
    var tamano = CGFloat()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //tamaño del campo de texto que va a cambiar su tamaño
        tamano = 58.0
        botonCambioTamanoTexto.addTarget(self, action: #selector(expandirTamano), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func expandirTamano(sender: UIButton!){
        let label = sender.superview?.subviews.first as! UILabel
        label.frame.size.height = 400000.0
        label.numberOfLines = 0
        label.sizeToFit()
        self.frame.size.height = label.frame.maxY
        botonCambioTamanoTexto.addTarget(self, action: #selector(reducirTamano), for: .touchUpInside)
        botonCambioTamanoTexto.setTitle("Ver menos", for: .normal)
        let tabla = sender.superview?.superview?.superview as! UITableView
        tabla.reloadData()
        tamano = self.frame.height

    }
    
    @objc func reducirTamano(sender: UIButton!){
        
        let label = sender.superview?.subviews.first as! UILabel
        label.frame.origin = CGPoint(x: 16.0, y: 18.0)
        label.frame.size.height = 21.0
        self.frame.size.height = 58.0
        botonCambioTamanoTexto.addTarget(self, action: #selector(expandirTamano), for: .touchUpInside)
        botonCambioTamanoTexto.setTitle("Ver más", for: .normal)
        let tabla = sender.superview?.superview?.superview as! UITableView
        tabla.reloadData()
        tamano = self.frame.height
    }
}
