% Generates random positions between coordinates and the respective speed
% in m/s for each point
%
% InitialRandom(Number of points to generate, Maximum Speed in Km/hr)
%
% Returns 2 tables of size N x 2
%
% position =        vel =
%    [ x0 y0 ;        [ speed bearing ;
%      x1 y1 ;          speed bearing ;
%      ... ]            ... ]
%
%
function [pos, vel] = InitialRandom(N,S)

% coordinates limits
AXIS_LIMIT = 300;
ABSCISSA_LIMIT = 200;

%% positions
pos = [AXIS_LIMIT * rand(N, 1) ABSCISSA_LIMIT * rand(N, 1)];

%% speed and bearing
abs_val = S * rand(N, 1);           % random speed
angle_val = 2 * pi * rand(N, 1);    % random angle
vel = [ abs_val.*cos(angle_val) abs_val.*sin(angle_val) ];

end