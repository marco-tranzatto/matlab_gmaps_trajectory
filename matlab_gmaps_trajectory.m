function [latitude, longitude] = matlab_gmaps_trajectory(latitude_borders, longitude_borders)
% MATLAB_GMAPS_TRAJECTORY  Creates a path based on user's input.
%
% USAGE:
% [latitude, longitude] = matlab_gmaps_trajectory(latitude_borders, longitude_borders)
% Plots a google map on the current axes using the Google Static Maps API
% and the borders specified as input. The user is then requested to input
% any number of points, which will form the path.
%
% Left click to insert a new point, right click to insert the last point of
% the path.

    longitude = [];
    latitude = [];
    
    % Plot Google Maps enclosed in specified border points.
    plot(longitude_borders, latitude_borders, '.r', 'MarkerSize', 20);
    plot_google_map;
    
    % Get user's input.
    read_user_input = 1;
    
    i = 1;
    while read_user_input
    
        [longitude(i), latitude(i), mouse_button] = ginput(1);
        % the following line does not actually plot anything on the current
        % figure, I have no idea why ...
        % plot(latitude, longitude, 'b*', 'MarkerSize', 15);
        
        % Terminate if user clicked with right button.
        if mouse_button == 3
            read_user_input = 0;
        end
    
        i = i +1;
    end
    
    % Plot new figure with created path.
    figure;
    plot(longitude_borders, latitude_borders, '.r', 'MarkerSize', 20);
    hold on;
    plot(longitude, latitude, '--.b', 'MarkerSize', 20);
    
    for i = 1 : length(latitude)
       text(longitude(i), latitude(i), num2str(i), 'FontSize', 20, 'Color', 'blue'); 
    end
    
    plot_google_map;
    
end