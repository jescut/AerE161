clear,clc
% assumptions
v0 = 600 ;
theta = 60;
k = 0:0.001: 0.08;
% empty to fill
k_vec = [];
for i = 1 : length(k)
    % individual k
    k_vec(i) = k(i);
    % calling flight path and saving variables range and tot_time as
    % vectors
    [x,y,u,v,time,range(i),tot_time(i)] = flightpath(v0,theta,k(i));
end
%calling plot_range
    plot_range(k_vec,range,tot_time) 