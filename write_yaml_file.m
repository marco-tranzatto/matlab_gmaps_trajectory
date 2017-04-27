function write_yaml_file(xEast, yNorth, zUp)
%WRITE_YAML_FILE writes yaml file with ENU coordinates,

    deciaml_format = '%.2f';

    x_waypoints = num2str(xEast(1), deciaml_format);
    y_waypoints = num2str(yNorth(1), deciaml_format);
    z_waypoints = num2str(zUp(1), deciaml_format);
    
    for i = 2 : length(xEast)
        x_waypoints = [x_waypoints, ', ', num2str(xEast(i), deciaml_format)];
        y_waypoints = [y_waypoints, ', ', num2str(yNorth(i), deciaml_format)];
        z_waypoints = [z_waypoints, ', ', num2str(zUp(i), deciaml_format)];
    end

    fileID = fopen('enu_path.yaml','w');
    fprintf(fileID,'x: [%s]\n', x_waypoints);
    fprintf(fileID,'y: [%s]\n', y_waypoints);
    fprintf(fileID,'z: [%s]\n', z_waypoints);
    fclose(fileID);

end

