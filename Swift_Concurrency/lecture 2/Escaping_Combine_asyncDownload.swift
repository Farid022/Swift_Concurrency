//
//  Model_VModels_DataManager.swift
//  Swift_Concurrency
//
//  Created by Muhammad Farid Ullah on 26/04/2023.
//

import Foundation
import SwiftUI
import Combine

class DataManager {
    let url = URL(string: "https://picsum.photos/200")!
    
    func completionHandler(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data = data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            print("Something goes wrong")
            return nil
        }
        
        return image
    }
    
    //Escaping closure captures non-escaping parameter 'completion'. the completion can only be used inside this, so mark it with escaping to escape back outside with some value.
    func fetchData_withEscaping(completion: @escaping (_ image: UIImage?, _ error: Error?) -> () ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            let image = self.completionHandler(data: data, response: response)
            completion(image, error)
        }
        .resume()
    }
    
    func fetchData_withCombine() -> AnyPublisher<UIImage?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(completionHandler)
            .mapError({ $0 })
            .eraseToAnyPublisher()
            
    }
    
    func fetchData_withAsync() async throws -> UIImage? {
        //let (data, response) = try? URLSession.shared.data(from: url) //if we do not care about the error
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let image = completionHandler(data: data, response: response)
            
            return image
        } catch {
            throw error
        }
    }
    
}

class ViewModel: ObservableObject {
    let instance = DataManager()
    
    @Published var image: UIImage? = nil
    var cancelable = Set<AnyCancellable>()
    
    
    func fetchImage() async {
        
        //with escaping
        instance.fetchData_withEscaping { [weak self] image, error in
            if let image = image {
                self?.image = image  //self is a strong reference to the current class, so made weak self.
                print("Yes we have image")
            } else {
                print("Sorry we don't have an image")
            }
        }
        
        
        //with combine
        instance.fetchData_withCombine()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                //
            } receiveValue: { returnedImage in
                //do with your image. No need of dispatchQue here
            }
            .store(in: &cancelable)
        
        
        //with async and await
        let image = try? await instance.fetchData_withAsync()  //don't worry about the error
        await MainActor.run {
            self.image = image
        }

    }
}
