clear, clc
% copy of k values as a vector
k_vec = [ 0 .005 .01 .02 .04 .08];

% assumptions
theta = 60;
v0 = 600;

%run for length of k_vec
for i = 1 : length(k_vec)
    % individual k
    k = k_vec(i);
    % run function fro that specific 
    [x,y,u,v,time,range,tot_time] = flightpath(v0,theta,k);
    %plot results
    plot_flightpaths(y,x,time,u,v);
end