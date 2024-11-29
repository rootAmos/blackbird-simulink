function [b2e_trans] = DCMTransformation(u)
    % Computes the Body to Earth Rotation Transformation Matrix 

    % Unpack state vector
    phi = u(1);
    theta = u(2);
    psi = u(3);
    
    % Cosine and Sine of Euler Angles
    c_phi = cos(phi);
    c_theta = cos(theta);
    c_psi = cos(psi);
    s_phi = sin(phi);
    s_theta = sin(theta);
    s_psi = sin(psi);
    
    % Body to Earth Rotation Transformation Matrix
    b2e_trans = [c_theta*c_psi, -c_phi*s_psi+s_phi*s_theta*c_psi, s_phi*s_psi + c_phi*s_theta*c_psi;
    c_theta*s_psi, c_phi*c_psi+s_phi*s_theta*s_psi, -s_phi*c_psi + c_phi*s_theta*s_psi;
    -s_theta, s_phi*c_theta, c_phi*c_theta];

end