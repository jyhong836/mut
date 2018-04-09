function [mapValues] = mapFilesUnderDir(dirname, fileExts, mapFunc)
% MAPFILESUNDERDIR Obtain specific files under dir.
%
%	[jpgfiles] = getFilesUnderDir('some_dir', {'.jpg'});

if ~exist('fileExts', 'var') % || isempty(fileExts)
	fileExts = [];
end
if ~exist('dirnames', 'var') % || isempty(dirnames)
	dirnames = [];
end

% Get all files/dirs
list = dir(dirname);
list = list(3:end); % remove '.' and '..'

mapValues = [];
nfile = 0;

for n = 1:length(list)
	name = list(n).name;
	[~,~,ext] = fileparts(name);
	if ~list(n).isdir && (isempty(fileExts) || any(strcmp(fileExts, ext))) % found
		nfile = nfile + 1;
		% files{nfile} = name;
		mapValues{nfile} = mapFunc(fullfile(dirname, name));
	end
end

end
