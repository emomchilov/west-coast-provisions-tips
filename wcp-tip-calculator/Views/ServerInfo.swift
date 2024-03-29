//
//  ServerInfo.swift
//
//  Allows users to input the end of night values for calculation of tip share.
//
//  Created by Eden Momchilov on 11/4/21.
//

import SwiftUI

// creates the ServerInfoView where users can input their end of night results
@available(iOS 15.0, *)
struct ServerInfoView: View {
    // number of servers & support staff
    let numberOfServers: Int
    let numberOfSupport: Int
    
    // creates a model object to store the server array
    var tipManager: TipManager
    
    // MARK: - State
    
    // sets the display tips sheet to false
    @State var showDisplayTips: Bool = false
    
    // intitializes all server variables collected
    @State var name = ""
    @State var netSales = ""
    @State var houseOwesServer = ""
    @State var serverOwesHouse = ""
    @State var cashCollected = ""
    
    // MARK: - Computed
    // checks if the form is complete
    //    var formCompleted: Bool {
    //        name.count < 1 || $netSales.count < 1 || houseOwesServer.count < 1 || serverOwesHouse.count < 1 || cashCollected.count < 1
    //    }
    
    // creates the form view for user input
    var body: some View {
        NavigationView {
            VStack(spacing: 70) {
                Form {
                    Section {
                        HStack {
                            TextField("Name", text: $name)
                            ScanButton(text: $name, patternID: "Name")
                                .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    Section(footer: Text("Net Sales in the form of $X,XXX.XX")) {
                        HStack {
                            TextField("Net Sales", text: $netSales)
                                .keyboardType(.decimalPad)
                            ScanButton(text: $netSales, patternID: "Net Sales")
                                .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        HStack {
                            TextField("House owes server", text: $houseOwesServer)
                                .keyboardType(.decimalPad)
                            ScanButton(text: $houseOwesServer, patternID: "House Owes Server")
                                .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        HStack {
                            TextField("Server owes house", text: $serverOwesHouse)
                                .keyboardType(.decimalPad)
                            ScanButton(text: $serverOwesHouse, patternID: "Server Owes House")
                                .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        TextField("Additional Cash Tips", text: $cashCollected)
                            .keyboardType(.decimalPad)
                    }
                    Button {
                        addServerInfo()
                    }
                label: {
                    Text("Save")
                }
                    //                    .disabled(formCompleted)
                }
                .foregroundColor(Color.blue)
                .navigationTitle("Server")
            }
        }
        .sheet(isPresented: $showDisplayTips, onDismiss: nil) {
            DisplayTips(serv: tipManager.servers, numSup: numberOfSupport)
        }
    }
    
    // function to add server info & clear for the next
    func addServerInfo() {
        // creates a new server object with user inputs
        var server = Server(name: name, netSales: netSales.description.floatValue, houseOwesServer: houseOwesServer.description.floatValue, serverOwesHouse: serverOwesHouse.description.floatValue, cashCollected: cashCollected.description.floatValue, serverTotal: 0)
        
        // calculates the total amount of $$ the server brought in
        server.serverTotal = (server.houseOwesServer - server.serverOwesHouse) + server.cashCollected
        
        // adds the server object to the server array
        tipManager.servers.append(server)
        
        // checks to see if this is the last server in the list.. if not, clears out input fields
        if (tipManager.servers.count == numberOfServers) {
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
}

// creates the preview provider
@available(iOS 15.0, *)
struct ServerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ServerInfoView(numberOfServers: 5, numberOfSupport: 2, tipManager: TipManager(servers: [], numSupport: 2))
    }
}
