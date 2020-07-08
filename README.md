###matlab-image-processing

Combine multiple action shot images into one or remove action to produce a clean image using MATLAB

An Action Shot is an image that feature the moving person or object shown in different locations. 
These kinds of images are sometimes used in extreme sport magazines, in order to show people moving over a jump or performing some other kind of action.

Another image that is produced by this code is the Action Removed image where the moving person or object is removed from the image and the static background is shown.

This code uses vectorization to deliver efficient running times. The key is in utilizing Matlab's most useful tool which are matrices (hence Matrix Laboratory). 
The action shot images are combined into a 4D array where the first three layers are RGB values of the image and the last dimension is the corresponding image. 
Operations such as median(array,4) can be used to simply find necessrily values.
