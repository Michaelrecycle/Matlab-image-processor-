function [frameNums] = GenerateFrameList(startFrameNum,stepSize,numOfFrames)
% Generates a list of frames we are interested in which can be used by
% other functions.  In particular it will be useful for determining which
% frames to extract from a movie file.
%
% Inputs(3): startFrameNum, A starting frame number.
%
%            stepSize, A step size.
%
%            numOfFrames, The number of frames to generate(n).
%
%
% Output(1): frameNums, returns a single output, a 1xn 1D array, where n
%                       is the desired number of frames(n).  The first 
%                       element of the array will be the starting frame 
%                       number and each subsequent element will have a
%                       frame value that is the step size greater than the
%                       last.
%
% Example calls
%
%>> frameNumbers= GenerateFrameList(1,4,3)
%
%   frameNumbers =
%
%         1     5     9
%
%>> frameList = GenerateFrameList (10,20,4)
%
%   frameList =
%
%         10    30    50    70
%
% Author: Michael Shaimerden

% Vector creation
frameNums = startFrameNum:stepSize:startFrameNum +(numOfFrames*stepSize) - stepSize;

end