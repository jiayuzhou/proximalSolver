function [ f, g ] = leastSqr( w, X, y )
%LEASTSQR Summary of this function goes here
%   Detailed explanation goes here

yXw = y - X * w;

% compute least squres 
f = sum(yXw.^2);
g = -2 * X' * yXw;


end

