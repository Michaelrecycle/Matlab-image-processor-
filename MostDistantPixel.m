function [distantRed,distantGreen,distantBlue] =  MostDistantPixel(pixelStack)
% Calculates the pixel from a list that is most distant from the median
% RGB values of that list. PixelDistance is called to produce a squared
% distance between points in RGB colour space.
%
% Input(1): pixelStack, A 1xnx3 3D array of RGB values representing a list of
%                       pixels (pixel 1 will be in column 1, pixel 2 in
%                       column 2 etc). Typically n will be greater than 1
%                       (i.e. there are two or more pixels in the list).
%
% Outputs(3): distantRed, The red value of the most distant pixel.
%
%             distantGreen, The green value of the most distant pixel.
%
%             distantBlue, The blue value of the most distant pixel.
%
%
% Example Call
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
% >> [R,G,B]= MostDistantPixel(pixels)
%
% Note that the median values for this particular list of
% pixels are (50,48,47)
%
% The above call will result in R=50, G=52, B=41 as the point in 3D
% colour space (50,52,41) is more distant from the median values than
% either of (54,48,50) or (45,43,47).
%
%
% Author: Michael Shaimerden

[medianRed,medianGreen,medianBlue] = MedianPixel(pixelStack); % Find median color values

D = zeros(1,length(pixelStack(1,:,1))); % Preallocate

% Calculate PixelDistance to find the distances produced by different
% pixels from the pixel stack (pixels in the same position
% from different images) by looping through pixelStack

for i = 1:length(pixelStack(1,:,1))
    
    D(i) = PixelDistance([medianRed,medianGreen,medianBlue],[pixelStack(1,i,1),pixelStack(1,i,2),pixelStack(1,i,3)]);
end

[~, index] = max(D);  % Find the index of the maximum distance
% NOTE: If two or more maximum distances occur
% only use the first max occuring element index

% set the distance of each color to the corresponding RGB values from
% the set of pixels which produce the maximum distance
distantRed = pixelStack(1,index,1);
distantGreen = pixelStack(1,index,2);
distantBlue = pixelStack(1,index,3);

end
