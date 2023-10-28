% Joshua Jackson USC ID: 3182496724 Problem 1

clear; clc
close all

% Load the Matrix Files:
A5 = load('A5.txt');
A10 = load('A10.txt');
A25 = load('A25.txt');
A50 = load('A50.txt');
A100 = load('A100.txt');
A150 = load('A150.txt');
A200 = load('A200.txt');

% Use MATLAB built-in function det to find the determinant of each
tic
A5_det1 = det(A5);
A_time1(1) = toc;
tic
A10_det1 = det(A10);
A_time1(2) = toc;
tic
A25_det1 = det(A25);
A_time1(3) = toc;
tic
A50_det1 = det(A50);
A_time1(4) = toc;
tic
A100_det1 = det(A100);
A_time1(5) = toc;
tic
A150_det1 = det(A150);
A_time1(6) = toc;
tic
A200_det1 = det(A200);
A_time1(7) = toc;

%% Use Gauss Elimination and diagonal multiplication to find determinants

% Finding the determinants using the sub function
[A5_det2, A_time2(1)] = GaussElim(A5);
[A10_det2, A_time2(2)] = GaussElim(A10);
[A25_det2, A_time2(3)] = GaussElim(A25);
[A50_det2, A_time2(4)] = GaussElim(A50);
[A100_det2, A_time2(5)] = GaussElim(A100);
[A150_det2, A_time2(6)] = GaussElim(A150);
[A200_det2, A_time2(7)] = GaussElim(A200);

% Checking to see if the built-in function determinants are equal to the 
% Gauss Elimantion determinants
% check(A_det1,A_det2,A_length)
A_length = [length(A5) length(A10) length(A25) length(A50) length(A100) length(A150) length(A200)];

check(A5_det1,A5_det2,length(A5))
check(A10_det1,A10_det2,length(A10))
check(A25_det1,A25_det2,length(A25))
check(A50_det1,A50_det2,length(A50))
check(A100_det1,A100_det2,length(A100))
check(A150_det1,A150_det2,length(A150))
check(A200_det1,A200_det2,length(A200))

% Plot time vs size of Matrix
hold on
plot(A_time1,A_length)
plot(A_time2,A_length)
title('Time to Find Determinant vs. Size of Matrix')
xlabel('Time (s)')
ylabel('Size of Square Matrix')
legend('Built-in "det" Function','Gauss Elimination/Diagonal Product')
hold off




function [A_det, A_time2] = GaussElim(A)
tic
k = 1;
for i = 2:length(A)
    for j = 1:k
        A(i,:) = A(i,:) - A(i,j)/A(j,j)*A(j,:);
    end
    k = k+1;
end

A_det = 1;
for l = 1:length(A)
    A_det = A_det * A(l,l);
end
%disp('The determinant for the inputted matrix is ')
%disp(A_det)
A_time2 = toc;
end

function check(A_det1,A_det2,A_length)
% Round each determinant to 10 significant figures: 
A_det1 = round(A_det1,10,"significant");
A_det2 = round(A_det2,10,"significant");

if A_det1==A_det2
    disp(['The determinants for A', num2str(A_length), ' are equal. '])
else
    disp(['The determinants for A', num2str(A_length), ' are not equal. '])
end

end





