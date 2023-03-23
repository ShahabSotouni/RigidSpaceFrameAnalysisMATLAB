%% DirectStiffnessSpaceFrame.m

% This script file uses the Direct Stiffness Method to analyze a space truss structure.
% It loads data from the ExtendedStructureData.m file, performs the analysis, and displays the results.

% Close all existing figure windows, clear workspace variables, and clear the command window
close all; clearvars; clc;

% Load Structure Data from StructureData.m file
StructureData

% Perform space frame analysis using Direct Stiffness Method
% The function space_frame_analysis takes nodes and members matrices as input arguments
% It returns displacement, reactions, internal forces, stress, and strain vectors for the structure
[displacement, reactions, internalForces, stress, strain] = space_frame_analysis(nodes, members);

% Display results
% Displacement of each node (m)
disp('Displacement of each node (m):');
disp(displacement);

% Reactions at constrained nodes (N and Nm)
disp('Reactions at constrained nodes (N and Nm):');
disp(reactions);

% Internal forces in each member (N and Nm)
disp('Internal forces in each member (N and Nm):');
disp(internalForces);

% Stress in each member (Pa)
disp('Stress in each member (Pa):');
disp(stress);

% Strain in each member
disp('Strain in each member:');
disp(strain);

% This script loads the structure data, performs the space frame analysis, and displays the displacement, reactions, internal forces, stress, and strain results for each node and member.
% The actual implementation of the Direct Stiffness Method is contained within the space_frame_analysis function (not provided here).