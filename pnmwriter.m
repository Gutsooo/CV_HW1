function [Image] = pnmwriter(I,Filename)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

imgeometry = size(I);
w = imgeometry(1);
h = imgeometry(2);
if ndims(I)>2
    %ppm
    header = "P6 "+imgeometry(2)+ ' '+imgeometry(1)+" 255 ";
    Filename=Filename+".ppm";
    fid = fopen( Filename, 'wt' );
    k=1;
    n=1;
    for i=1:w
        for j=1:h
        Image_Data(k,1)=I(i,j,1);
        Image_Data(k+1,1)=I(i,j,2);
        Image_Data(k+2,1)=I(i,j,3);
        k=3*n+1;
        n=n+1;
        end
    end
elseif ndims(I)==2
    %pgm

    header = "P5 "+imgeometry(2)+ ' '+imgeometry(1)+' 255 ';
    Filename=Filename+".pgm";
    fid = fopen(Filename, 'wt' );
    k=1;
    for i=1:w
        for j=1:h
        Image_Data(k,1)=I(i,j);
        k=k+1;
        end
    end
else
    error('Unknown image format');
end

fprintf( fid,'%s',header);
fclose(fid);
fid = fopen(Filename, 'a' );
fwrite(fid,Image_Data);
fclose(fid);

end