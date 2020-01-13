function ColorBandIdentifier = ColorBandIdentifier(image,RGB)
[x,map]= rgb2ind(image,20,'nodither');
imagen=ind2rgb(x,map);
[a,b,c] = size(imagen);
IR = imagen;
 for y = 1:a
 for x = 1:b
 if ((IR(y,x,1)>RGB(1) && IR(y,x,1) < RGB(2)) && (IR(y,x,2) > RGB(3) && IR(y,x,2) < RGB(4)) && (IR(y,x,3)  > RGB(5) && IR(y,x,3)  < RGB(6)))
 IR(y,x,1) = IR(y,x,1);
 IR(y,x,2) = IR(y,x,2);
 IR(y,x,3) =  IR(y,x,3);
 else
    IR(y,x,1) = 255;
    IR(y,x,2) = 255;
    IR(y,x,3) =  255; 
 end
 end
 end
IR=rgb2gray(IR);
IR = medfilt2(IR, [4 4]); %% filtro de pixeles
imagen2=im2bw(IR,0.5);
%imagen3 = bwareafilt(imagen2,1,'largest');
%imshowpair(imagen2, imagen3, 'montage');
%imagen3 = bwareaopen(imagen3,20,8);
%imshowpair(imagen3, imagen4, 'montage');
ColorBandIdentifier=imagen2;
end

