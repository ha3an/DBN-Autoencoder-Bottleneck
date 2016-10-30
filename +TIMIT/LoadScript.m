%****************************In the Name of God****************************
% A function for loading features from .scp file 

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

function [FileList,FileNum] =LoadScript(List_FileName)
    FileNum=0;
    fid = fopen(List_FileName);
    tline= fgetl(fid);
    FileList='';
    while ischar(tline)        
        FileNum=FileNum+1;
        FileList=cellstr([FileList;tline]);
%         disp(tline);
        tline = fgetl(fid);
    end

    fclose(fid);
end

