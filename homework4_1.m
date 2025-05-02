% homework4.1                       %
% \nabla^2 T = 0   Laplacian eqn    %
% 0 <= x <= 15                      %
% 0 <= y <= 12                      %
% Dirichlet boundary condition      %
% T(x,0)  = 20                      %
% T(x,12) = 100                     %
% T(0,y)  = 20                      %
% T(15,y) = 20                      %

clear all;
close all;
clc;

%% Parameters

% Length of the domain in x and y direction
Lx = 15; 
Ly = 12; 
% Number of grid points in x and y directions
Nx = 100; 
Ny = 100; 
x = linspace(0, Lx, Nx); % Grid points in x direction
y = linspace(0, Ly, Ny); % Grid points in y direction
% Grid spacing in x and y direction
dx = Lx / Nx; 
dy = Ly / Ny;
T = zeros(Nx,Ny);
% Initial condition
T(:,1) = 20; % T(0,y) = 20
T(:,end) = 20; % T(15,y) = 20
T(1,:) = 20; % T(x,0) = 20
T(end,:) = 100; % T(x,12) = 100
%% Iteration part
relaxationFactor = 0.5; % Relaxation factor
tolerance = 1e-6; % Tolerance for convergence
[T, iteration, NormError] = iterateTemperatureField(T, relaxationFactor, Nx, Ny, tolerance); % Call the function to iterate the temperature field
%% Plot the results
figure;
[C, h] = contourf(x, y, T, 10, "EdgeColor", 'none'); % Contour plot
title('Contour plot of temperature distribution'); % Title
xlabel('x'); % x-axis label
ylabel('y'); % y-axis label
zlabel('Temperature'); % z-axis label
view(2); % View from above
axis tight; % Tight axis
grid on; % Grid on
colorbar; % Colorbar
colormap(jet); % Colormap
clim([20 100]); % Color limits
