//
//  TaskBootCamp.swift
//  Swift_Concurrency
//
//  Created by Muhammad Farid Ullah on 11/05/2023.
//

import SwiftUI

class TaskBootCamp_VM: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    @Published var errorMessage = ""
    @Published var errorMessage2 = ""
    
    
    func fetchImage() async {
        try? await Task.sleep(nanoseconds: 4_000_000_000)
        
        
        //Suppose we have a loop and we suddenly click on the back button, so we need to cancel the task and stop execution...
        for i in 0..<10 {
        print("item \(i)")
        //work goes here
        try? Task.checkCancellation()
        }
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            //it returns -> (Data, URLResponse). if we don't use response, we can mute by _
            let (data, _) = try await URLSession.shared.data(from: url)
            
            await MainActor.run {
                self.image = UIImage(data: data)
            }
        } catch {
            await MainActor.run {
                self.errorMessage = "fetching data1 error: \(error.localizedDescription)"
            }
            print("Got an error while fetching the data")
        }
        
    }
    
    func fetchImage2() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        
        do {
            //it returns -> (Data, URLResponse). if we don't use response, we can mute by _
            let (data, _) = try await URLSession.shared.data(from: url)
            
            self.image2 = UIImage(data: data)
        } catch {
            self.errorMessage2 = "fetching data2 error: \(error.localizedDescription)"
            print("Got an error while fetching the data")
        }
    }
}


struct HomeView: View {
    var body: some View {
        NavigationView {
            NavigationLink("View the picture") {
                TaskBootCamp()
            }
        }
    }
}
struct TaskBootCamp: View {
    @StateObject var vm = TaskBootCamp_VM()
    @State private var fetchImageTask: Task<(), Never>? = nil
    
    var body: some View {
        VStack(spacing: 35) {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .shadow(radius: 5)
            } else {
                VStack(spacing: 30) {
                    Image(systemName: "person.fill")
                        .font(.largeTitle)
                        .padding()
                        .background(.red)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.green, lineWidth: 3)
                        }
                    Text(vm.errorMessage)
                }
            }
//            if let image = vm.image2 {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 70, height: 70)
//                    .shadow(radius: 5)
//            } else {
//                VStack(spacing: 30) {
//                    Image(systemName: "person.fill")
//                        .font(.largeTitle)
//                        .padding()
//                        .background(.red)
//                        .clipShape(Circle())
//                        .overlay {
//                            Circle()
//                                .stroke(.green, lineWidth: 3)
//                        }
//                    Text(vm.errorMessage2)
//                }
//            }
        }
        .task {  //A closure that SwiftUI calls as an asynchronous task before the view appears. SwiftUI will automatically cancel the task at some point after the view disappears before the action completes. so no need of the .onAppear and disAppear...
            await vm.fetchImage()
        }
//        .onDisappear {
//            fetchImageTask?.cancel()
//        }
//        .onAppear {
//
//            fetchImageTask = Task {
//                await vm.fetchImage()  //No 'async' operations occur within 'await' expression. missing ()
//            }
//
//
//
//            //they are now asynch - means calls one after another. So what if we want to call cunncurrently. Ans: make two Tasks
////            Task {
////                await vm.fetchImage() // This must complete before calling the fetchImage2()
////                //we can check the priority of each Task
////                vm.errorMessage = "\(Task.currentPriority)"
////
////                //try await Task.sleep(nanoseconds: 5_000_000_000)
////                //await vm.fetchImage2()
////            }
//
////            Task {
////                await vm.fetchImage2()
////                //we can check the priority of each Task
////                vm.errorMessage2 = "\(Task.currentPriority)"
////            }
////
////            //which one should done before/after by using the Task(priority)
////            Task(priority: .background) {
////                print("Completes after .high task priority.")
////            }
////            Task(priority: .high) {
////                print("Completes before any other task")
////            }
//        }
    }
}

struct TaskBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskBootCamp()
    }
}
