% homework4.2                       %
% \nabla^2 T = 0   Laplacian eqn    %
% 0 <= x <= 15                      %
% 0 <= y <= 12                      %
% Dirichlet boundary condition      %
% T(x,0)  = 20                      %
% T(x,12) = 100                     %
% T(0,y)  = 20                      %
% T(15,y) = 20                      %
% Observe the convergence speed for different relaxation numbers %

clear all;
close all;
clc;

%% Parameters
% Length of the domain in x and y direction
Lx = 15; 
Ly = 12; 
% Number of grid points in x and y directions
Nx = 15; 
Ny = 12; 
% Initial condition
Tinit = zeros(Nx,Ny);
Tinit(:,1) = 20;    % T(0,y)    = 20
Tinit(:,end) = 20;  % T(15,y)   = 20
Tinit(1,:) = 20;    % T(x,0)    = 20
Tinit(end,:) = 100; % T(x,12)   = 100

%% Iteration part
w1 = linspace(0.1,1.8,20);  % Relaxation factors from 0.1 to 1.8
w2 = linspace(1.8,1.99,10); % Relaxation factors from 1.8 to 1.99
relaxationFactor = horzcat(w1,w2); % Combine the two relaxation factors
iteration = zeros(1,length(relaxationFactor));
endtime = zeros(1,length(relaxationFactor));
% Loop over different relaxation factors
for i = 1:length(relaxationFactor)
    tolerance = 1e-6; % Tolerance for convergence
    tic; % Start timer
    [T, iteration(i), NormError] = iterateTemperatureField(Tinit, relaxationFactor(i), Nx, Ny, tolerance); % Iterate the temperature field
    endtime(i) = toc; % End timer
    fprintf('Relaxation factor: %.3f, Iterations: %d, Iteration time: %d, Norm Error: %.6f\n', relaxationFactor(i), iteration(i), endtime(i), NormError); % Print results
end

%% Plot the results
figure;
plot(relaxationFactor, iteration, 'o-','LineWidth',2); % Plot iterations vs relaxation factor
xlabel('Relaxation Factor');
ylabel('Iterations');
title(['Iterations for Different Relaxation Factors, Mesh Size = ', num2str(Nx), 'x', num2str(Ny)]);
%plot settings
legend('Iterations');
axis tight;
grid on;
figure;
plot(relaxationFactor, endtime, 'o-','LineWidth',2); % Plot time vs relaxation factor
xlabel('Relaxation Factor');
ylabel('Time (s)');
title(['Time for Different Relaxation Factors, Mesh Size = ', num2str(Nx), 'x', num2str(Ny)]);
%plot settings
legend('Time');
axis tight;
grid on;
