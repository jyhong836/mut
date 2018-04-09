function [files, dirs] = getFilesUnderDir(dirname, fileExts, dirnames)
% GETFILESUNDERDIR Obtain specific files under dir.
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

files = [];
nfile = 0;
dirs  = [];
ndir  = 0;

for n = 1:length(list)
	name = list(n).name;
	[~,~,ext] = fileparts(name);
	if list(n).isdir
		if isempty(dirnames) || any(strcmp(dirnames, name))
			ndir = ndir + 1;
			dirs{ndir} = name;
		end
	elseif isempty(fileExts) || any(strcmp(fileExts, ext)) % found
		nfile = nfile + 1;
		files{nfile} = name;
	end
end

end
