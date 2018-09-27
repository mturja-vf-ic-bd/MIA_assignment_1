function acc = accumulate(dx, dy, voters, weights, rad)
    % Img is the image
    % voters is a 1x3 matrix. First two elements are the coordinates of the
    % voter and the last one is voting weight
    [m, n] = size(dx);
    acc = zeros(m, n);
    i = 1;
    for voter = voters'
        % probable_points = generateCirclePoints(m, n, [voter; rad], 0, 1)';
        Dx = dx(voter(1, 1), voter(2, 1));
        Dy = dy(voter(1, 1), voter(2, 1));
        D = sqrt(Dx*Dx + Dy*Dy);
        pp = voter + floor([Dy; -Dx] * rad/D);
        if pp(1, 1) > 0 && pp(1, 1) <=m && pp(2, 1) > 0 && pp(2, 1) <=n
            acc(pp(1, 1), pp(2, 1)) = acc(pp(1, 1), pp(2, 1)) + weights(i, 1);
        end
        i = i + 1;
    end
end