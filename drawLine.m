function Img = drawLine(Img, X, Y, intensity, varargin)
    V = X - Y;
    x = X(1, 1);
    y = X(2, 1);
    if V(1, 1) == 0
        for i = 1:abs(V(2, 1))
            Img(x, y) = intensity;
            y = y + 1;
        end
        
    elseif V(2, 1) == 0
        for i = 1:abs(V(1, 1))
            Img(x, y) = intensity;
            x = x + 1;
        end
    else
        m = V(2, 1)/V(1, 1);
        disp(m);
        for i = 1:abs(V(1, 1))
            if x >=1 && y >=1
                Img(ceil(x), ceil(y)) = intensity;
            end
            if abs(m) > 1
                x = x + 1/m;
                y = y + 1;
            else
                x = x + 1;
                y = y + m;
            end
        end
    end
    
    if length(varargin) > 0
        drawLine(Img, Y, X, intensity);
    end
end