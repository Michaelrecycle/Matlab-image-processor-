function imgRGB = ReadImages(imgDirName,imgFilenames)
% Read in a specified list of images given the filenames and the directory
% the files are located in.
%
% Inputs(2): imgDirName, A string containing the name of the directory the
%                        images are contained in.
%
%            imgFilenames, A 1xn 1D cell array containing n strings where
%                          each element is a filename of an image to read. 
%
% Output(1): imgRgb, A 1xn 1D cell array containing n images, where each
%                    element is an RGB image (recall RGB images stored as
%                    3D arrays of uint8 values ranging from 0 to 255). The
%                    first image will correspond to the first filename from
%                    the list of filenames.
%
% Example call
%
% Suppose the following directory exists on my computer:
%
% C:\Users\michael\Documents\picsAnd 
%
% it contains the following five files:
%
%  Moon1.png
%  Moon2.png
%  Unicycle1.jpg 
%  Unicycle2.jpg 
%  Unicycle3.jpg 
%
% Here are some examples of calls to ReadImages
%
%>> filenames = {'Moon1.png', 'Moon1.png'}
%>> pics = ReadImages('C:\Users\peter\Documents\pics',filenames)
%
% The output assigned to the variable pics would be a 1x2 cell array.
% The first element of the array would contain a 3D array with the colour
% values for Moon1.png and the second element would contain a 3D array with
% the colour values for Moon2.png.
%
% Author: Michael Shaimerden

imgRGB = cell(1,length(imgFilenames)); % preallocate

% Loop through filenames array, extract  3D image values from each element
% and assign correspondingly to the cell array
for i = 1:length(imgFilenames)
    imgRGB{i} = imread([imgDirName,'/',imgFilenames{i}]);
end
end