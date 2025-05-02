function [T, iteration, NormError] = iterateTemperatureField(Tinit, relaxationFactor, Nx, Ny, tolerance)
    % Initialize variables
    NormError = inf;
    iteration = 0;
    T = Tinit;
    % Main loop
    while NormError > tolerance
        iteration = iteration + 1; % Update iteration counter
        Told = T;
        Trelax = T;
        % Forward update
        for i = 2:Nx-1
            for j = 2:Ny-1
                Trelax(i,j) = (Trelax(i+1,j) + Trelax(i-1,j) + Trelax(i,j+1) + Trelax(i,j-1)) / 4;
            end
        end

        % Backward update
        for i = Nx-1:-1:2
            for j = Ny-1:-1:2
                Trelax(i,j) = (Trelax(i+1,j) + Trelax(i-1,j) + Trelax(i,j+1) + Trelax(i,j-1)) / 4;
            end
        end

        % Relaxation method
        for i = 2:Nx-1
            for j = 2:Ny-1
                T(i,j) = (1 - relaxationFactor) * T(i,j) + relaxationFactor * Trelax(i,j);
            end
        end

        % Calculate error
        error = (T - Told).^2;
        NormError = sqrt(mean(error(:))); % Calculate the error norm
    end
end