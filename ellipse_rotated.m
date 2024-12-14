clc;    % Clear the command window.
workspace;  % Make sure the workspace panel is showing.
clearvars;
format longg;
format compact;
fontSize = 20;
darkGreen = [0, 0.6, 0];

% Parameterize the equation.
t = linspace(0, 360,1000);
phaseShift = 20;
xAmplitude = 2;
yAmplitude = 1;
x = xAmplitude * sind(t + phaseShift);
y = yAmplitude * cosd(t);

% Now plot the rotated ellipse.
plot(x, y, 'b-', 'LineWidth', 2);
axis equal
grid on;
xlabel('X', 'FontSize', fontSize);
ylabel('Y', 'FontSize', fontSize);
title('Rotated Ellipses', 'FontSize', fontSize);
text(-1.75, 1.4, 'Parametric --', 'Color', 'b', 'FontSize', fontSize);

% Now plot another ellipse and multiply it by a rotation matrix.
% https://en.wikipedia.org/wiki/Rotation_matrix
rotationAngle = 30;
transformMatrix = [cosd(rotationAngle), sind(rotationAngle);...
	-sind(rotationAngle), cosd(rotationAngle)]
xAligned = xAmplitude * sind(t);
yAligned = yAmplitude * cosd(t);
xyAligned = [xAligned; yAligned]';
xyRotated = xyAligned * transformMatrix;
xRotated = xyRotated(:, 1);
yRotated = xyRotated(:, 2);
hold on;
plot(xRotated, yRotated, '-', 'Color', darkGreen, 'LineWidth', 2);

% Plot a line at 30 degrees
slope = tand(30);
x1 = min(x(:));
y1 = slope * x1;
x2 = max(x(:));
y2 = slope * x2;
line([x1 x2], [y1 y2], 'Color', 'r', 'LineWidth', 2);
text(-1.75, 1.25, 'Rotation Matrix --', 'Color', darkGreen, 'FontSize', fontSize);
text(-1.75, 1.1, '30 Degree Line --', 'Color', 'r', 'FontSize', fontSize);

% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized','OuterPosition',[0 0 1 1]);
