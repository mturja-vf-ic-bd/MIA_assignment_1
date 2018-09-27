function acc = removePoint(acc, x, y, rad, weights)
    voters = generateCirclePoints(acc, [x; y; rad], 0, 1)';
    for voter = voters
        probable_points = generateCirclePoints(acc, [voter; rad], 0, 1)';
        for pp = probable_points
            %acc(pp(1, 1), pp(2, 1)) = acc(pp(1, 1), pp(2, 1)) - weights(voter(1, 1), voter(2, 1));
            acc(pp(1, 1), pp(2, 1)) = 0;
        end
    end
    
    % Remove a small portion around the point x, y for better result
    window = int16(0.2 * rad);
    [m, n] = size(acc);
    for i=x-window:1:x+window
        for j=y-window:1:y+window
            if i > 0 && j > 0 && i <= m && j <= n
                acc(i, j) = 0;
            end
        end
    end
    acc = max(acc, 0);
    acc = imgaussfilt(acc, 4);
end