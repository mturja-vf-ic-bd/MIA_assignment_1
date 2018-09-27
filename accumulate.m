function acc = accumulate(Img, voters, weights, rad)
    % Img is the image
    % voters is a 1x3 matrix. First two elements are the coordinates of the
    % voter and the last one is voting weight
    [m, n] = size(Img);
    acc = zeros(m, n);
    i = 1;
    for voter = voters'
        probable_points = generateCirclePoints(Img, [voter; rad], 0, 1)';
        for pp = probable_points
            acc(pp(1, 1), pp(2, 1)) = acc(pp(1, 1), pp(2, 1)) + weights(i, 1);
        end
        i = i + 1;
    end
end