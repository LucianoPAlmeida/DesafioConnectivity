//
//  WKTableDataSource.swift
//  DesafioAlertNavigationMenu
//
//  Created by Luciano Almeida on 3/11/16.
//  Copyright © 2016 Luciano Almeida. All rights reserved.
//

import Foundation
import WatchKit
protocol WKTableDataSource {
    func didCreateRow(table: WKInterfaceTable,atIndex index: Int, row: AnyObject?)
    func typeForRow(table: WKInterfaceTable)-> String
    func numberOfRowsInTable(table: WKInterfaceTable) -> Int
}