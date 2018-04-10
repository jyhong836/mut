function M = tensor3_unfold (Y, k)
% 3-order tensor flattening or unfolding.
% 	Y - A tensor of size, [h, w, T].
% 	k - The dimension to unfold over.
%
% Author: Junyuan Hong

dimorder = [k, 1:(k-1), (k+1):3];
M = reshape(permute(Y, dimorder), size(Y,k), []);

end
