function K_global = space_frame_member_stiffness(A, E, V, G, J, Iy, Iz, phi_x)
    % Calculate Length
    L = norm(V);
    if L <1e-6
        error('Memeber length is close to zero')
    end

    % Calculate member stiffness matrix in local coordinates
    K_local_axial = E * A / L * [1, -1; -1, 1];
    K_local_torsion = G * J / L * [1, -1; -1, 1];

    K_local_bending_y = zeros(4,4);
    K_local_bending_y([1, 3],[1, 3]) = 12 * E * Iy / L^3 * [ 1, -1; -1, 1];
    K_local_bending_y([1, 3],[2, 4]) =  6 * E * Iy / L^2 * [-1, -1;  1, 1];
    K_local_bending_y([2, 4],[1, 3]) =  6 * E * Iy / L^2 * [-1,  1; -1, 1];
    K_local_bending_y([2, 4],[2, 4]) =  2 * E * Iy / L   * [ 2,  1;  1, 2];

    K_local_bending_z = zeros(4,4);
    K_local_bending_z([1, 3],[1, 3]) = 12 * E * Iz / L^3 * [1, -1; -1, 1];
    K_local_bending_z([1, 3],[2, 4]) =  6 * E * Iz / L^2 * [1,  1; -1,-1];
    K_local_bending_z([2, 4],[1, 3]) =  6 * E * Iz / L^2 * [1, -1;  1,-1];
    K_local_bending_z([2, 4],[2, 4]) =  2 * E * Iz / L   * [2,  1;  1, 2];
    
    K_local = zeros(12, 12);
    K_local([1,  7], [1,  7]) = K_local_axial;
    K_local([4, 10], [4, 10]) = K_local_torsion;
    K_local([3,  5, 9, 11], [3,  5, 9, 11]) = K_local_bending_y;
    K_local([2,  6, 8, 12], [2,  6, 8, 12]) = K_local_bending_z;



    % Calculate transformation matrix
    s = sqrt(V(1)^2+V(3)^2);
    phi_y = 0;
    phi_z = asin(V(2)/L);
    rho = zeros(3, 3);

    if s>1e-6 %Member is not aligned in Y Direction, not Special Case
           phi_y = asin(-V(3)/s);
    end

    rho = angle2dcm(phi_y,phi_z,phi_x,"YZX"); 
    T = zeros(12, 12);
    T(1:3, 1:3) = rho;
    T(4:6, 4:6) = rho;
    T(7:9, 7:9) = rho;
    T(10:12, 10:12) = rho;
    % Transform local stiffness matrix to global coordinates
    K_global = T' * K_local * T;
end