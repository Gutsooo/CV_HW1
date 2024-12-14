function [Image] = pnmreader(Filename)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% open the file and read the whole thing
fid = fopen(Filename);
File_Content = fread(fid,inf,'uint8=>char')';
fclose(fid);
% find header delimiters
ws = find(isspace(File_Content),4,'first');
% get file parts (assuming no comments)
magicnum = File_Content(1:ws(1)-1); % this is expected to be P5
% if P2, P3, or P6, do whatever is needed
imgeometry = [str2double(File_Content(ws(1)+1:ws(2)-1)) str2double(File_Content(ws(2)+1:ws(3)-1))];
maxgval = str2double(File_Content(ws(3)+1:ws(4)-1)); % expected to be 255
File_Content = uint8(File_Content);
w = imgeometry(1);
h = imgeometry(2);
Image_Data = File_Content(ws(4)+1:end);
if strcmp(magicnum , 'P5')
    I = zeros(h,w);
    k=1;
    for i=1:h
        for j=1:w
        I(i,j)=Image_Data(k);
        k=k+1;
        end
    end
else strcmp(magicnum , 'P6')
     I = zeros(h,w,3);
    k=1;
    n=1;
    for i=1:h
        for j=1:w
        I(i,j,1)=Image_Data(k);
        I(i,j,2)=Image_Data(k+1);
        I(i,j,3)=Image_Data(k+2);
        k=3*n+1;
        n=n+1;
        end
    end
end
Image=I;

end
