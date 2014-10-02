% a test script. 
clear; clc;

n = 100;
d = 50;

X = rand(n, d);
y = rand(n, 1);
w = rand(d, 1);

% please check the leastSqr function for detailed format. 
checkgrad(@(w) leastSqr( w, X, y ), w )

% NOTE. if you see something like:
%
% epsilon: 1.000000e-07 , gradient: 1.000000e+00 
% epsilon: 1.000000e-06 , gradient: 1.000000e+00 
% epsilon: 1.000000e-05 , gradient: 1.000000e+00 
% epsilon: 1.000000e-04 , gradient: 1.000000e+00 
% epsilon: 1.000000e-03 , gradient: 1.000000e+00 
% epsilon: 1.000000e-02 , gradient: 1.000000e+00 
% epsilon: 1.000000e-01 , gradient: 1.000000e+00 
%
% Then you are fine. gradient should be around 1. 
% Though it is possible to have some minor (say, 1e-4)
% numerical issues. 
