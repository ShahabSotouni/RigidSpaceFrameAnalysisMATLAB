close all; clearvars; clc;
StructureData %Load Structure Data from StructureData.m file
% Space frame analysis
[displacement, stress, strain] = space_frame_analysis(nodes, members)

% Display results
disp('Stress in each member (Pa):');
disp(stress);

disp('Strain in each member:');
disp(strain);

