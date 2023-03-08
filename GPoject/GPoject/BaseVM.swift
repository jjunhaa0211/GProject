//
//  BaseVM.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import Foundation
import RxSwift

protocol BaseVM {
    associatedtype Input
    associatedtype Output

    func trans(_ input: Input) -> Output
    
}
