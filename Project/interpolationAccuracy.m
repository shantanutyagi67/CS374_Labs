%INITIALIZATION
format long
clearvars;
clc;
close all;

% VARIABLE DECLARATION WITH INITIAL VALUE LENGTH OF THE STRING OF BOTH PENDULUMS, CAN BE THOUGHT OF AS RADIUS OF THE CIRCULAR PATH
r1 = 125;
r2 = 125;
% MASS OF THE TWO BOBS
m1 = 10;
m2 = 10;
% INITIAL STARTING ANGLE OF THE BOBS (PI/2 MEANS RIGHT-HORIZONTAL POSITION)
a1 = pi/2;
a2 = pi/2;
% INITIAL ANGULAR VELOCITY OF THE BOBS (AT REST)
a1_v = 0;
a2_v = 0;
% ACCELERATION DUE TO GRAVITY (DETERMINES THE)
g = 1;
% FINAL VALUE OF POSITION OF SECOND BOB (THIS WILL BE CALCULATED ANYWAY SO IT'S INDEPENDENT OF INITIAL VALUE)
px2 = -1;
py2 = -1;
% THESE 2 VAARIABLES ARE NOT USED IN MATLAB BUT THEY WILL BE USED AS OFFSET FOR LOCATION WHILE ANIMATING THE SYSTEM
cx = 50;
cy = 50;
% TIME STEP
dt = 0.5;
% ITERATIONS
itr = 1000;
% USED FOR PLOTTING PURPOSES
X1 = zeros([itr,1]);
Y1 = zeros([itr,1]);
A1 = zeros([itr,1]);
X2 = zeros([itr,1]);
Y2 = zeros([itr,1]);
A2 = zeros([itr,1]);

X1_interpol = csvread('C:\Users\geekSA67\code\CS374_Labs\Project\X1_100.csv');
Y1_interpol = csvread('C:\Users\geekSA67\code\CS374_Labs\Project\Y1_100.csv');

% START LOOPING
for i = 1:itr
    % SIMPLIFYING USING FORCE BALANCE EQUATION AND WRITING EVERYTHING IN TERMS OF THETA
    % SOLVING THE EQUATION FOR BOB 1
    num1 = -g * (2 * m1 + m2) * sin(a1);
    num2 = -m2 * g * sin(a1 - 2 * a2);
    num3 = -2 * sin(a1 - a2) * m2;
    num4 = a2_v * a2_v * r2 + a1_v * a1_v * r1 * cos(a1 - a2);
    den = r1 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
    % NEW ANGLAR ACCELERATION OF BOB 1
    a1_a = (num1 + num2 + num3 * num4) / den;
    % SOLVING THE EQUATION FOR BOB 1
    num1 = 2 * sin(a1 - a2);
    num2 = (a1_v * a1_v * r1 * (m1 + m2));
    num3 = g * (m1 + m2) * cos(a1);
    num4 = a2_v * a2_v * r2 * m2 * cos(a1 - a2);
    den = r2 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
    % NEW ANGLAR ACCELERATION OF BOB 2
    a2_a = (num1 * (num2 + num3 + num4)) / den;
    
    % INTERPOLATED VALUE FOR BOB 1
    x1 = X1_interpol(i);
    y1 = Y1_interpol(i);
    % PREDICTED VALUE OF BOB 2
    x2 = x1 + r2 * sin(a2);
    y2 = y1 + r2 * cos(a2);
    
    % INSERT PREDICTED VALUES OF VARIABLES TO BE PLOTTED
    X1(i) = x1;
    Y1(i) = y1;
    A1(i) = a1;
    X2(i) = x2;
    Y2(i) = y2;
    A2(i) = a2;
    
    % REPLACE PREDICTED WITH ACTUAL VALUE FOR NEXT ITERATION
    % CURRENT POSITION OF BOB 1
    x1 = r1 * sin(a1);
    y1 = r1 * cos(a1);
    % CURRENT POSITION OF BOB 2
    x2 = x1 + r2 * sin(a2);
    y2 = y1 + r2 * cos(a2);
    
    % NEW VALUES FOR BOB 1 AND 2 UDING LINEAR APPROXIMATION
    % NEW ANGULAR VELOCITY UPDATED FOR NEXT ITERATION CALCULATIONS
    a1_v = a1_v + a1_a*dt;
    a2_v = a2_v + a2_a*dt;
    % NEW ANGLE THETA UPDATED FOR NEXT ITERATION CALCULATIONS
    a1 = a1 + a1_v*dt;
    a2 = a2 + a2_v*dt;
    % NEW POSITION UPDATED FOR NEXT ITERATION CALCULATIONS
    px2 = x2;
    py2 = y2;
end

% PLOT FOR FINAL POSITION OF SECOND BOB
plot(X2,-Y2);
grid on;
% EXPORT VALUES
csvwrite('C:\Users\geekSA67\code\CS374_Labs\Project\X100pred.csv',X2)
csvwrite('C:\Users\geekSA67\code\CS374_Labs\Project\Y100pred.csv',Y2) 
%csvwrite('C:\Users\geekSA67\code\CS374_Labs\Project\A1.csv',A1) 
  