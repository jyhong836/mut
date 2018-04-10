function [I, cropI] = grayResize (imgfile, sz, imgformat, cropBox)

if ~isempty(imgformat) && strcmp(imgformat(1),'.')
    imgformat = imgformat(2:end);
end
I = imread(imgfile, imgformat);
if exist('cropBox', 'var') && ~isempty(cropBox)
	cropI = imcrop(I, cropBox);
    I = cropI;
else
    cropI = [];
end
I = rgb2gray(I);
I = imresize(I,sz);

end
