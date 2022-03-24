im = imread('E:\WISHAH NASEER\7th Semester\Digital Image Processing\Lab tasks\Lab 09\image1.jpeg');
imshow(im);
title('Original Image');
imgray = rgb2gray(im);
figure;imshow(imgray);
title('Gray scale Image');
imbw = imbinarize(imgray);
figure;imshow(imbw);
title('Binary Image');
imedge=edge(imgray,'canny');
figure ;imshow(imedge);
title('Egde Detection of original Image');
imfill = imfill(imedge,'holes');
figure;imshow(imfill);
title('Filled image');
[L,N] = bwlabel(imfill)
area = regionprops(L,'area')
%imareafilt = bwareaopen(imfill,500);
%figure;imshow(imareafilt);
%title('Filtered area');
boundingbox = regionprops(L,'boundingbox')
hold on
for k = 1:length(boundingbox)
    bboxes = boundingbox(k).BoundingBox;
    rect = rectangle('position',[bboxes(1),bboxes(2),bboxes(3),bboxes(4)],'Edgecolor','y','linewidth',8)
    title('Bounding Boxes');
end
hold off
for k = 1:N
    bboxesarea(k)=(boundingbox(k).BoundingBox(3))*(boundingbox(k).BoundingBox(4));
end
for k = 1:N
    extend(k) = ((area(k).Area))/(bboxesarea(k));
end
for k = 1:N
    if (boundingbox(k).BoundingBox(3) == boundingbox(k).BoundingBox(4))
        if (extend(k) > 0.7 && extend(k) < 0.99)
        text(boundingbox(k).BoundingBox(1),boundingbox(k).BoundingBox(2),'circle');
        else
        text(boundingbox(k).BoundingBox(1),boundingbox(k).BoundingBox(2),'square');
        end
    else
        if (extend(k)> 0.25 && extend(k) < 0.6)
        text(boundingbox(k).BoundingBox(1),boundingbox(k).BoundingBox(2),'triangle');
        else
        text(boundingbox(k).BoundingBox(1),boundingbox(k).BoundingBox(2),'Rectangle')
        end
    end
end

%COLOR DETECTION 
image = imread('E:\WISHAH NASEER\7th Semester\Digital Image Processing\Lab tasks\Lab 09\square.jpg');
pixels = impixel(image) 
[n,m] = size(pixels);
u = 1;
for w = 1:n
    r = pixels(w,u);
    g = pixels(w,u+1);
    b = pixels(w,u+2) ;
    if r > g && r > b
        red = r;
        imshow(image)
        title('The shape you selected is red in color')
    elseif g > r && g>b
        green = g;
        imshow(image)
        title('The shape you selected is green in color')
    elseif b > r && b > g
        blue = b;
        imshow(image)
        title('The shape you selected is blue in color')
    end            
end
