function [q_dot__rad_s2] = ComputePitchRates(x,q__Pa,CM)


    % Unpack state vector
    p__rad_s = x(4);
    r__rad_s = x(6);

    % Unpack aircraft object
    Izz__kgm2 = ac.Izz__kgm2;
    Ixx__kgm2 = ac.Ixx__kgm2;
    Ixz__kgm2 = ac.Ixz__kgm2;
    Iyy__kgm2 = ac.Iyy__kgm2;
    wingarea__m2 = ac.wingarea__m2;
    cbar__m = ac.cbar__m;

    % [1] Eq 2
    q_dot__rad_s2 = (qbar__Pa * wingarea__m2 * CM * cbar__m + r__rad_s * p__rad_s * (Izz__kgm2 - Ixx__kgm2) + ...
        (r__rad_s.^2 - p__rad_s.^2) * Ixz__kgm2) / Iyy__kgm2;


end