% Project: OHM
% Author: Alan A. Diaz-Montiel, Ivan Barranco, Waltercesar Ponce
% Affiliation: CETYS Universidad
% Date: May 2016

% In order to run first check that the Java version of the system matches
% MATLAB Java's version.

% clear Command Window
clc; clear;

% declare the dynamic path to access to Java classes
javaaddpath('/Users/adiaz/Documents/Programs/Matlab/JavaClassesMatlab/jarcolors.jar');

testList = javaObject('ResistorList'); % list to store the colors detected

% Read image
rgb=imread('220ohm.jpg');
% Show image
imshow(rgb); %% DISPLAY 1
% Convert rgb to 20-color-indexed image
[x,map]= rgb2ind(rgb,20,'nodither');
%figure, imshow(x,map);
imagen=ind2rgb(x,map);
% imtool(imagen);

% 0 - Black Color
% Match black parameters from image
blackImage=ColorBandIdentifier(rgb,[0.38 0.40 0.15 0.17 0.08 0.1]); %resistor1.jpg
% inverts black and white colors
blackImage = imcomplement(blackImage);
% removes the objects with less than 60 pixels
blackImage = bwareaopen(blackImage,60);
% crop borders
%negro=imcrop(negro,[2 2 230 212]); % resistor1.jpg
blackImage = imcrop(blackImage,[10 10 610 220]); % 220ohm.jpg
% assign labels to each object in the image that matches black color
blackLabel = bwlabel(blackImage,8);
%imtool(labelnegro)
blackCentroid = regionprops(blackLabel,'Centroid');
blackCentre=cat(1,blackCentroid.Centroid);
emptyCentre = isempty(blackCentre);
% checks if a color was found
if emptyCentre == 0
    xElements = blackCentre(':',1);
    for x =1:length(xElements)
        color = xElements(x,':'); % x value of color
        blackColor = javaObject('Color',0,color); % black color
        testList.insert(blackColor);
    end
    figure, imshow(blackImage)
    hold on
    plot(blackCentre(1,1),blackCentre(1,2),'X')
    title('Black')
    hold off
end

% 1 - Brown Color
%cafe=ColorBandIdentifier(rgb,[0.22 0.24 0.13 0.15 0.07 0.09]); %resistor1.jpg
% Match brown parameters from image
brownImage=ColorBandIdentifier(imagen,[0.46 0.48 0.22 0.24 0.17 0.19]); % 220ohm
% inverts black and white colors
brownImage = imcomplement(brownImage);
% removes the objects with less than 60 pixels
brownImage = bwareaopen(brownImage,60);
%cafe=imcrop(cafe,[2 2 230 212]); % resistor1.jpg
% crop borders
brownImage=imcrop(brownImage,[10 10 610 220]); % 220ohm.jpg
% assign labels to each object in the image that matches brown color
brownLabel = bwlabel(brownImage,8);
brownCentroid = regionprops(brownLabel,'Centroid');
brownCentre=cat(1,brownCentroid.Centroid);
emptyCentre = isempty(brownCentre);
% checks if a color was found
if emptyCentre == 0
    xElements = brownCentre(':',1);
    for x =1:length(xElements)
        color = xElements(x,':'); % x value of color
        brownColor = javaObject('Color',1,color); % brown color
        testList.insert(brownColor);
    end
    figure, imshow(brownImage)
    hold on
    plot(brownCentre(1,1),brownCentre(1,2),'X')
    title('Brown')
    hold off
end


% 2 - Red Color
% Match red parameters from image
redImage=ColorBandIdentifier(rgb,[0.80 0.82 0.22 0.24 0.22 0.24]); % 220ohm
% inverts black and white colors
redImage = imcomplement(redImage);
% removes the objects with less than 60 pixels
redImage = bwareaopen(redImage,60);
% crop borders
redImage=imcrop(redImage,[10 10 610 220]); % 220ohm.jpg
% assign labels to each object in the image that matches red color
redLabel = bwlabel(redImage,8);
redCentroid = regionprops(redLabel,'Centroid');
redCentre=cat(1,redCentroid.Centroid);
emptyCentre = isempty(redCentre);
% checks if a color was found
if emptyCentre == 0
    xElements = redCentre(':',1);
    for x =1:length(xElements)
        color = xElements(x,':'); % x value of color
        redColor = javaObject('Color',2,color); % rojo color
        testList.insert(redColor);
    end
    figure, imshow(redImage)
    hold on
    plot(redCentre(1,1),redCentre(1,2),'X')
    title('Red')
    hold off
