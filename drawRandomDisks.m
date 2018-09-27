function Img = drawRandomDisks(m, n, corner1, corner2, num_circle, rad, intensity, blur, noise, polarity)
    % m, n is the dimenstion of the image
    % corner1 and corner2 defines the window where we want the circles
    % num_circle is the number of circle we want
    % rad is the list of radius for each circle
    % intensity is the list of intensities for the circles
    % blur is the blur level of the circles
    % noise is the intensity noise for each circle
    % black disk on white or vice versa
    
    Img = zeros(m, n);
    X = randi([corner1(1, 1) corner2(1, 1)], 1, num_circle);
    Y = randi([corner1(2, 1) corner2(2, 1)], 1, num_circle);
    for i =1:num_circle
        Img = Img + imgaussfilt(drawFilledCircle(Img, [X(i) Y(i)], rad(i), [intensity(i), noise(i)]), blur(i));
    end
    
    if polarity == 1
        Img = polarity - Img;
    end
end