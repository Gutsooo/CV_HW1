clc
clear
image=pnmreader('E:\lessons\term 6\Computer Vision\HWs\CV_HW_1\sample.pgm');

%image padding
[Rows, Cols] = size(image); 
if ndims(image)>2
    Cols=Cols/3;
    Diagonal = sqrt(Rows^2 + Cols^2); 
    RowPad = ceil(Diagonal - Rows) + 2;
    ColPad = ceil(Diagonal - Cols) + 2;
    imagepad = zeros(Rows+RowPad, Cols+ColPad,3);
    imagepad(ceil(RowPad/2):(ceil(RowPad/2)+Rows-1),ceil(ColPad/2):(ceil(ColPad/2)+Cols-1),3) = image;
else
    Diagonal = sqrt(Rows^2 + Cols^2); 
    RowPad = ceil(Diagonal - Rows) + 2;
    ColPad = ceil(Diagonal - Cols) + 2;
    imagepad = zeros(Rows+RowPad, Cols+ColPad);
    imagepad(ceil(RowPad/2):(ceil(RowPad/2)+Rows-1),ceil(ColPad/2):(ceil(ColPad/2)+Cols-1)) = image;
end

rads=pi/4;

%midpoints
midx=ceil((size(imagepad,1)+1)/2);
midy=ceil((size(imagepad,2)+1)/2);

imagerot=zeros(size(imagepad)); % midx and midy same for both

for i=1:size(imagerot,1)
    for j=1:size(imagerot,2)

         x= (i-midx)*cos(rads)+(j-midy)*sin(rads);
         y=-(i-midx)*sin(rads)+(j-midy)*cos(rads);
         x=round(x)+midx;
         y=round(y)+midy;

         if (x>=1 && y>=1 && x<=size(imagepad,2) && y<=size(imagepad,1))
              imagerot(i,j)=imagepad(x,y); % k degrees rotated image         
         end

    end
end

figure2, imshow(uint8(imagerot),[]);