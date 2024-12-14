clc
clear
Path_Name=pwd;
I2=pnmreader([Path_Name '\sample.ppm']);
I=I2;
a=160000/4;
b=640000/4;
for i=1:size(I,1)
    for j=1:size(I,2)
        x=((i-size(I,1)/2)^2)/a+((j-size(I,2)/2)^2/b);
        y=((i-size(I,1)/2)^2)/b+((j-size(I,2)/2)^2/a);
         if (x < 1) & (y < 1)
             I(i,j,1)=255;
             I(i,j,2)=255;
             I(i,j,3)=255;
         elseif (x < 1) & (y > 1)
             I(i,j,1)=255-I(i,j,1);
             I(i,j,2)=255-I(i,j,2);
             I(i,j,3)=255-I(i,j,3);
         elseif (x > 1) & (y > 1)
             gs=0.2989*(I(i,j,1))+0.5870*(I(i,j,2))+0.1140*(I(i,j,3));
             I(i,j,1)=gs;
             I(i,j,2)=gs;
             I(i,j,3)=gs; 
         end
    end
end

pnmwriter([I;I2],'q2answer-2');
I=pnmreader([Path_Name '\q2answer-2.ppm']);
imshow(uint8(I),[]);
