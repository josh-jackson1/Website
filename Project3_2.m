% Joshua Jackson USC ID: 3182496724 Problem 2


close all
clear; clc

P = 10; %atm
T = 300; %K
a = 67.85; %atm*(L^2)*(K^1/2)/mol^2
b = 0.0308; %L/mol
R = 0.0821; %L*atm/(mol*K)

func = @(V) ((R*T)./(V-b)) - (a./(V.*(V+b)*sqrt(T))) - P;

V = linspace(0.5,10,100);
zero_line = linspace(0,0,100);

hold on
plot(V,func(V),'k-')
plot(V,zero_line,'r-')
xlabel('Molar Volume, Vm (L/mol)')
ylabel('Root Finding Equation, f(Vm)')
title('Root Finding Equation vs Molar Volume using the Redlich-Kwong Equation of State')
legend('Root Finding Equation','f(Vm) = 0')
hold off


%% Bisection Method

% Initial Values
xl = 1.5; %L/mol
xr = 2.5; %L/mol

% Perform the 0th iteration
xm = (xl+xr)/2;
fxl = func(xl);
fxr = func(xr);

if (fxr*fxl) > 0
    disp('The guesses for the Bisection method do not bracket the root')
end
    
fxm = func(xm);

if (fxl*fxm) < 0
    % Root on the left
    xr = xm;
end

if (fxl*fxm) > 0
    % Root on the right
    xl = xm;
end

% Perform Iterations 1-10
for i = 1:10

    xm_old = xm; % Used for ARPC Calculation
    fxl = func(xl);
    fxr = func(xr);

    if (fxr*fxl) > 0
        disp('The guesses for the Bisection method do not bracket the root')
        break
    end
    
    xm = (xl+xr)/2;
    fxm = func(xm);
    xm_new(i) = (xl+xr)/2;
    ARPC(i) = abs((xm_new(i)-xm_old)/xm_new(i)) * 100;

    if (fxl*fxm) < 0
        % Root on the left
        xr = xm;
    end

    if (fxl*fxm) > 0
        % Root on the right
        xl = xm;
    end
    
end

Vm_bisection = xm_new;
ARPC_bisection = ARPC;

iter = (1:10);


%% False Position Method

% Initialize Values
xl = 1.5; %L/mol
xr = 2.5; %L/mol

% Perform the 0th iteration
fxl = func(xl);
fxr = func(xr);
xm = xr - ((fxr*(xl-xr))/(fxl-fxr));

if (fxr*fxl) > 0
    disp('The guesses for the Bisection method do not bracket the root')
end
    
fxm = func(xm);

if (fxl*fxm) < 0
    % Root on the left
    xr = xm;
end

if (fxl*fxm) > 0
    % Root on the right
    xl = xm;
end

% Perform Iterations 1-10
for i = 1:10

    xm_old = xm; % Used for ARPC Calculation
    fxl = func(xl);
    fxr = func(xr);

    if (fxr*fxl) > 0
        disp('The guesses for the Bisection method do not bracket the root')
        break
    end
    
    xm = xr - ((fxr*(xl-xr))/(fxl-fxr));
    fxm = func(xm);
    xm_new(i) = xr - ((fxr*(xl-xr))/(fxl-fxr));
    ARPC(i) = abs((xm_new(i)-xm_old)/xm_new(i)) * 100;

    if (fxl*fxm) < 0
        % Root on the left
        xr = xm;
    end

    if (fxl*fxm) > 0
        % Root on the right
        xl = xm;
    end
    
end

Vm_false_position = xm_new;
ARPC_false_position = ARPC;


% Plot of Vm vs Iterations for bisection and false position
figure
hold on
plot(iter,Vm_bisection,'m-')
plot(iter,Vm_false_position,'b-')
xlabel('Iteration')
ylabel('Molar Volume, Vm (L/mol)')
title('Estimated Molar Volume using the Bisection and False Position Methods')
legend('Bisection Method','False Position Method')
hold off

% Plot of ARPC vs Iterations for bisection and false position
figure
hold on
plot(iter,ARPC_bisection,'m-')
plot(iter,ARPC_false_position,'b-')
xlabel('Iteration')
ylabel('ARPC of Estimated Molar Volume (%)')
title('ARPC of Estimated Molar Volume using the Bisection and False Position Methods')
legend('Bisection Method','False Position Method')
hold off


























