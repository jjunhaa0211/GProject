//
//  GPTModel.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class GPTViewModel: BaseVM {
    private let disposeBag = DisposeBag()

    
    struct Input {
        let model: Driver<String>
        let role: Driver<String>
        let content: Driver<String>
        let tossButtonDidTap: Signal<Void>
    }
    
    struct Output {
        let result: PublishRelay<Bool>
    }
    
    func trans(_ input: Input) -> Output {
        let api = Service()
        let info = Driver.combineLatest(input.model, input.role, input.content)
        let result = PublishRelay<Bool>()
        input.tossButtonDidTap
            .asObservable()
            .withLatestFrom(info)
            .flatMap { model, role, content in
                api.gptBoot(model, role, content)
            }.subscribe(onNext: { r in
                switch r {
                case .ok:
                    result.accept(true)
                default:
                    result.accept(false)
                }
            }).disposed(by: disposeBag)
        return Output(result: result)
    }
    

}
