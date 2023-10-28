% Joshua Jackson USC ID: 3182496724 Problem 1

clear; clc
close all

n = 10; % moles
V = 0.5; % volume in liters
T = 150:10:250; % temp in Kelvin

% Call the function for each gas
P1 = VanderWaals(n,V,T,'C');
P2 = VanderWaals(n,V,T,'N');
P3 = VanderWaals(n,V,T,'H');

% Plot the P vs T values all on the same graph
hold on
plot(P1,T)
plot(P2,T)
plot(P3,T)
title('Pressure vs Temperature')
xlabel('Pressure (atm)')
ylabel('Temperature (K)')
legend('CO2','N2','He')

% Function to solve for P using the Van der Waals eqn
function P = VanderWaals(n,V,T,gasname)

R = 0.0821;

if gasname == 'C'
    a = 3.607;
    b = 0.0429;
elseif gasname == 'N'
    a = 1.351;
    b = 0.0387;
elseif gasname == 'H'
    a = 0.034;
    b = 0.0238;
end

P = (n*R*T)/(V-n*b)-(a*(n^2/V^2));

end