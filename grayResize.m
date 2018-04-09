function I = grayResize (imgfile, sz, imgformat, cropBox)

if ~isempty(imgformat) && strcmp(imgformat(1),'.')
    imgformat = imgformat(2:end);
end
I = imread(imgfile, imgformat);
if exist('cropBox', 'var') && ~isempty(cropBox)
	I = imcrop(I, cropBox);
end
I = rgb2gray(I);
I = imresize(I,sz);

end
