%% Script for show the impact and control zone in the map and also represent deployment points on the map

% Loading .shp for representing the regions
% file_impact = 'C:/Users/MSI/PrintRegions/map/Impact_zone_2.shp';
file_control = 'C:/Users/MSI/PrintRegions/map/Control_zone_2.shp';

T_impact = shaperead(file_impact); 
T_control = shaperead(file_control);
T_impact.X(end) = [];
T_impact.Y(end) = [];
[T_impact.X, T_impact.Y] = utm2deg(T_impact.X, T_impact.Y, repmat('30 N', length(T_impact.X), 1));
[T_control.X, T_control.Y] = utm2deg(T_control.X, T_control.Y, repmat('30 N', length(T_control.X), 1));
% 
geoplot(T_impact.X, T_impact.Y,'Color','#1bfce6','LineWidth',3)
geobasemap 'satellite', hold on
% 
% hold on
% 
geoplot(T_control.X, T_control.Y,'Color','#f81bfc','LineWidth',3)
geobasemap 'satellite'
% % 
% 
% % Representing deployment points
% 
deployment_point_impact = [37.483616 -1.089166];
deployment_point_control = [37.391758 -1.320187];
% 
% 
hold on
geoplot(deployment_point_impact(1), deployment_point_impact(2),'.r','MarkerSize',23)
geoplot(deployment_point_control(1), deployment_point_control(2),'.','Color','#48c83a','MarkerSize',23)
legend({'Impact Zone (IZ)', 'Control Zone (CZ)', 'IZ deployment point', 'CZ deployment point'},'Location','bestoutside')