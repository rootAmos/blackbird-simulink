function [b2e_ang] = EulerTransformation(x)
    % Computes the Body to Earth Rotation Transformation Matrix 

    % Unpack state vector
    phi = x(7);
    theta = x(8);
    
    % Cosine and Sine of Euler Angles
    c_phi = cos(phi);
    c_theta = cos(theta);
    s_phi = sin(phi);
    
    % Body to Earth Rotation Transformation Matrix
    b2e_ang = [1, s_phi*t_theta, c_phi*t_theta;
                             0, c_phi, -s_phi;
                             0, s_phi/c_theta, c_phi/c_theta]; 

end