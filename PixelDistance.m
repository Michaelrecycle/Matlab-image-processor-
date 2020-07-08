function D = PixelDistance(P,Q)
% Calculates the square of the distance between two points in colour space.
%
%   Inputs(2): P, An array containing three elements representing
%                 a point in 3D colour space.
%
%              Q, An array containing three elements representing a second
%                 point in 3D colour space.
%
%   Output: D, A single output, the square of the distance between the
%              two points in 3D colour space.
% Notes:
% The distance referred to is the geometric straight line distance between
% the two points when interpreting them as points in 3D space. This
% function returns the SQUARE of this distance, so mathematically it
% is equivalent to the following calculation for two 3D points, P and Q
%
% D = (P1 - Q1)^2 + (P2 + Q2)^2 + (P3 - Q3)^2
%
% Note that the colour values for a pixel can be interpreted as a point in
% 3D space P = (P1,P2,P3).
%
%
% Example Calls
%
%>> P = [0 0 0]  % this as a 1x3 1D array
%>> Q = [255 255 255]  % this as a 1x3 1D array
%
%>> % find the squared distance between P and itself
%>> squaredDistance = PixelDistance(P,P)
%
% squaredDistance =
%
%         0
%
%>> % find the squared distance between P and Q
%>> squaredDistance = PixelDistance(P,Q)
%
% squaredDistance =
%
%         195075
%
% Author: Michael Shaimerden



P = double(P); % Convert unit8 into doubles
Q = double(Q);

% Apply Square Distance Formula to produce Distance
D = (P(1) - Q(1))^2 + (P(2) - Q(2))^2 + (P(3) - Q(3))^2;

end

