function Inew = drawFilledCircle(Img, center, radius, intensity)
    y = center(1, 1);
    x = center(1, 2);
    [m, n] = size(Img);
    Inew = zeros(m, n);
    
    for i = x-radius:1:x+radius
        for j = y-radius:1:y+radius
            if i > 0 && j > 0 && i <= n && j <=m
                d = (i - x)^2 + (j - y)^2;
                if d <= radius^2
                    Inew(j, i) = max(0, normrnd(intensity(1), intensity(2)));
                end
            end
        end
    end
end