m = 256;
n = 256;
cx = 256;
cy = 256;
num_circle = 2;
rad = input('Enter radius: ');
intensity = [1, 0.5];
enforce = 0;
polarity = 1;
sigmoid = [0.2, 0.3];
scale = 0.7;
thickness = 1;

% Create an image
if exist('img.png', 'file') && enforce == 0
    I = imread('img.png');
else 
    I = drawRandomDisks(256, 256, [0; 0], [250; 250], num_circle, [40 40 40 30], [1 1 1 0.5], [0.1 0.1 2 .1], [0.1 1 0.1 0.7], polarity);
end

imwrite(I, 'img.png');

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

[acc, Der] = deriveAccumulator(dx, dy, rad, 10, 0.3, sigmoid);
[x, y] = getMaxCoordinate(acc);
I = drawCircle(I, [x y rad + 4], 0, 1 - polarity, 2, thickness);

subplot(2, num_circle, 1);
imshow(I);
title('(a) 1 circle detected');

subplot(2, num_circle, 1 + num_circle);
imshow(acc);
title('(b) Acc at t = 1');

for j = 1:num_circle - 1
    rad = input('Enter radius: ');
    if rad < 10
        break;
    end
    acc = removePoint(acc, x, y, 3);
    [x, y] = getMaxCoordinate(acc);
    I = drawCircle(I, [x y rad + 4], 0, 1 - polarity, 2, thickness);
    
    subplot(2, num_circle, j + 1);
    imshow(I);
    if j == 1
        title(strcat('(c) ', strcat(num2str(j+1), ' circle detected')));
    else
        title(strcat('(e) ', strcat(num2str(j+1), ' circle detected')));
    end

    subplot(2, num_circle, j + 1 + num_circle);
    imshow(acc);
    if j == 1
        title(strcat('(d) Acc at t = ', num2str(j+1)));
    else
        title(strcat('(f) Acc at t = ', num2str(j+1)));
    end
end




