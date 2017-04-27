# matlab_gmaps_trajectory
Matlab script to generate a trajectory by clicking on points in a Google Maps image.

## Usage
See file `main.m` as example.

When Google Maps image appears, select the points you want to include in your path by **left clicking** with your mouse. To add the last waypoint **right click** on the desired point.

## Quick reference
Function `matlab_gmaps_trajectory`:

 - accepts latitude and longitude of the borders that enclose your desired area. Use Google Maps to get four points;
 - returns latitude and longitude of the points selected by the user.
 
 Function `write_yaml_file`:
  - accepts ENU (East-North-Up) coordinats and writes a yaml file called 'enu_path.yaml' (useful for ROS).

## Example
This is an example of a final path:
![](https://cloud.githubusercontent.com/assets/5328930/25491050/0f1cec78-2b6f-11e7-8be7-b756278b0e55.png)
