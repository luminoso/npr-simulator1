%Parameters initialization:
N= 30; % Number of mobile nodes
W= 40; % Radio range (in meters)
S= 15; % Maximum speed (in Km/h)
delta= 1; % Difference between consecutive time instants (in seconds)
%T= 3600; % No. of time instants of the simulation
T=3600;

S= S/3.6; % Conversion of maximum speed to m/s
results= zeros(1,T); % Initialization of the results array

% Generation of initial coordinates, speed and direction of mobile nodes:
AP_count = 1;
[pos,vel, posAP]= InitialRandom2(N,S,AP_count);
%AP_count = 3; % nasty fix to use mode = 5

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
    for i=1:AP_count
        andemande = plot(posAP(i,1),posAP(i,2),'s');
        set(andemande,'LineWidth',30);
    end
    
    % Compute the node pairs with direct connections:
    L= ConnectedList(N,[pos; posAP],W);
    % Compute the no. of connected node pairs of time instant iter:
    results(iter)= AverageConnectedNodePairs2(N,L, posAP);
    % Update node coordinates and speed values:
    [pos,vel]= UpdateCoordinates(pos,vel,delta);
    pause(0.01)
    
end

hold off
% Plot in a different window the simulation results
average = zeros(1,T);
for i=1:T
    average(1,i) = mean(results(1:i));
end
figure(2)
axis([0 T 0 1.1])
plot((1:T)',results',(1:T)',average');

% Compute the final result:
GlobalAverageConnectivity = mean(results)

