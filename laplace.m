% Script for the first task of homework. Runs the problem for 2 different
% stepsizes.
% N is x-direction. M is y-direction
% Florentin GOYENS & David WEICKER
% LAB 5

clear all; 
close all;
hold on;


% Solution with h = 0.2
 N = 19; M = 11; 
 U02 = sol(M,N);
 X = [0 4]; Y = [0 2]; 
 imagesc(X,Y,U02);  title('Solution with h = 0.2');
 Tmiddel02 = U02(11, 7); % U is 21x13
 fprintf('T(2,1) = %f for h = 0.2 \n',Tmiddel02);
 
% Solution with h = 0.1
 N = 39; M = 21; 
 U01 = sol(M,N);
 X = [0 4]; Y = [0 2]; 
 imagesc(X,Y,U01);  title('Solution with h = 0.1');
 Tmiddel01 = U01(21,12); % U02 is 41x23 
 fprintf('T(2,1) = %f for h = 0.1 \n',Tmiddel01);
 
 
 
 
 
 
 