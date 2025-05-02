function [T, iteration, NormError] = iterateTemperatureField(T, relaxationFactor, Nx, Ny, tolerance)
    % Initialize variables
    Trelax = T; % Initialize the relaxation matrix
    NormError = inf; % Initialize error
    iteration = 0; % Initialize iteration counter

    % Main loop
    while NormError > tolerance
        iteration = iteration + 1; % Update iteration counter

        % First pass: Forward update
        for i = 2:Nx-1
            for j = 2:Ny-1
                Trelax(i,j) = (Trelax(i+1,j) + Trelax(i-1,j) + Trelax(i,j+1) + Trelax(i,j-1)) / 4;
            end
        end

        % Second pass: Backward update
        for i = Nx-1:-1:2
            for j = Ny-1:-1:2
                Trelax(i,j) = (Trelax(i+1,j) + Trelax(i-1,j) + Trelax(i,j+1) + Trelax(i,j-1)) / 4;
            end
        end

        % Update temperature matrix using relaxation method
        for i = 2:Nx-1
            for j = 2:Ny-1
                T(i,j) = (1 - relaxationFactor) * T(i,j) + relaxationFactor * Trelax(i,j);
            end
        end

        % Calculate error
        error = (T - Trelax).^2;
        NormError = sqrt(mean(error(:))); % Calculate the error norm
    end
end