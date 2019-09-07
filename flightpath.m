function [x,y,u,v,time,range,tot_time] = flightpath(v0,theta,k)
%flightpath will take given velocity angel and k and find the distance, 
%altitude, horizontal velocity, vertical velocity, range, and the total time
%it takes for a projectile to reach the floor when launched
%   Inputs:
%       v0 - initial velocity
%       theta - angel that projectile is thrown
%       k - coefficient of resistance
%   Outputs:
%       x - distance
%       y - altitude
%       u - horizontal velocity
%       v - vertical velocity
%       time - time 
%       range – furthest projectile goes
%       tot_time - total time elapsed

% time starts at 0
t = 0;
% time increment  
dt = 1e-1;
% gravity in m/s^2
g = 9.81; 
% Given eqations for V and U
V = v0 * sind(theta);
U = v0 * cosd(theta);
% when launched altitude is 0
y = 0;
i = 1;
while y >= 0
    % no resitance
    if k == 0
        %Given equations 1-4 
        %range
        x(i) = U*t;
        %altitude
        y(i) = -.5*g*t^2 + V*t;
        %horizontal velocity
        u(i) = U;
        %vertical velocity
        v(i) = -g*t + V;
    % with resistance
    else
        %Given equations 5-8
        %range
        x(i) = U/k * (1-exp(-k*t));
        %altitude
        y(i) = (-(g*t)/k) + (((k*V+g)/k^2) * (1-exp(-k*t)));
        %horizontal velocity
        u(i) = U * exp(-k*t);
        %vertical velocity
        v(i) = V * exp(-k*t) + g/k * (exp(-k*t)-1);
    end
    % vector of time
    time(i) = t;
    % increasing time and counter
    t = t+dt;
    i = i+1;
    
    range = max(x);
    tot_time = max(time);
end

