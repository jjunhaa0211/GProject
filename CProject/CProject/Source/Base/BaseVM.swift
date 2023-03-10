import Foundation
import RxSwift

protocol BaseVM {
    associatedtype Input
    associatedtype Output

    func trans(_ input: Input) -> Output
    
}
