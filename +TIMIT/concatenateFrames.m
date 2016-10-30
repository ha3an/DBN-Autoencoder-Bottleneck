%****************************In the Name of God****************************
% A function for concatenate features by using hankel matrix


% Permission is granted for anyone to copy, use, modify, or distribute this
% program and accompanying programs and documents for any purpose, provided
% this copyright notice is retained and prominently displayed, along with
% a note saying that the original programs are available from our web page.
%
% The programs and documents are distributed without any warranty, express
% or implied.  As the programs were written for research purposes only,
% they have not been tested to the degree that would be advisable in any
% important application.  All use of these programs is entirely at the
% user's own risk.

% CONTRIBUTORS
%	Created by:
%   	Hassan Taherian
%   	09/2016
%
%           LIMP(Laboratory for Intelligent Multimedia Processing),
%           AUT(Amirkabir University of Technology), Tehran, Iran
% 
%**************************************************************************

function result=concatenateFrames(matrix,FrameNum)
%%Concatenate FrameNum Frames
X=hankel(1:FrameNum,FrameNum:size(matrix,1)).';
temp=zeros(size(matrix,1)-FrameNum+1,FrameNum,size(matrix,2));
for i=1:size(matrix,2)
    col=matrix(:,i);
    temp(:,:,i)=col(X);
end
result=[];
for i=1:FrameNum
    for j=1:size(matrix,2)
    result=[result,temp(:,i,j)];
    end
end
