m = 256;

cx = 256;
cy = 256;
rad = input('Enter radius: ');
intensity = [1, 0.5];
enforce = 1;
polarity = 1;
sigmoid = [0.2, 0.3];
scale = 0.7;

% Create an image
if exist('img.png', 'file') && enforce == 0
    I = imread('img.png');
else 
    I = drawRandomDisks(256, 256, [30; 30], [256; 256], 1, [40 25 40], [1 0.7 1], [2 0.5 .2], [0.3 0.4 0.1], polarity);
end

imwrite(I, 'img.png');

% Calculate the derivate if it is not cached and not enforced
if exist('Der.txt', 'file') == 2 && enforce == 0
    Der = dlmread('Der.txt');
else
    [dx, dy] = Derivative(I, scale);
    Der = normcdf(sqrt(dx .* dx + dy .* dy), sigmoid(1, 1), sigmoid(1, 2)); % normcdf for smooting
    dlmwrite('Der.txt', Der);
end

[acc, Der] = deriveAccumulator(Der, rad, 10, 0.3);
[x, y] = getMaxCoordinate(acc);
Inew = drawCircle(I, [x y rad], 0, 1, 1, 3);

while true
    rad = input('Enter radius: ');
    if rad < 10
        break;
    end
    acc = removePoint(acc, x, y, rad, Der);
    [x, y] = getMaxCoordinate(acc);
    Inew = Inew + drawCircle(I, [x y rad], 0, 1, 1, 3);
end
subplot(1, 2, 1)
imshow(I);
title('Image');
subplot(1, 2, 2)
imshow(Inew);
title('Detected disk boundaries');




