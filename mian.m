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
Nx = 500; 
Ny = 500; 
% Grid spacing in x and y direction
dx = Lx / Nx; 
dy = Ly / Ny;
T = zeros(Nx,Ny);
% Initial condition
T(:,1) = 20; % T(x,0) = 20
T(:,end) = 20; % T(x,12) = 100
T(1,:) = 20; % T(0,y) = 20
T(end,:) = 100; % T(15,y) = 20
x = linspace(0, Lx, Nx); % Grid points in x direction
y = linspace(0, Ly, Ny); % Grid points in y direction
iterationNum = 50000;
for iteration = 1:iterationNum
for i =  2:Nx-1
    for j = 2:Ny-1
        T(i,j) = (T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1)) / 4;
    end
end
for i =  Nx-1:-1:2
    for j = Ny-1:-1:2
        T(i,j) = (T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1)) / 4;
    end
end
end
%% Plot the results
figure;
surf(x,y,T,'Edgecolor','none'); % Surface plot
xlabel('x'); % x-axis label
ylabel('y'); % y-axis label
zlabel('Temperature'); % z-axis label
view(2); % View from above
axis tight; % Tight axis
grid on; % Grid on
colorbar; % Colorbar
colormap(jet); % Colormap
clim([20 100]); % Color limits