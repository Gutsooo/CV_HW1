clc
clear

I = imread('E:\lessons\term 6\Computer Vision\HWs\CV_HW_1\sample.ppm');

Angle = "What is your ratation's angle?";

rotation_angle = input(Angle) ;

[rowsi,colsi,z]= size(I); 

radians=2*pi*rotation_angle/360;  

%calculating array dimesions such that  rotated image gets fit in it exactly.
% we are using absolute so that we get  positve value in any case ie.,any quadrant.
rowsf=round(rowsi*abs(cos(radians))+colsi*abs(sin(radians)));                      
colsf=round(rowsi*abs(sin(radians))+colsi*abs(cos(radians)));                     

% define an array withcalculated dimensionsand fill the array  with zeros
% ie.,black
Irotated=uint8(zeros([rowsf colsf 3 ]));

%calculating center of original and final image
xo=ceil(rowsi/2);                                                            
yo=ceil(colsi/2);

midx=ceil((size(Irotated,1))/2);
midy=ceil((size(Irotated,2))/2);

% in this loop we calculate corresponding coordinates of pixel of A 
% for each pixel of C, and its intensity will be  assigned after checking
% weather it lie in the bound of A (original image)
for i=1:size(Irotated,1)
    for j=1:size(Irotated,2)                                                       

         x= (i-midx)*cos(radians)+(j-midy)*sin(radians);                                       
         y= -(i-midx)*sin(radians)+(j-midy)*cos(radians);                             
         x=round(x)+xo;
         y=round(y)+yo;

         if (x>=1 && y>=1 && x<=size(I,1) &&  y<=size(I,2) ) 
              Irotated(i,j,:)=I(x,y,:);  
         end

    end
end

imtool(Irotated,[]);

% image_folder = "D:\Computer Vision - Nader Karimi\HomeWorks\Hw1\CV_HW_1\Q3_without_inbuilt_functions";
% output1 = "Q3_Output1.png";
% output2 = "Q3_Output2.ppm";
% imwrite(Irotated,fullfile(image_folder,output1));
% imwrite(Irotated,fullfile(image_folder,output2));