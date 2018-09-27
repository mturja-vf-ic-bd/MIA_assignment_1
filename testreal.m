I = imread('images/real3.png');
I = imresize(I, [256, 256]);
enforce = 0;
polarity = 0;
intensity = [1, 0.5];
enforce = 0;
polarity = 0;
sigmoid = [0.2, 0.3];
scale = 0.7;
thickness = 4;
rad = 100;

% Calculate the derivate if it is not cached and not enforced
if exist('dx.txt', 'file') == 2 && enforce == 0
    dx = dlmread('dx.txt');
    dy = dlmread('dy.txt');
else
    [dx, dy] = Derivative(I, scale);
    dlmwrite('dx.txt', dx);
    dlmwrite('dy.txt', dy);
end

if polarity == 0
    dx = -dx;
    dy = -dy;
end

[acc, Der] = deriveAccumulator(dx, dy, rad, 5, 0.3, sigmoid);
[x, y] = getMaxCoordinate(acc);
I = drawCircle(I, [x y rad + 4], 0, 1, 2, thickness);
subplot(1, 2, 1);
imshow(I);
title('Image');
subplot(1, 2, 2);
imshow(acc);
title('Accumulator');