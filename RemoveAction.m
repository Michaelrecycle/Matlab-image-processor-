function [newImage] = RemoveAction(imageList)
% Creates an image that has the action removed by applying a median filter
% (i.e. each pixel in the new image is obtained by taking the median RGB
% values of the stack of corresponding pixels taken from the source images.
%
% Input(1): A 1xn 1D cell array containing n images, where each element is
%           an RGB image (recall RGB images stored as 3D arrays of uint8
%           values ranging from 0 to 255).
%
% Output(1): newImage, an RGB image (stored as 3D arrays of uint8 values)
%            that was obtained by taking the median RGB values of the
%            stack of corresponding pixels from the source images.
%
%
% NOTE:
%
% Some noise expected, as the objects in the background can move (eg. Wind
% blowing on trees)
%
% Author: Michael Shaimerden

[row, col, ~] = size(imageList{1});

newImage = zeros(row,col,3,'uint8'); % Preallocate

% Create a 4D array, where the 4th dimension represents the image in the
% list
imageList = cat(4,imageList{:});

% Call median function along 4th dimension (images). Results in a image
% with median RGB values
newImage = median(imageList,4);

end