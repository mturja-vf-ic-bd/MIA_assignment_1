function points = generateCirclePoints(I, circle, sigma, res)
    cy = circle(1);
    cx = circle(2);
    rad = circle(3);
    [m, n] = size(I);
    r = floor(rad/sqrt(2)); %r is not rad.
    points1 = [];
    points2 = [];
    points3 = [];
    points4 = [];
    
    % To get a smooth circle I have drawn the image in two parts.
    % Draw half fixing row and finding col
    for row = cy - r:res:cy + r
        if row > 0 && row <= m
            col = rad * rad - (row -  cy) * (row - cy);
            if col > 0
                col1 = floor(sqrt(col) + cx + normrnd(0, sigma) + 1);
                col2 = floor(-1 * sqrt(col) + cx + normrnd(0, sigma) + 1);
                if n >= col1 && col1 > 0
                    points1 = [points1; [row col1]];
                end
                if n >= col2 && col2 > 0
                    points2 = [[row col2]; points2];
                end
            end
        end
    end
    
    % Now another half fixing col and finding row
    for col = cx - r:res:cx + r
        if col > 0 && col <= n
            row = rad * rad - (col -  cx) * (col - cx);
            if row >= 0
                row1 = floor(sqrt(row) + cy + normrnd(0, sigma) + 1);
                row2 = floor(-1 * sqrt(row) + cy + normrnd(0, sigma) + 1);
                if m >= row1 && row1 > 0
                    points3 = [[row1 col]; points3];
                end
                if m >= row2 && row2 > 0
                    points4 = [points4; [row2 col]];
                end
            end
        end
    end
    
    points = [points1; points3; points2; points4];
end