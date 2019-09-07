%% AerE 161 Project 1
% Jessica Escutia
clear, clc
% Standard sea level values 
    % Tempeture in Kalvin
    t_sl = 288.16; 
    % Rho in kg/m^3
    rho_sl = 1.225;
    % presure in N/m^2
    p_sl = (1.01325 * 10^5);
    % Gravity in m/s^2
    g_sl = -9.80065;
    % Gass constant in J/kg*K
    R = 287;
    % Raduis of earth in m
    r_e = 6371.0008;
% Header of table
    fprintf( ' Geopotential Altitude(km) \t \t Geometric Altitude(km) \t \t Temperature(K) \t \t  Pressure(N/m^2) \t \t Density(kg/m^3)\n')
% Gradient Layer 
    % troposphere height and a
    htl = 0;
    a_t = -6.5e-3;
    % stratosphere a
    a_s = 3e-3;
% Empties to fill within loop
    T = []; % Temperature
    p = []; % Pressure
    rho = []; % Density
    h_G = []; % Geometric Altitude
% Geopotential Altitude in km
    gp_alt = (0:47);

for i = [1:48]
    %troposhere layer 0 < h <= 11 km
    if i >= 0 && i <= 12  
        T(i) = t_sl + (a_t * (gp_alt(i)*1000 - 0));
        p(i) = (T(i)/t_sl).^(g_sl/(a_t*R)) * p_sl;
        rho(i) = (T(i)/t_sl).^((g_sl/(a_t*R))-1) * rho_sl;
        h_G(i+1) = (i * r_e)/ (r_e - i);
        fprintf('\t\t%5.0f \t\t\t\t\t %17.5f \t\t\t\t\t %4.2f \t\t\t\t %10.3f \t\t\t %8.3f\n', i-1, h_G(i), T(i), p(i), rho(i))
        i = i+1;
        htl = htl + 1;
        % Isothermal layer (temp is constant) 11 <h <= 25km
    elseif i > 12 && i <= 26
        p(i) = exp(g_sl/(R*T(12))* (gp_alt(i)*1000 - 11*1000)) * p(12);
        rho(i) = exp((g_sl/(R*T(12))* (gp_alt(i)*1000 - 11*1000))) * rho(12) ;
        h_G(i+1) = (i * r_e)/ (r_e - i);
        T(i) = T(12) ;
        fprintf('\t\t %4.0f \t\t\t\t\t\t\t %9.5f \t\t\t\t\t %4.2f \t\t\t\t %10.3f \t\t\t %8.3f\n', i-1, h_G(i), T(i), p(i), rho(i))
        i = i+1;
    % Stratoshere loop  25 < h <m 47 
    else 
        T(i) = (T(26)) + (a_s * (gp_alt(i)*1000 - 25*1000));
        p(i) = (T(i)/T(26)).^(g_sl/(a_s*R)) * p(26) ;
        rho(i) = ((T(i)/(T(26))).^(g_sl/(a_s*R)-1)) * rho(26) ;
        h_G(i+1) = (i * r_e)/ (r_e - i);
        fprintf('\t\t %4.0f \t\t\t\t\t\t\t %9.5f \t\t\t\t\t %4.2f \t\t\t\t %10.3f \t\t\t %8.3f\n', i-1, h_G(i), T(i), p(i), rho(i))
        i = i+1;
    end
end
% Graphs
    % Geopotential vs Temperature
    figure(1)
    plot(T,gp_alt)
    title('Standard Atmosphere 0-47km: Geopotential Altutude(km) vs. Temperature(K)')
    xlabel('Temperature(K)')
    ylabel('Geopotential Altitude(km)')
    % Geopotential vs Density 
    figure(2)
    plot(rho,gp_alt)
    title( 'Standard Atmosphere 0-47km: Geopotential Altitude(km) vs Density(kg/m^3)')
    xlabel('Density(kg/m^3)')
    ylabel('Geopotential Altitude(km)')
    % Geopotential vs Pressure  
    figure(3)
    plot(p,gp_alt)
    title( 'Standard Atmosphere 0-47km: Geopotential Altitude(km) vs Pressure(kg/m^2)')
    xlabel('Pressure(kg/m^2)')
    ylabel('Geopotential Altitude(km)')
    
