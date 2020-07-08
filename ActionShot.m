function [newImage] = ActionShot(imageList)
% Creates an action shot image by finding the pixels from a stack of images
% that are most distant from the median RGB values (i.e. each pixel in the
% new image is obtained by finding the pixel in the same row and column of
% the source images that is most distant from the median RGB values of the
% stack of corresponding pixels.
%
% Input(1): imageList, A 1xn 1D cell array containing n images, where each
%                      element is an RGB image (recall RGB images stored as
%                      3D arrays of uint8 values ranging from 0 to 255).
%
% Output(1): newImage, An action shot in the form of an RGB image (stored
%                      as 3D arrays of uint8 values ranging from 0 to 255).
%
% Author: Michael Shaimerden

% Combine all of the images into a 4D array, where the 4th dimension
% is a specific image
imageArray4D = cat(4,imageList{:});

% extract row, column and the number of images
[r,c,~,img] = size(imageArray4D);

% Call median function along 4th dimension (images). Results in a image
% with median RGB values. Check RemoveAction for more information on the
% output.
medianDistances = median(imageArray4D,4);

% Apply Square Distance Formula to the 4D image array (Converted to doubles)
% and the array of median distances. Check PixelDistances for more info
% on the output

% D = (p1 - q1)^2 + (p2 - q2)^2 + (p3 - q3)^2
imageDistances = sum(((abs(double(medianDistances) - double(imageArray4D))).^2),3);

imageDistances = squeeze(imageDistances);

% imageDistances is a 4D array, where 3D RGB dimension was removed (from
% distance calculation). The 3d dimension corresponds to the specific image,
% and the first two dimensions contain the specific image distance values

% find the maximum distances across 3d dimension (e.g. pixels of images
% that have the highest distances)
[maxDistances] = max(imageDistances,[],3);

% Convert to logical array, where '1' represent the max element found in
% the imageDistances 3D array. It is used to find the positions of pixels
% that are needed to form a new image
logicalIndex = (maxDistances == imageDistances);


% Since it is likely that there are more than one max distances produced
% (e.g. images have exactly the same position pixel value), it is important
% to remove any 2nd or 3d occurances of the same distances to prevent
%  the undesired visual abnormalities (such as spread white dots caused by
% 255 255 255 pixels)

% Find other layers (images) that share the max distance with the first layer
x = logicalIndex(:,:,1) & logicalIndex(:,:,2:end);

% The inverse , x , of the "shared position" pixels allows to perform
% matrix multiplication which will remove the pixels (that are shared
% between the first and the second layer) from the 2nd layer (i.e. 2nd
% image)
logicalIndex(:,:,2:end) = logicalIndex(:,:,2:end) .* ~x;

for j = 1:img
    x = logicalIndex(:,:,j) & logicalIndex(:,:,(j+1):end); % check 1st with others
    logicalIndex(:,:,(j+1):end) = logicalIndex(:,:,(j+1):end) .* ~x;
end

newImage = zeros(r,c,3,'uint8'); %Preallocate

logicalIndex = uint8(logicalIndex); % convert to uint8

for i = 1:img % loop through images
    % Using the modified logical array (which contain the positions of  only
    % first occurances of max elements across the 3d dimenssion), image
    % array of maximum pixels can be produced by multiplying each image
    % with it's corresponding max values position. The result of each image
    % is added to create a full image.
    newImage(:,:,1) = newImage(:,:,1) + (imageArray4D(:,:,1,i)).* logicalIndex(:,:,i); %Red
    newImage(:,:,2) = newImage(:,:,2) + (imageArray4D(:,:,2,i)).* logicalIndex(:,:,i); %Green
    newImage(:,:,3) = newImage(:,:,3) + (imageArray4D(:,:,3,i)).* logicalIndex(:,:,i); %Blue
end

end