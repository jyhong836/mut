function videoMat = videoUnderDir (dirname, imgformat, imgResize, cropBox, writeBox)
% Get video from images under dir and crop them accordingly.
%
% INPUT:
% 	cropBox - Define the box or boxes to crop. Could be cell array or single vector.
% 	writeBox - Write box data to 'gt' dir.

if ~exist('cropBox', 'var'); cropBox = []; end
if ~exist('writeBox', 'var'); writeBox = false; end
nframe = 0;
imgfiles = getFilesUnderDir (dirname, imgformat);
videoMat = [];
if ~isempty(cropBox) && length(imgfiles) > length(cropBox)
	videoMat = [];
	return
end
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
	
	[I, cropI] = grayResize(fullfile(dirname, imgfiles{i}), imgResize, imgformat, cb);
	if writeBox && ~isempty(cropI) % write cropped image
		% fprintf('writing jpeg. ');
		jpegdir = fullfile(dirname, 'jpeg');
		if ~exist(jpegdir, 'dir')
			mkdir(jpegdir);
		end
		wfn = fullfile(jpegdir, imgfiles{i});
		imwrite(cropI, wfn);
	end
	videoMat(:,:,i) = I;		
end

end
