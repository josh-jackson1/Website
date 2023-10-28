% Joshua Jackson USC ID: 3182496724 Problem 2

clear; clc
close all

x = linspace(0,2,50);
f = 0;
g = 0;

for j = 0:5
    f = f + (-1)^j*(x.^(2*j+1)/((factorial(j)*(2*j+1))));
end
f = (2/sqrt(pi))*f;

n = 250;

% Changed
for j = 1:length(x)
    g(j) = 0;
    for i = 1:n-1
        g(j) = g(j) + exp((-(i*x(j)/n)^2));
    end
    g(j) = (2/sqrt(pi))*(x(j)/(2*n))*(1+(2*g(j))+exp((-x(j)^2)));
end
%g = (x./(2*n)).*(1+(2.*g)+exp(1).^(-x.^2));
%g = (2/sqrt(pi))*g;

true = erf(x);

hold on
plot(x,true,'k-')
plot(x,f,'b--')
plot(x,g,'r--')
xlabel('x Values')
ylabel('Error Function Values')
title('Error Function Approximations and True Value Comparisons')
legend('true error function','f(x)','g(x)')
hold off

%ARPE Calculations

for k = 1:50
    ARPE_f(k) = abs(f(k) - true(k))/(true(k))*100;
end

for l = 1:50
    ARPE_g(l) = abs(g(l) - true(l))/(true(l))*100;
end

hold on
figure 
subplot(1,2,1)
plot(x,ARPE_f)
xlabel('x Values')
ylabel('ARPE for f(x)')
title('ARPE Values for f(x)')
subplot(1,2,2)
plot(x,ARPE_g)
xlabel('x Values')
ylabel('ARPE for g(x)')
title('ARPE Values for g(x)')
hold off




