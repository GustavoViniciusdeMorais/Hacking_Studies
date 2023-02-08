# TCP IP

### Commands
```
docker exec -it arch bash
python TCP_IP_Study/tcp_server.py

docker exec -it alpine sh
python TCP_IP_Study/tcp_client.py

```

Inter Process Communication (IPC)
IPC is a communication mechanism that an Operating System offers for processes 
to communicate with each other. There are various types of IPCs such as:

### Pipes
Sockets
Files
Signals
Shared Memory
Message Queues/ Message Passing

### Sockets
Sockets are used to send data over the network either to a different 
process on the same computer or to another computer on the network.

### There are four types of sockets namely,

Stream Sockets
Datagram Sockets
Raw Sockets
Sequenced Packet Sockets

### How are sockets used in Distributed Systems?
Distributed Systems are built using the concept of Client Service architectures.

Clients send requests to servers
Servers send back responses or error codes accordingly
The communication across servers and clients in a distributed system uses sockets as a popular form of IPC. Sockets are nothing but a combination of

IP Address. Ex: localhost
Port number. Ex: 80
Each machine (with an IP address) has several applications running on it. We need to know on which port an application is running in to send requests to it.

### What is TCP/IP?
We will go into the details of communication protocols in a different article and stick to the basics for today. TCP stands for Transmission Control Protocol, a communications protocol for computers to exchange information over a network.

IP stands for Internet Protocol. IP identifies the IP address of the applications or devices to send data to and forms the Network Layer in the OSI stack. TCP defines how to transport the data over the network. Ensuring delivery guarantee is still TCP’s job.

When we send an HTTP request to a server, we first establish a TCP connection, so HTTP sits on top of TCP as the transport layer. When a user types a URL into the browser, the browser sets up a TCP socket using the IP address and port number and starts sending data to that socket. This request is sent as bytes in the form of data packets over the network. The server will then respond to the request. The benefits of a TCP connection is that a server sends acknowledgement of each packet based on which the client retransmits data in case some packets get dropped. Each packet has a sequence number that the server uses to assemble them upon receiving.