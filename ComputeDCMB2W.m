function [dcm_b2w] = ComputeDCMB2W(u)
    % Computes the Body to Wind Axes Rotation Transformation Matrix    

    % Unpack state vector
    alpha = u(1);
    beta = u(2);
    
    % Cosine and Sine of Alpha and Beta
    c_alpha = cos(alpha);
    c_beta = cos(beta);
    s_alpha = sin(alpha);
    s_beta = sin(beta);

    % Body to Wind Axes Rotation Matrix
    dcm_b2w = [c_alpha * c_beta, s_beta, s_alpha * c_beta;
        -c_alpha * s_beta, c_beta, -s_alpha * s_beta;
        -s_alpha, 0, c_alpha];

end