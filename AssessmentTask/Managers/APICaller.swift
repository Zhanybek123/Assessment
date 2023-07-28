//
//  APICaller.swift
//  AssessmentTask
//
//  Created by zhanybek salgarin on 7/26/23.
//

import Combine
import Foundation

struct Constants {
    static let completeURL = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
}

enum APIErrors: Error {
    case failedToGetData
}

class APICaller {

    static let shared = APICaller()
    
    var cancellable = Set<AnyCancellable>()
    
    func fetchCountryData() {
        
//        guard let url = URL(string: Constants.completeURL) else { return }
        
//        URLSession.shared.dataTaskPublisher(for: url)
//            .receive(on: DispatchQueue.main)
//            .tryMap ({ res in
//
//                // I would also add a popUp view to handle the errors
//                guard let response = res.response as? HTTPURLResponse,
//                      response.statusCode >= 200 && response.statusCode <= 300 else {
//                    throw CountryError.invalidStatusCode
//                }
//
//                let decoder = JSONDecoder()
//                guard let countries = try? decoder.decode([CountryMainModel].self, from: res.data) else {
//                    throw CountryError.failedToDecode
//                }
//                return countries
//            })
//            .sink { [weak self] res in
//                switch res {
//                case .failure(let error):
//                    // Assigning to 'error' (published property) to pass it to popUp (AKA alertView) if I had it
//                    self?.error = CountryError.custom(error: error)
//                default: break
//                }
//            } receiveValue: { [weak self] countries in
//                self?.countriesData = countries
//            }
//            .store(in: &cancellable)
//
    }
}

//enum CountryError: Error {
//    case custom(error: Error)
//    case failedToDecode
//    case invalidStatusCode
//    
//    var errorDescription: String {
//        switch self {
//        case .custom(let error):
//            return error.localizedDescription
//        case .failedToDecode:
//            return "Failed to decode response"
//        case .invalidStatusCode:
//            return "Invalid status code"
//        }
//    }
//}
