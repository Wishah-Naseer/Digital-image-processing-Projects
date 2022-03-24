%IMAGE RESIZIE
I = imread('E:\WISHAH NASEER\7th Semester\Digital Image Processing\Lab tasks\Lab14\project1.jpeg');
J = imresize(I, [320 240]);
figure, imshow(I)
title('Original image')
figure, imshow(J)
title('Resized image')
%COLOR ADJUSTMENT
C = imadjust(J, [0.3,0.9],[]);
figure
imshow(C);
title('Color adjusted image')
%COLOR PROCESSING
Red = C(:,:,1);
Green= C(:,:,2);
Blue= C(:,:,3);
[rrow,rcol] = size(Red);
y1 = zeros(rrow,rcol);
y2 = zeros(rrow,rcol);
y3 = zeros(rrow,rcol);
for i=1:rrow
    for j=1:rcol
        if Red(i,j)<100; 
            y1(i,j) = 0;
            y2(i,j) = 0;
            y3(i,j) = 0;
        elseif Red(i,j)>Green(i,j)
            if Red(i,j)>Blue(i,j);
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else 
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end 
        elseif Red(i,j)<= 100 
            if Blue(i,j)<=100;
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else 
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end
        elseif Red(i,j) <= 100 
            if Green(i.j)<=100
                if Blue(i,j)<100;
                    y1(i,j) = 0;
                    y2(i,j) = 0;
                    y3(i,j) = 0;
                else  
                    y1(i,j) = Red(i,j);
                    y2(i,j) = Green(i,j);
                    y3(i,j) = Blue(i,j);
                end
           else
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);  
            end
        elseif Green(i,j) <100 
            if Blue(i,j) < 100;
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end
        elseif Green(i,j)< 100 
            if Blue <100;
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else  
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end
        elseif Green (i,j) >=100 
            if Blue(i,j) >= 100
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else 
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end
        elseif Green(i,j)<= 170 
            if Blue <=150;
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else  
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end
        elseif Green(i,j) > Blue(i,j) 
            if Blue(i,j) > Red (i,j);
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else  
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end 
        elseif Red(i,j) < 200 
            if Green (i,j) < 200 
                if Blue (i,j) < 200;
                    y1(i,j) = 0;
                    y2(i,j) = 0;
                    y3(i,j) = 0;
                else  
                    y1(i,j) = Red(i,j);
                    y2(i,j) = Green(i,j);
                    y3(i,j) = Blue(i,j);
                end 
            else  
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end
                
        elseif Red(i,j) >= Green (i,j) 
            if Green(i,j) >= Blue(i,j);
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else  
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end
        elseif Blue (i,j) > Red(i,j)  
            if Blue(i,j) > Green (i,j);
                y1(i,j) = 0;
                y2(i,j) = 0;
                y3(i,j) = 0;
            else  
                y1(i,j) = Red(i,j);
                y2(i,j) = Green(i,j);
                y3(i,j) = Blue(i,j);
            end 
        else
            y1(i,j) = Red(i,j);
            y2(i,j) = Green(i,j);
            y3(i,j) = Blue(i,j);
        end
    end
end
y = cat(3, y1, y2, y3)
figure
imshow(y)
title('Color Processed image')
%CIRCULAR HOUGH TRANSFORM
im=imread('E:\WISHAH NASEER\7th Semester\Digital Image Processing\Lab tasks\Lab14\project1.jpeg');
red=im(:,:,1);
green=im(:,:,2);
blue=im(:,:,3);
rednorm=im2double(red)/im2double(max(max(red)));
greennorm=im2double(green)/im2double(max(max(green)));
bluenorm=im2double(blue)/im2double(max(max(blue)));
im1=cat(3,rednorm,greennorm,bluenorm);
im3 = imadjust(im1,[0.4 0.6 0.1;1 1 1],[0 1]);
imgray = rgb2gray(im3)
imshow(imgray)
title('Gray scale image')
imfilt = medfilt2(imgray);figure;imshow(imfilt);
title('Results Of Circular Hough Transform')
[centers,radii] = imfindcircles(imfilt,[9 20],'ObjectPolarity','bright', ...
    'Sensitivity',0.9)
h = viscircles(centers,radii);
det = size(radii,1) %the number of objects detected (Count of objects)