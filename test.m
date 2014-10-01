% test the accelerated gradient method. 
% any questions please email Jiayu.Zhou@asu.edu

clear; clc;
close all;
rng(1985)

% generate synthetic data.
N = 50;
D = 100;

X = randn(N, D);
y = sign(randn(N, 1));

w0 = randn(D, 1);

% configure the optimization parameters
% this input can be omitted to use default configuration.
sparsa_options = pnopt_optimset(...
          'display'   , 10    ,...
          'maxfunEv'  , 5000 ,...
          'maxIter'   , 500  ,...
          'ftol'      , 1e-9 ,...
          'optim_tol' , 1e-6 ,...
          'xtol'      , 1e-9 ...
         );
     
     
lambda = 10; % sparse parameter      
% function value/gradient of the smooth part
smoothF    = @(w) smooth_least( w, X, y ); 
% non-negativen l1 norm proximal operator. 
non_smooth = prox_nnl1(lambda);

disp('accelerated gradient');
tic;

% accelerated gradient solver
[w1, ~,info] = pnopt_accgrad( smoothF, non_smooth, w0, sparsa_options );

% sparsa solver
[w2, ~,info] = pnopt_sparsa( smoothF, non_smooth, w0, sparsa_options );
toc;
disp(numel(w1))
disp(nnz(w1))


figure; 
plot(info.Trace.f_x);
title('convergence')
