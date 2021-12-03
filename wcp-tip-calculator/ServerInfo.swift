//
//  ServerInfo.swift
//
//  Allows users to input the end of night values for calculation of tip share
//
//  Created by Eden Momchilov on 11/4/21.
//

import SwiftUI

// creates a Server object
struct Server: Hashable {
    let name: String
    let netSales: Float
    let houseOwesServer: Float
    let serverOwesHouse: Float
    let cashCollected: Float
    var serverTotal: Float
    
    static var testServers = [Server(name: "Eden", netSales: 250, houseOwesServer: 3, serverOwesHouse: 4, cashCollected: 5, serverTotal: 5), Server(name: "Weston", netSales: 3, houseOwesServer: 4, serverOwesHouse: 5, cashCollected: 6, serverTotal: 7)]
}

// creates the ServerInfoView where users can input their end of night results
struct ServerInfoView: View {
    
    // number of servers & support staff
    let numberOfServers: Int
    let numberOfSupport: Int
    
    @State var showDisplayTips: Bool = false
    
    @State var name = ""
    @State var netSales = ""
    @State var houseOwesServer = ""
    @State var serverOwesHouse = ""
    @State var cashCollected = ""
    @State var servers: [Server] = [Server(name: "Eden", netSales: 250, houseOwesServer: 3, serverOwesHouse: 4, cashCollected: 5, serverTotal: 5)]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 70) {
                Form {
                    Section {
                        TextField("Name", text: $name)
                    }
                    Section(footer: Text("Net Sales in the form of $X,XXX.XX")) {
                        TextField("Net Sales", text: $netSales)
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        TextField("House owes server", text: $houseOwesServer)
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        TextField("Server owes house", text: $serverOwesHouse)
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        TextField("Total cash collected", text: $cashCollected)
                    }
                    Button {
                        addServerInfo()
                    } label: {
                        Text("Save")
                    }
                }
                .navigationTitle("Server")
            }
        }
        .sheet(isPresented: $showDisplayTips, onDismiss: nil) {
            DisplayTips(serv: servers, numSup: numberOfSupport)
            
            
        }
        
        
    }
    
    // function to add server info & clear for the next
    func addServerInfo() {
        // creates a new server object with user inputs
        var server = Server(name: name, netSales: Float(netSales)!, houseOwesServer: Float(houseOwesServer)!, serverOwesHouse: Float(serverOwesHouse)!, cashCollected: Float(cashCollected)!, serverTotal: 0)
        
        // calculates the total amount of $$ the server brought in
        server.serverTotal = (server.houseOwesServer - server.serverOwesHouse) + server.cashCollected
        
        // adds the server object to the server array
        print(servers.count)
        servers.append(server)
        print(servers.count)
        
        // checks to see if this is the last server in the list.. if not, clears out input fields
        if (servers.count == numberOfServers) {
            showDisplayTips = true
        }
        else {
            name = ""
            netSales = ""
            houseOwesServer = ""
            serverOwesHouse = ""
            cashCollected = ""

        }
    }
    
    
    struct ServerInfoView_Previews: PreviewProvider {
        static var previews: some View {
            ServerInfoView(numberOfServers: 5, numberOfSupport: 2)
        }
    }
}

extension Float {
    func asCurrency() -> String {
        return String(format: "$%.02f", self)
    }
    
}
