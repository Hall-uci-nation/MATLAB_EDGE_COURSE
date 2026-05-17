clc;
clear;
close all;

%% DC Motor Parameters

J = 0.01;      % Moment of inertia
b = 0.1;       % Friction coefficient
K = 0.01;      % Motor constant
R = 1;         % Resistance
L = 0.5;       % Inductance

%% Transfer Function of DC Motor

s = tf('s');

G = K / ((J*s + b)*(L*s + R) + K^2);

disp('Transfer Function of DC Motor:')
G

%% Open Loop Response

figure;
step(G)
title('Open Loop Step Response')
grid on

%% PID Controller Design

Kp = 100;
Ki = 200;
Kd = 10;

C = pid(Kp, Ki, Kd);

disp('PID Controller:')
C

%% Closed Loop System

T = feedback(C*G,1);

%% Closed Loop Response

figure;
step(T)
title('Closed Loop Response with PID Controller')
grid on

%% Performance Analysis

info = stepinfo(T);

disp('Performance Parameters:')
disp(info)

%% Comparison Plot

figure;
step(G,'r',T,'b')
legend('Open Loop','Closed Loop with PID')
title('Comparison of Open Loop and PID Controlled System')
grid on

%% Root Locus

figure;
rlocus(G)
title('Root Locus of DC Motor System')
grid on

%% Bode Plot

figure;
bode(T)
title('Bode Plot of PID Controlled System')
grid on

%% Pole-Zero Map

figure;
pzmap(T)
title('Pole-Zero Map')
grid on
