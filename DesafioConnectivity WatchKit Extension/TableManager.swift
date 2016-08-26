//
//  TableManager.swift
//  DesafioAlertNavigationMenu
//
//  Created by Luciano Almeida on 3/11/16.
//  Copyright © 2016 Luciano Almeida. All rights reserved.
//

import Foundation
import WatchKit
class TableManager: NSObject {
    private(set) var table : WKInterfaceTable!
    private(set) var dataSource: WKTableDataSource!
    
    private override init() {
        
    }
    
    convenience init(table : WKInterfaceTable, dataSource: WKTableDataSource) {
        self.init()
        self.dataSource = dataSource
        self.table = table
    }
    
    func loadTable() {
        let number = self.dataSource.numberOfRowsInTable(self.table)
        if number != 0 {
            let rowType = self.dataSource.typeForRow(self.table)
            self.table.setNumberOfRows(number, withRowType: rowType)
            for idx in 0...number - 1 {
                self.dataSource.didCreateRow(self.table, atIndex: idx, row:self.table.rowControllerAtIndex(idx))
                
            }
        }
    }
    
    func reloadTable() {
        self.loadTable()
    }
}
