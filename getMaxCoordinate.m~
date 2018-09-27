function [x, y] = getMaxCoordinate(acc)
    [m, n] = size(acc);
    [M, ind] = max(acc(:));
    y = ceil(ind/m);
    x = rem(ind - 1, m) + 1;
end