Space Truss Analysis using Direct Stiffness Method
==================================================

This repository contains MATLAB code for analyzing rigidly connected space truss structures using the Direct Stiffness Method (DSM).

Description
-----------

The code is divided into four files, which perform the following functions:

1.  `StructureData.m`: Contains input data for a space truss structure (node coordinates, constraints, external loads, member properties).
2.  `DirectStiffnessSpaceFrame.m`: Main script that loads structure data, performs the space frame analysis, and displays the results (displacement, reactions, internal forces, stress, and strain).
3.  `space_frame_analysis.m`: Function that implements the Direct Stiffness Method for a space frame and returns the displacement, reactions, internal forces, stress, and strain.
4.  `space_frame_member_stiffness.m`: Function that calculates the member stiffness matrix.

Installation
------------

1.  Clone the repository or download the project files.
2.  Open MATLAB and navigate to the project directory.
3.  Run the `DirectStiffnessSpaceFrame.m` script in MATLAB.

Usage
-----

1.  Modify the `StructureData.m` file to input your space truss structure data (node coordinates, constraints, external loads, member properties).
2.  Run the `DirectStiffnessSpaceFrame.m` script in MATLAB.
3.  The script will display the displacement, reactions, internal forces, stress, and strain results for each node and member.

Contributing
------------

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


License
-------

[MIT](https://choosealicense.com/licenses/mit/)