end

% 
% 
% % 3 - Orange Color
% % Match orange parameters from image
% orangeImage=ColorBandIdentifier(rgb,[0.80 0.82 0.22 0.24 0.22 0.24]); % 220ohm
% % inverts black and white colors
% orangeImage = imcomplement(orangeImage);
% % removes the objects with less than 60 pixels
% orangeImage = bwareaopen(orangeImage,60);
% % crop borders
% orangeImage=imcrop(orangeImage,[10 10 610 220]); % 220ohm.jpg
% % assign labels to each object in the image that matches orange color
% orangeLabel = bwlabel(orangeImage,8);
% orangeCentroid = regionprops(orangeLabel,'Centroid');
% orangeCentre=cat(1,orangeCentroid.Centroid);
% emptyCentre = isempty(orangeCentre);
% % checks if a color was found
% if emptyCentre == 0
%     xElements = orangeCentre(':',1);
%     for x =1:length(xElements)
%         color = xElements(x,':'); % x value of color
%         orangeColor = javaObject('Color',3,color); % orange color
%         testList.insert(orangeColor);
%     end
%     figure, imshow(orangeImage)
%     hold on
%     plot(orangeCentre(1,1),orangeCentre(1,2),'X')
%     title('Orange')
%     hold off
% end
% 
% 
% % 4 - Yellow Color
% % Match yellow parameters from image
% yellowImage=ColorBandIdentifier(rgb,[0.80 0.82 0.22 0.24 0.22 0.24]); % 220ohm
% % inverts black and white colors
% yellowImage = imcomplement(yellowImage);
% % crop borders
% yellowImage=imcrop(yellowImage,[10 10 610 220]); % 220ohm.jpg
% % removes the objects with less than 60 pixels
% yellowImage = bwareaopen(yellowImage,60);
% % assign labels to each object in the image that matches yellow color
% yellowLabel = bwlabel(yellowImage,8);
% yellowCentroid = regionprops(yellowLabel,'Centroid');
% yellowCentre=cat(1,yellowCentroid.Centroid);
% emptyCentre = isempty(yellowCentre);
% % checks if a color was found
% if emptyCentre == 0
%     xElements = yellowCentre(':',1);
%     for x =1:length(xElements)
%         color = xElements(x,':'); % x value of color
%         yellowColor = javaObject('Color',4,color); % yellow color
%         testList.insert(yellowColor);
%     end
%     figure, imshow(yellowImage)
%     hold on
%     plot(yellowCentre(1,1),yellowCentre(1,2),'X')
%     title('Yellow')
%     hold off
% end
% 
% 
% 
% % 5 - Green Color
% % Match green parameters from image
% greenImage=ColorBandIdentifier(rgb,[0.22 0.24 0.24 0.26 0.14 0.16]); %resistor1.jpg
% % inverts black and white colors
% greenImage = imcomplement(greenImage);
% % removes the objects with less than 60 pixels
% greenImage = bwareaopen(greenImage,60);
% % crop borders
% %verde=imcrop(verde,[2 2 230 212]); % resistor1.jpg
% greenImage=imcrop(greenImage,[10 10 610 220]); % 220ohm.jpg
% % assign labels to each object in the image that matches green color
% greenLabel = bwlabel(greenImage,8);
% %imtool(labelverde)
% greenCentroid = regionprops(greenLabel,'Centroid');
% greenCentre=cat(1,greenCentroid.Centroid);
% emptyCentre = isempty(greenCentre);
% % checks if a color was found
% if emptyCentre == 0
%     xElements = greenCentre(':',1);
%     for x =1:length(xElements)
%         color = xElements(x,':'); % x value of color
%         greenColor = javaObject('Color',5,color); % green color
%         testList.insert(greenColor);
%     end
%     figure, imshow(greenImage)
%     hold on
%     plot(greenCentre(1,1),greenCentre(1,2),'X')
%     title('Green')
%     hold off
% end
% 
% 
% 
% % 6 - Blue Color
% % Match blue parameters from image
% blueImage=ColorBandIdentifier(rgb,[0.22 0.24 0.24 0.26 0.14 0.16]); %resistor1.jpg
% % inverts black and white colors
% blueImage = imcomplement(blueImage);
% % removes the objects with less than 60 pixels
% blueImage = bwareaopen(blueImage,60);
% % crop borders
% blueImage=imcrop(blueImage,[10 10 610 220]); % 220ohm.jpg
% % assign labels to each object in the image that matches blue color
% blueLabel = bwlabel(blueImage,8);
% %imtool(labelverde)
% blueCentroid = regionprops(blueLabel,'Centroid');
% blueCentre=cat(1,blueCentroid.Centroid);
% emptyCentre = isempty(blueCentre);
% % checks if a color was found
% if emptyCentre == 0
%     xElements = blueCentre(':',1);
%     for x =1:length(xElements)
%         color = xElements(x,':'); % x value of color
%         blueColor = javaObject('Color',5,color); % blue color
%         testList.insert(blueColor);
%     end
%     figure, imshow(blueImage)
%     hold on
%     plot(blueCentre(1,1),blueCentre(1,2),'X')
%     title('Blue')
%     hold off
% end
% 
% 
% 
% % 7 - Violet Color
% % Match violet parameters from image
% violetImage=ColorBandIdentifier(rgb,[0.22 0.24 0.24 0.26 0.14 0.16]); %resistor1.jpg
% % inverts black and white colors
% violetImage = imcomplement(violetImage);
% % removes the objects with less than 60 pixels
% violetImage = bwareaopen(violetImage,60);
% % crop borders
% violetImage=imcrop(violetImage,[10 10 610 220]); % 220ohm.jpg
% % assign labels to each object in the image that matches violet color
% violetLabel = bwlabel(violetImage,8);
% %imtool(labelverde)
% violetCentroid = regionprops(violetLabel,'Centroid');
% violetCentre=cat(1,violetCentroid.Centroid);
% emptyCentre = isempty(violetCentre);
% % checks if a color was found
% if emptyCentre == 0
%     xElements = violetCentre(':',1);
%     for x =1:length(xElements)
%         color = xElements(x,':'); % x value of color
%         violetColor = javaObject('Color',5,color); % blue color
%         testList.insert(violetColor);
%     end
%     figure, imshow(violetImage)
%     hold on
%     plot(violetCentre(1,1),violetCentre(1,2),'X')
%     title('Violet')
%     hold off
% end
% 
% 
% 
% % 8 - Grey Color
% % Match grey parameters from image
% greyImage=ColorBandIdentifier(rgb,[0.22 0.24 0.24 0.26 0.14 0.16]); %resistor1.jpg
% % inverts black and white colors
% greyImage = imcomplement(greyImage);
% % removes the objects with less than 60 pixels
% greyImage = bwareaopen(greyImage,60);
% % crop borders
% greyImage=imcrop(greyImage,[10 10 610 220]); % 220ohm.jpg
% % assign labels to each object in the image that matches grey color
% greyLabel = bwlabel(greyImage,8);
% %imtool(labelverde)
% greyCentroid = regionprops(greyLabel,'Centroid');
% greyCentre=cat(1,greyCentroid.Centroid);
% emptyCentre = isempty(greyCentre);
% % checks if a color was found
% if emptyCentre == 0
%     xElements = greyCentre(':',1);
%     for x =1:length(xElements)
%         color = xElements(x,':'); % x value of color
%         greyColor = javaObject('Color',5,color); % blue color
%         testList.insert(greyColor);
%     end
%     figure, imshow(greyImage)
%     hold on
%     plot(greyCentre(1,1),greyCentre(1,2),'X')
%     title('Grey')
%     hold off
% end
% 


% Read list
testList.readList();


% get the head of the list in order to sort it
% in ascending order
headColor = javaObject('Color');
headColor = testList.getHead();

% apply the mergesort algorithm to sort in increasing order
testList.mergeSortLinkList(headColor);
fprintf(1, '\n');

% show the list ordered
testList.readList();