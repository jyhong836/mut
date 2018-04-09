function videoMat = videoUnderDir (dirname, imgformat, imgResize, cropBox)

if ~exist('cropBox', 'var'); cropBox = []; end
nframe = 0;
imgfiles = getFilesUnderDir (dirname, imgformat);
videoMat = [];
for i = 1:length(imgfiles)
	if length(cropBox) > 1
		cb = cropBox{i};
	elseif length(cropBox) == 1
		if iscell(cropBox)
			cb = cropBox{1};
		else
			cb = cropBox;
        end
    else
        cb = [];
	end
	videoMat(:,:,i) = grayResize(fullfile(dirname, imgfiles{i}), imgResize, imgformat, cb);
end

end
