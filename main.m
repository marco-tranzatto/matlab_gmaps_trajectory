% Example on how to generate a path based on Google Maps point.
addpath('plot_google_map/')  

%% Map borders.
lat = [47.408921, 47.409383, 47.409095, 47.408585];
lon = [8.504467, 8.504832,   8.505813,  8.505567];

%% Get path.    
[latitude, longitude] = matlab_gmaps_trajectory(lat, lon);

%% Convert path in an East-North path, usefull for ROS.

% Use first point in the path as ENU origin.
lat0 = latitude(1);
lon0 = longitude(1);
h0 = 0.0; % fake altitude with 0.
h = zeros(size(latitude));  % fake altitude with 0s.
spheroid = wgs84Ellipsoid;

[xEast, yNorth, zUp] = geodetic2enu(latitude, longitude ,h, lat0, lon0, h0, spheroid);

write_yaml_file(xEast, yNorth, zUp);
