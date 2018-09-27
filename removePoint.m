function acc = removePoint(acc, x, y, parzen_w)
    
    % Remove a small portion around the point x, y for better result
    window = 2 * parzen_w;
    [m, n] = size(acc);
    for i=x-window:1:x+window
        for j=y-window:1:y+window
            if i > 0 && j > 0 && i <= m && j <= n
                acc(i, j) = 0;
            end
        end
    end
    acc = max(acc, 0);
    acc = imgaussfilt(acc, parzen_w);
end