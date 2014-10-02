function checkgrad(f, x0, varargin)

delta = rand(size(x0));
delta = delta ./ norm(delta);
epsilon = 10.^[-7:-1];

[f0, df0] = feval(f, x0, varargin{:});

for i = 1:length(epsilon)
    [f_left] = feval(f, x0-epsilon(i)*delta, varargin{:});
    [f_right] = feval(f, x0+epsilon(i)*delta, varargin{:});
    ys(i) = (f_right - f_left) / 2;
    ys_hat(i) = df0' * epsilon(i)*delta;    
    fprintf('epsilon: %d , gradient: %d \n', epsilon(i), ys(i) / ys_hat(i));
end                           