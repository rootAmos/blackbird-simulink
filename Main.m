
%% Blackbird Simulink Model

clear 
close all
clc
%% Load CSV Files

% Specify the folder containing the CSV files
folderPath = 'flight_test_data'; % Replace with the path to your folder

% Get a list of all CSV files in the folder
csvFiles = dir(fullfile(folderPath, '*.csv'));

% Loop through each CSV file and import data
for k = 1:length(csvFiles)
    % Get the full file path
    filePath = fullfile(folderPath, csvFiles(k).name);
    
    % Get the file name without the extension
    [~, fileName, ~] = fileparts(csvFiles(k).name);
    
    % Import the CSV data as a matrix
    data = readmatrix(filePath);
    
    % Assign the matrix to a variable with the same name as the file
    assignin('base', fileName, data);
    
    % Display the file being processed
    fprintf('Imported %s as variable %s\n', csvFiles(k).name, fileName);
end

disp('All CSV files have been imported as matrices.');

%% Define Aircraft Object

Ixx__slugft2 = 220660;
Iyy__slugft2 = 954850;
Izz__slugft2 = 1172039;
Ixz__slugft2 = 19200;
wingarea__ft2 = 1605;
wingspan__ft = 56.7;
cbar__ft = 37.7;
mass__lb = 122728;
max_thrust_unit__lbf = 32500;

Ixx__kgm2 = Ixx__slugft2 * 1.3558179619;
Iyy__kgm2 = Iyy__slugft2 * 1.3558179619;
Izz__kgm2 = Izz__slugft2 * 1.3558179619;
Ixz__kgm2 = Ixz__slugft2 * 1.3558179619;
wingarea__m2 = wingarea__ft2 * 0.09290304;
wingspan__m = wingspan__ft * 0.3048;
cbar__m = cbar__ft * 0.3048;
mass__kg = mass__lb * 0.224808943;
max_thrust_unit__N = max_thrust_unit__lbf * 4.448;


inertia_tensor = [Ixx__kgm2, 0,-Ixz__kgm2;
                  0, Iyy__kgm2, 0;
                  -Ixz__kgm2, 0, Izz__kgm2];


% Define initial values
phi0__rad = 0;
theta0__rad = 0;
psi0__rad = 0;
alpha0__rad = 4*pi/180;
beta0__rad = 0;
u0__m_s = 600;
v0__m_s = 0;
w0__m_s = 0;
p0__rad_s = 0;
q0__rad_s = 0;
r0__rad_s = 0;

x0__m = 0;
y0__m = 0;
z0__m = -20000;
    
% Define Control Inputs
del_elev__rad = -2* pi/180;
del_ail__rad = 0.3 * pi/180;
del_rud__rad = 0;   
throttle  = 0.1072;

tf = 27;


