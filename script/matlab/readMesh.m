function [coor, elem] = readMesh(fileName, plot)

if nargin == 1
    plot = false;
end

%% Open file and parse mesh infomation
fid = fopen(fileName, 'r');
meshInfo = fscanf(fid, '%d %d %d\n', [1, 3]);
meshInfo = mat2cell(meshInfo, 1, [1, 1, 1]);
[nv, nt, ~] = deal(meshInfo{:});

%% Read coordinates and elements
coor = fscanf(fid, '%f %f %d', [3, nv])';
elem = fscanf(fid, '%d %d %d %d', [4, nt])';

%% Close file 
fclose(fid);

%% Plot
if plot
    triplot(elem(:, 1:3), coor(:, 1), coor(:, 2), 'b');
    view(2)
    axis('image')
end
