function Inew = drawCircle(I, circle, sigma, intensity, res, thickness)
    circlePoints = generateCirclePoints(I, circle, sigma, res);
    Inew = zeros(size(I));
    [m, n] = size(circlePoints);
    circlePoints = circlePoints';
    
    for i = 1:m-1
        Inew = drawLine(Inew, circlePoints(:, i), circlePoints(:, i + 1), intensity);
    end
    
    for point = circlePoints
        Inew(point(1), point(2)) = intensity;
    end
    
    if thickness >1 
        Inew = Inew + drawCircle(Inew, [circle(1), circle(2), circle(3) + 1], sigma, intensity, res, thickness - 1);
    end
    
end