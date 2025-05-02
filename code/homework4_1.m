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
Nx = 150; 
Ny = 120; 
x = linspace(0, Lx, Nx); % Grid points in x direction
y = linspace(0, Ly, Ny); % Grid points in y direction
dx = Lx / Nx; 
dy = Ly / Ny;
% Initial condition
T = zeros(Nx,Ny);
T(:,1) = 20;    % T(0,y)    = 20
T(:,end) = 20;  % T(15,y)   = 20
T(1,:) = 20;    % T(x,0)    = 20
T(end,:) = 100; % T(x,12)   = 100

%% Iteration part
relaxationFactor = 1; % Relaxation factor
tolerance = 1e-6; % Tolerance for convergence
[T, iteration, NormError] = iterateTemperatureField(T, relaxationFactor, Nx, Ny, tolerance); % Call the function to iterate the temperature field

%% Plot the results
figure;
[C, h] = contourf(y, x, T, 10, "EdgeColor", 'none'); % Contour plot
title('Temperature Distribution'); % Title
xlabel('x');
ylabel('y');
zlabel('Temperature (°C)');
%Plot settings
view(2); % View from above
axis tight;
grid on;
colorbar;
colormap(jet);
clim([20 100]);
