%% StructureData.m

% This script file contains input data for a rigidly connected space truss structure.
% The input data consists of node and member properties, which are defined in two separate matrices.

% Node Data Matrix (rows represent nodes, columns are properties of nodes)
% Columns: [X coordinate, Y coordinate, Z coordinate],
% [X constraint, Y constraint, Z constraint],
% [Phi_x constraint, theta_y constraint, theta_z constraint],
% [X force, Y force, Z force],
% [X torque, Y torque, Z torque]
% Constraint values: 0 - free, 1 - constrained
nodes = [
[0, 0, 0], [1, 1, 1], [1, 1, 1], [0, 0, 0], [0, 0, 0]; % Node 1: Origin, fully constrained
[0, 0, 6], [0, 0, 0], [0, 0, 0], [30e3, 0, -10e3], [-10e3, -30e3, 0]; % Node 2: Free, external forces and torques applied
[0, 4, 6], [0, 0, 0], [0, 0, 0], [0, 14.08e3, -10e3], [10e3, 0, 19.2e3]; % Node 3: Free, external forces and torques applied
[5, 4, 6], [1, 1, 1], [1, 1, 1], [0, 0, 0], [0, 0, 0]; % Node 4: Fully constrained, no external forces or torques
];

% Members matrix (rows represent members, columns are properties of members)
% Columns: start node, end node, A (cross-sectional area), E (Young's modulus),
% G (shear modulus), J (torsional constant), Iy (moment of inertia about y-axis),
% Iz (moment of inertia about z-axis), phi_x (angle between member and x-axis)
members = [
1, 2, 17800e-6, 210e9, 80.77e6, 2.16e-6, 1117.77e-6, 45.05e-6, 0; % Member 1: Connects Node 1 and Node 2, vertical z axis
2, 3, 17800e-6, 210e9, 80.77e6, 2.16e-6, 1117.77e-6, 45.05e-6, 0; % Member 2: Connects Node 2 and Node 3, horizontal y axis
3, 4, 17800e-6, 210e9, 80.77e6, 2.16e-6, 1117.77e-6, 45.05e-6, pi/2; % Member 3: Connects Node 3 and Node 4, horizontal x axis
];

% The data in this file is utilized by the main analysis code to compute displacements, reactions, and internal forces.
% The code will use these inputs to determine the behavior of the space truss structure under the given loading conditions.