function [ f, g ] = smooth_least( w, X, y )
%SMOOTH_LEAST the least squares function and gradient. 

Xw_y = X * w- y;

f = 0.5 * norm(Xw_y, 'fro')^2;
g = X' * Xw_y;

end

