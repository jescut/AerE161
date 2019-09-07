function plot_flightspaths(y,x,time,u,v)
%plot_flightpaths will plot altitude(y) as  a funtion of distance(x), 
%altitude(y) as a function of time(t), horizontal velocity(u) as a function
%of time(t) and vertical velosity(v) as a function of time(t) for each
%indivitual k value 
%   y - altitude
%   x - distance
%   time - time
%   u - horizontal velocity
%   v - vertical velocity

% Altitude vs disctance
figure(1)
plot(y,x)
title('Altitude VS. Disctance')
xlabel('x(km)')
ylabel('y(km)')
legend('k = 0','k = 0.005','k = 0.01','k = 0.02','k = 0.04','k = 0.08')
hold on

% Altitude vs time
figure(2)
plot(y,t)
legend('k = 0','k = 0.005','k = 0.01','k = 0.02','k = 0.04','k = 0.08')
hold on 

% horizontal velocity vs time
figure(3)
plot(u,t)
legend('k = 0','k = 0.005','k = 0.01','k = 0.02','k = 0.04','k = 0.08')
hold on

% Vertical velocity vs time
figure(4)
plot(v,t)
legend('k = 0','k = 0.005','k = 0.01','k = 0.02','k = 0.04','k = 0.08')
hold on
end

