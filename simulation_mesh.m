%Parameters initialization:
N= 50; % Number of mobile nodes
W= 40; % Radio range (in meters)
S= 15; % Maximum speed (in Km/h)
delta= 1; % Difference between consecutive time instants (in seconds)
%T= 3600; % No. of time instants of the simulation
T=3600;

S= S/3.6; % Conversion of maximum speed to m/s
results= zeros(1,T); % Initialization of the results array

% Generation of initial coordinates, speed and direction of mobile nodes:
[pos,vel]= InitialRandom(N,S);

% Visualize node positions:
figure(1)
plot(pos(:,1),pos(:,2),'o','MarkerEdgeColor','b','MarkerFaceColor','b')
axis([0 300 0 200])
grid on
% Simulation cycle running all time instants iter:
for iter= 1:T
    figure(1)
    hold off
    % Visualize updated node positions:
    plot(pos(:,1),pos(:,2),'o','MarkerEdgeColor','b','MarkerFaceColor','b')
    axis([0 300 0 200])
    hold on
    
    % Compute the node pairs with direct connections:
    L= ConnectedList(N,pos,W);
    % Compute the no. of connected node pairs of time instant iter:
    results(iter)= AverageConnectedNodePairs(N,L);
    % Update node coordinates and speed values:
    [pos,vel]= UpdateCoordinates(pos,vel,delta);
    pause(0.03)
end

hold off
% Plot in a different window the simulation results
average = zeros(1,T);
for i=1:T
    average(1,i) = mean(results(1:i));
end
figure(2)
axis([0 T 0 1])
plot((1:T)',results',(1:T)',average');

% Compute the final result:
GlobalAverageConnectivity = mean(results)
