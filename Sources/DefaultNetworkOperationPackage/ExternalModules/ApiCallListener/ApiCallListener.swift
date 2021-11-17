//
//  File.swift
//  
//
//  Created by DarkBringer on 17.11.2021.
//

import Foundation

public protocol ApiCallListener {
    
    func onPreExecute()
    
    func onPostExecute()
    
}
