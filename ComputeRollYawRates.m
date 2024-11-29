function [pdot__rad_s2,rdot__rad_s2] = ComputeRollYawRates(x,q__Pa,Cl,Cn)


    % Unpack state vector
    p__rad_s = x(4);
    q__rad_s = x(5);
    r__rad_s = x(6);

    % Unpack aircraft object
    Izz__kgm2 = ac.Izz__kgm2;
    Ixx__kgm2 = ac.Ixx__kgm2;
    Ixz__kgm2 = ac.Ixz__kgm2;
    Iyy__kgm2 = ac.Iyy__kgm2;
    wingarea__m2 = ac.wingarea__m2;
    wingspan__m = ac.wingspan__m;


    % vars(1) = pdot__rad_s2
    % vars(2) = rdot__rad_s2

    fun = @(vars) ...
    [(q__Pa * wingarea__m2 * wingspan__m * Cl + q__rad_s * r__rad_s * ( ...
                Iyy__kgm2 - Izz__kgm2) + ...
                     (q__rad_s * p__rad_s + vars(2)) * Ixz__kgm2) / Ixx__kgm2 - vars(1);     % [1] Eq 7
    (q__Pa * wingarea__m2 * wingspan__m * Cn + q__rad_s * p__rad_s * ( ...
                Ixx__kgm2 - Iyy__kgm2) - ...
                     (q__rad_s * r__rad_s + + vars(1)) * Ixz__kgm2) / Izz__kgm2 - vars(2)];     % [1] Eq 8


    % Use fsolve to solve the system of equations
    options = optimoptions('fsolve', 'Display', 'iter');
    solution = fsolve(fun, initialGuess, options);

    % Unpack solution
    pdot__rad_s2 = solution(1);
    rdot__rad_s2 = solution(2);

end