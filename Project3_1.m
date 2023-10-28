% Joshua Jackson USC ID: 3182496724 Problem 1
close all
clear; clc


% Data Plots
T = [100 200 300 600 800 1000];
D = [0.59 0.46 0.38 0.25 0.20 0.17];
T_plot = linspace(100,1000,100);


% Linear Interpolation
for i=1:length(T_plot)
    if T_plot(i) < T(2)
        D_linear(i) = ((D(2)-D(1))/(T(2)-T(1)))*(T_plot(i)-T(1))+D(1);
    elseif T_plot(i) < T(3)
        D_linear(i) = ((D(3)-D(2))/(T(3)-T(2)))*(T_plot(i)-T(2))+D(2);
    elseif T_plot(i) < T(4)
        D_linear(i) = ((D(4)-D(3))/(T(4)-T(3)))*(T_plot(i)-T(3))+D(3);
    elseif T_plot(i) < T(5)
        D_linear(i) = ((D(5)-D(4))/(T(5)-T(4)))*(T_plot(i)-T(4))+D(4);
    elseif T_plot(i) <= T(6)
        D_linear(i) = ((D(6)-D(5))/(T(6)-T(5)))*(T_plot(i)-T(5))+D(5);
    end
end

% Cubic Spline
D_spline = spline(T,D,T_plot);

hold on
plot(T,D,'bo')
plot(T_plot,D_linear, 'r-')
plot(T_plot,D_spline,'g-')
xlabel('Temperature (ºC)')
ylabel('Density (kg/m^3)')
title('Density vs Temperature')
legend('Data Points', 'Linear Interpolation','Cubic Spline')
hold off

% Calculate ARPE
ARPE = abs((D_linear-D_spline)./D_spline)*100;

figure
hold on
plot(T_plot,ARPE)
xlabel('Temperature (°C)')
ylabel('ARPE (%)')
title('ARPE vs Temperature')
hold off
























