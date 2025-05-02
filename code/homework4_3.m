% homework4.3                       %
% \nabla^2 T = 0   Laplacian eqn    %
% 0 <= x <= 15                      %
% 0 <= y <= 12                      %
% Dirichlet boundary condition      %
% T(x,0)  = 20                      %
% T(x,12) = 100                     %
% T(0,y)  = 20                      %
% T(15,y) = 20                      %
% Find the best relaxation number for different mesh grids %

clear all;
close all;
clc;

%% Parameters
% Length of the domain in x and y direction
Lx = 15;
Ly = 12;
gridSize = linspace(0.1,1,9); % Different grid sizes to test
tolerance = 1e-5; % Tolerance for convergence
MaxIterations = 1000;
w_out = zeros(1,length(gridSize));
for k = 1:length(gridSize)
    % Number of grid points in x and y directions
    Nx = round(Lx / gridSize(k));
    Ny = round(Ly / gridSize(k));
    % Initial condition
    Tinit = zeros(Nx,Ny);
    Tinit(:,1)      = 20;       % T(0,y)    = 20
    Tinit(:,end)    = 20;       % T(15,y)   = 20
    Tinit(1,:)      = 20;       % T(x,0)    = 20
    Tinit(end,:)    = 100;      % T(x,12)   = 100
    %% Find the best relaxation factor
    w_min = 0.100; % Minimum relaxation factor
    w_max = 1.999; % Maximum relaxation factor
    breaknum = 0.0001;
    for i = 1:MaxIterations
        w = linspace(w_min, w_max, 10); % Relaxation factors from 0.1 to 1.99
        iteration = zeros(1,length(w)); % Initialize iteration count
        for j = 1:length(iteration)
            % Call the function to iterate the temperature field
            [T, iteration(j), NormError] = iterateTemperatureField(Tinit, w(j), Nx, Ny, tolerance); 
        end
        [minValue, index] = min(iteration);
        if w(index+1) - w(index-1) > breaknum
            w_max = w(index+1); % Set the new maximum relaxation factor
            w_min = w(index-1); % Set the new minimum relaxation factor
        else
            w_out(k) = w(index); % Use the best relaxation factor found
            break;
        end
    end
end
%% Plot the results
plot(gridSize, w_out, 'o-','LineWidth',2); % Plot iterations vs relaxation factor
xlabel('Grid Size(cm)');
ylabel('Relaxation Factor');
title('Best Relaxation Factor for Different Grid Sizes');
%plot settings
legend('Best Relaxation Factor');
axis tight;
grid on;