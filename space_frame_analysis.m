%% space_frame_analysis.m
function [U_global] = space_frame_analysis(nodes, members)
    %Decompose Input
    node_coords = nodes(:,1:3);
    node_constraints = reshape(nodes(:,4:9)',[],1);
    node_loads = reshape(nodes(:,10:15)',[],1);
    

    connectivity = members(:,1:2);
    A = members(:,3);
    E = members(:,4);
    G = members(:,5);
    J = members(:,6);
    Iy = members(:,7);
    Iz = members(:,8);
    phi_x = members(:,9);
    

    % Number of nodes and members
    n_nodes = size(nodes, 1);
    n_members = size(members, 1);

    % Initialize global stiffness matrix and loads vector
    K_global = zeros(6 * n_nodes);

% Iterate through members to build the global stiffness matrix
for i = 1:n_members
    % Get node coordinates for the current member
    node_1 =connectivity(i, 1);  %First  Node Index
    node_2 =connectivity(i, 2);  %Second Node Index
    c1 = node_coords(node_1, :); %First  Node Coordinates
    c2 = node_coords(node_2, :); %Second Node Coordinates
    disp("member number:"+ num2str(i))
    % Calculate member vector
    V = (c2 - c1);

    % Calculate member stiffness matrix
    K_member = space_frame_member_stiffness(A(i), E(i), V, G(i), J(i), Iy(i), Iz(i), phi_x(i))

    roi = [(node_1-1)*6+1:node_1*6, (node_2-1)*6+1:node_2*6] ; %Region Of Interest in global matrices

    % Assembly of global stiffness matrix
        K_global(roi,roi) = K_global(roi,roi)+ K_member;
   
end

%% Apply constraints (Create DOF: Degrees Of Freedom Matrix)
DOF = ones(6 *n_nodes,1);
constraint_indexes = find(node_constraints);
DOF(constraint_indexes) = zeros(size(constraint_indexes)); %Set DOF to 0 for constrained DOF
DOF_indexes = find(DOF);
% constrained_dof = find(constraints);
% K_global(constrained_dof, :) = 0;
% K_global(:, constrained_dof) = 0;
% K_global(constrained_dof, constrained_dof) = eye(length(constrained_dof));

%% Solve for displacements

U_global = zeros(6 * n_nodes,1);
K_global(DOF_indexes,DOF_indexes)
U_global(DOF_indexes) = K_global(DOF_indexes,DOF_indexes) \ node_loads(DOF_indexes);

%% Calculate stress and strain in each member
%% Not Verified To be Implemented later
% stress = zeros(n_members, 1);
% strain = zeros(n_members, 1);
% 

% for i = 1:n_members
%     % Get node coordinates for the current member
%     n1 = node_coords(connectivity(i, 1), :);
%     n2 = node_coords(connectivity(i, 2), :);
% 
%     % Calculate member length and direction cosines
%     L = norm(n2 - n1);
%     l = (n2 - n1) / L;
% 
%     % Extract displacements for the current member
%     dof = [6 * connectivity(i, 1) - 5 : 6 * connectivity(i, 1), 6 * connectivity(i, 2) - 5 : 6 * connectivity(i, 2)];
%     U_local = U_global(dof);
% 
%     % Calculate axial force and stress
%     axial_force = E(i) * A(i) / L * (l * (U_local(7:9) - U_local(1:3)));
%     stress(i) = axial_force / A(i);
% 
%     % Calculate axial strain
%     strain(i) = stress(i) / E(i);
% end

end
