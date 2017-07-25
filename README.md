# Network Performance And Dimension simulators

This is the 1st simulator of 4 developed at Universidade de Aveiro at the course [47064 - Network Performance and Dimension](https://www.ua.pt/uc/2306) in which is is addressed the issue of resource management in network systems and introduce the main techniques of performance analysis and design (stochastic modeling and simulation of discrete events).

The available developed simulator tool set is the following:

 * [Simulator 1](https://github.com/luminoso/npr-simulator1): (this project) Connectivity performance of multi-hop wireless networks with mobile terminals
 * [Simulator 2](https://github.com/luminoso/npr-simulator2): Impact of transmission errors in network performance
 * [Simulator 3](https://github.com/luminoso/npr-simulator3): Blocking performance of video-streaming services
 * [Simulator 4](https://github.com/luminoso/npr-simulator4): Traffic Engineering of packet switched networks

All simulators run both in Matlab or Octave.


## Simulator 1 - Connectivity performance of multi-hop wireless networks with mobile terminals

The aim is to conduct a simulation analysis of the connectivity performance of a multi-hop wireless network with mobile nodes (i.e., nodes moving around over time) on a rectangle area of 300 horizontal meters by 200 vertical meters representing a possible university campus or city park.

In the first part, the simulator addresses the ad hoc variant of such networks. In this case, a set of wireless mobile nodes establishes a network between them without connectivity to the outside world.

In the second part, the assignment addresses the variant where the wireless network provides access to the wired network through AP (Access Point) nodes. In this case, each node is connected to the network if it can communicate with at least one AP. In both cases, consider a given radio range *W* such that any two nodes establish a direct connection if the distance between them is not higher than *W*. In multi-hop networks, nodes are able to perform routing, i.e., they can forward data received from other nodes and destined to other nodes. Therefore, two nodes can communicate between them (i.e., they are connected) as long as there is at least one path of direct connected nodes between them.

The simulation analysis aims are:
 
 * In ad hoc networks (first part of the simulator): for different radio range values *W*, the aim is to determine the minimum required number of nodes to obtain an acceptable connectivity performance level of 99%.
 * In wireless mobile networks with Access Points (second part of the simulator): for different radio range values *W and different number of nodes, the aim is to determine the required number and location of AP nodes required to obtain an acceptable connectivity performance level of 99%.

Both cases are continuous time systems (i.e., the list of connected nodes varies continuously with time). To develop a proper simulator, time is discretized in time instants with equal time difference between consecutive instants. Then, the simulator computes only the state of the system at each discrete time instant (the time difference value between consecutive time instants is a trade-off between simulation running time and results accuracy).


### 1.1 Mesh connectivity in ad hoc networks

In this simulation we created random nodes that move in a 2D area and that connect if within a *W* distance. We calculate the average connection ratio of all the nodes. 

There are the following configuration parameters:

| Variable | Description                                     |
|----------|-------------------------------------------------|
| N        | Number of nodes                                 |
| W        | Radio range (in meters)                         |
| S        | Maximum node speed                              |
| Δ        | Time frame in seconds of each instant simulator |
| T        | Maximum simulation instants                     |

Total simulated time is T x Δ

#### Running the simulation

When running *simulation_mesh.m* the program outputs a visualization o the nodes and their connections like the following image:

<p align="center"> 
	<img src="https://github.com/luminoso/npr-simulator1/raw/master/doc/simulator1.gif" alt="Mesh simualtor" >
</p>

When the simulation ends a graph of the average connectivity over time, average connectivity and the global average connectivity.


### 1.2 Internet mesh connectivity with access points

There's also a simulator for internet connectivity with one (or more) router positions. A node has a connectivity if it as a path (mesh or direct) to the access point. Additionally to the main configuration parameters it is also possible to configure access point positions in *InitialRandom2.m* file.

Example for one access point in the center of the simulation:

```Matlab
posAP = [AXIS_LIMIT/2, ABSCISSA_LIMIT/2];
```

Connectivity to the Internet is computed by *ConnectedList.m* that has an algorithm that checks if there's a path from a node to the AP.

#### Running the simulation

As in example one, *simulation_meshAP.m* also shows the visualization of the nodes:

<p align="center"> 
	<img src="https://github.com/luminoso/npr-simulator1/raw/master/doc/simulator1AP.gif" alt="Mesh simualtor">
</p>

When the simulation end, the average connectivity over time, average connectivity over time and global average connectivity is just of the nodes with connectivity **to the internet** (with a path to the AP).

## License
MIT
