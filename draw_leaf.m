function draw_leaf() 
%%clc;	% Clear command window.
%clear;	% Delete all variables.
%close all;	% Close all figure windows except those created by imtool.
%imtool close all;	% Close all figure windows created by imtool.
% workspace;	% Make sure the workspace panel is showing.
fig = gcf;
fig.Color='black';
fig.InvertHardcopy = 'off';

axis off;
hFH = imfreehand();
hFH.setColor('black');

% Get the xy coordinates of where they drew.
xy = hFH.getPosition;

% get rid of imfreehand remnant.
delete(hFH);

% Overlay what they drew onto the image.
hold on; % Keep image, and direction of y axis.
xCoordinates = xy(:, 1);
yCoordinates = xy(:, 2);

fill(xCoordinates,yCoordinates,'white');
end
