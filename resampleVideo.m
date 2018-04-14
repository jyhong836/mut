function M = resampleVideo (videoMat, expLen)
% resample video to expected length.
%	videoMat - video matrix.
%	expLen - Expected length.

assert(~isempty(videoMat), 'Error: try to resample an empty video');
M = tensor3_unfold(videoMat, 3);
M = resample(double(M), expLen, size(videoMat,3));
M = permute(reshape(M, size(M,1), size(videoMat,2), size(videoMat,1)), [2,3,1]);
M = uint8(M);

% videoMat = uint8(videoMat);
% for f = 1:size(M, 3)
% 	imshowpair(M(:,:, f),videoMat(:,:, f),'montage');
% 	pause(0.1);
% end

end

