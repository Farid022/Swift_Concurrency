//
//  async_await_task_delay.swift
//  Swift_Concurrency
//
//  Created by Muhammad Farid Ullah on 10/05/2023.
//

import SwiftUI
class ViewModel2: ObservableObject {
    @Published var array: [String] = []
    
    func addUser() async {
        let name = "Farid: \(Thread.main)"
        self.array.append(name)
        
        //add delay
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let name2 = "Jemmy: \(Thread.main)"
        self.array.append(name2) //if we get the error of publishing from background thread is not allowed, then wrap this in await MainActor.run { self.array.append(name2) }
        
        await addSomething()
    }
    
    
    func addSomething() async {
        //add delay
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let s1 = "something1: \(Thread.main)"
        self.array.append(s1)
        
        let s2 = "something2: \(Thread.main)"
        self.array.append(s2)
    }
    
}

struct async_await_task_delay: View {
    @StateObject var vm = ViewModel2()
    var body: some View {
        List {
            ForEach(vm.array, id: \.self) { user in
                Text(user)
            }
        }
        .onAppear {
            Task { //we enter to the async await environment
                await vm.addUser()
                
                try? await Task.sleep(nanoseconds: 5_000_000_000)
                let finalText = "Final Text: \(Thread.main)"
                vm.array.append(finalText)
            }
        }
    }
}

struct async_await_task_delay_Previews: PreviewProvider {
    static var previews: some View {
        async_await_task_delay()
    }
}
