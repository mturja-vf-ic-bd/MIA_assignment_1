I = rgb2gray(imread('disk.jpg'));
whos I
BW1 = edge(I, 'Canny');
imshow(BW1)

