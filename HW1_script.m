clc
clear

Path_Name=pwd;
%q1
I=pnmreader([Path_Name '\sample.ppm']);
imshow(uint8(I),[]);
pnmwriter(I,'testppmwiter-2');
I=pnmreader([Path_Name '\testppmwiter-2.ppm']);
figure ,imshow(uint8(I),[]);

I=pnmreader([Path_Name '\sample.pgm']);
figure ,imshow(uint8(I),[]);
pnmwriter(I,'testpgmwiter-2');
I=pnmreader([Path_Name '\testpgmwiter-2.pgm']);
figure ,imshow(uint8(I),[]);

%q2
%run q2.m 

%q3
I=photorotate([Path_Name '\sample.ppm'],10);
figure ,imshow(uint8(I),[]);
pnmwriter(I,'q3answer-2');
I=pnmreader([Path_Name '\q3answer-2.ppm']);
figure ,imshow(uint8(I),[]);