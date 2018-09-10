function Inew = boxSmooth(I, boxsize)
    [m, n] = size(I);
    Inew = I(:,:);
    w = fix(boxsize/2);
    for i = 1 + w:m - w
        for j = 1 + w:n - w
            Inew(i, j) = sum(sum(I(i - w:i + w, j - w:j + w)));
        end
    end     
end