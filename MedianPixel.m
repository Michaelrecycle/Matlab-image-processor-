function [medianRed,medianGreen,medianBblue]= MedianPixel(rgbPixelList)
% Calculates the median RGB values from a list of pixels.
%
%   Input(1): rgbPixelList, A 1xnx3 3D array of RGB values representing
%                           a list of pixel.(pixel 1 will be in column 1,
%                           pixel 2 in column 2 etc). Typically n will be
%                           greater than 1 (i.e. there are two or more 
%                           pixels in the list).
%
%   Outputs(3): medR, The median red value (which will be the median of
%                     all the R values from the list of pixels).
%
%               medG, The median green value (which will be the median of
%                     all the G values from the list of pixels).
%
%               medB, The median blue value (which will be the median of
%                     all the B values from the list of pixels).
%
%
% Example Calls
%
% Suppose we have a 1x3x3 array called pixels. Displaying the array gives
% the following:
%
%>> disp(pixels)
%
%(:,:,1) =
%
%   54   50   45
%
%(:,:,2) =
%
%   48   52   43
%
%(:,:,3) =
%
%   50   41   47
%
% Here the red values in the array are in layer 1, the green values
% in layer 2 and the blue values in layer 3.
%
% We now call
%
%>> [R,G,B]= MedianPixel(pixels)
%
% The above call will result in R=50, G=48, B=47
%
% NOTE:
%
%   In the case of a non-integer median we will round to the nearest
%   integer using conventional rounding rules (i.e. 48.5 rounds up to 49).
%
% Author: Michael Shaimerden

[ ~, c, ~] = size(rgbPixelList); % extract column size

if c < 2 % Special case when 1 x c x 3 --> c = 1
    medianRed = rgbPixelList(1,1,1); % set median red to the array's red value
    medianGreen = rgbPixelList(1,1,2); % Green
    medianBblue = rgbPixelList(1,1,3); % Blue
else
    
    medianRGB = round(median(rgbPixelList)); % Get and Round median values
    
    % extract correspondingly to color
    medianRed = medianRGB(1,1,1);
    medianGreen = medianRGB(1,1,2);
    medianBblue = medianRGB(1,1,3);
end

end

