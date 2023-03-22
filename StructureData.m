% Input data
% Node Data (rows represent nodes, columns are
% [X crd, Y crd, Z crd], [X cst, Y cst, Z cst], [Phi_x cst, theta_y cst, theta_z cst], [X frc, Y frc, Z frc], [X trq, Y trq, Z trq])
% crd:coordinate, cst:constraint(0:free, 1:constrained), frc:force, trq:torque
nodes = [
    [0, 0, 0], [1, 1, 1], [1, 1, 1], [0, 0, 0], [0, 0, 0]; 
    [0, 0, 6], [0, 0, 0], [0, 0, 0], [30e3, 0, -10e3], [-10e3, -30e3, 0]; 
    [0, 4, 6], [0, 0, 0], [0, 0, 0], [0, 14.08e3, -10e3], [10e3, 0, 19.2e3]; 
    [5, 4, 6], [1, 1, 1], [1, 1, 1], [0, 0, 0], [0, 0, 0]; 
    ];

% Members matrix (rows represent members, columns are
% start node, end node, A, E, G, J, Iy, Iz, phi_x)
members = [
    1, 2, 17800e-6, 210e9, 80.77e6, 2.16e-6, 1117.77e-6, 45.05e-6, 0;
    2, 3, 17800e-6, 210e9, 80.77e6, 2.16e-6, 1117.77e-6, 45.05e-6, 0;
    3, 4, 17800e-6, 210e9, 80.77e6, 2.16e-6, 1117.77e-6, 45.05e-6, pi/2;
];