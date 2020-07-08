function imgFilenames = GenerateImageList(dirName,fileExt)
% Fetch a list of the names of all the images with a particular file
% extension that are contained in a specified directory.
%
% Inputs(2): dirName, A string containing the name of the directory the
%                     images are contained in. 
%
%            fileExt, A string containing the file extension of the 
%                     images to fetch.
%            
%                 
%
% Output(1): imgFilenames, A 1xn 1D cell array containing n strings where 
%                          each  element is the filename of an image from 
%                          the specified directory that has a particular 
%                          file extension.
%                       
%
% Example calls
%
%>> filenames = GenerateImageList('C:\Users\peter\Documents\pics','png')
%
%
% The output assigned to the variable filenames would be a 1x2 cell array
% where the first element will contain the string 'Moon1.png' and the
% second element will contain the string 'Moon2.png'.
%
% >> filenames = GenerateImageList('C:\Users\peter\Documents\pics','jpg') 
%    
% The output assigned the variable filenames would be a 1x3 cell array
% where the first element will contain the string 'Unicycle1.jpg',the
% second element will contain the string 'Unicycle2.jpg' and the third 
% element will contain the string 'Unicycle3.jpg'.
%
% Author: Michael Shaimerden
fetchStruct = dir(fullfile(dirName,['*.',fileExt]));%fetch the full structure

imgFilenames = fullfile({fetchStruct.name});% fetch structure filenames
end

