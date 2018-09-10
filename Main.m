m = 512;
n = 512;
Img = zeros(m, n);

cx = 256;
cy = 256;
rad = 100;
intensity = 1;
Img = drawCircle(Img, [cx cy rad], 0, intensity, 5);

[l, p] = size(points);
weights = ones(1, l);
circlePoints = generateCirclePoints(Img, [cx cy rad], sigma, 5);
acc = accumulate(Img, circlePoints', weights, rad);
disp('Initial Accumulator');
[value, idx] = max(acc(:));
col = ceil(idx/m);
row = mod(idx, m);
row
col
%{
disp('Smoothed Accumulator');
acc = boxSmooth(acc, 3);
[value, idx] = max(acc(:));
col = ceil(idx/m);
row = mod(idx, m);
row
col
%}

Img = drawCircle(Img, [col row rad], 0, intensity, 1);
imshow(Img);

%{
Img = drawCircle(Img, [128, 128, 20], 1);
Img = drawCircle(Img, [128, 128, 5], 2);
Img = drawCircle(Img, [128 * 3, 128, 100], 0);
Img = drawCircle(Img, [128 * 3, 128, 20], 1);
Img = drawCircle(Img, [128 * 3, 128, 5], 2);
Img = drawCircle(Img, [128 * 2, 450, 10], 2);
%}

