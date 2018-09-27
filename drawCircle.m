function I = drawCircle(I, circle, sigma, intensity, res, thickness)
    [m, n] = size(I);
    circlePoints = generateCirclePoints(m, n, circle, sigma, res);
    circlePoints = circlePoints';
    
    for i = 1:length(circlePoints)-1
        %I = drawLine(I, circlePoints(:, i), circlePoints(:, i + 1), intensity);
    end
    
    for point = circlePoints
        I(point(1), point(2)) = intensity;
    end
    
    if thickness > 1 
        I = drawCircle(I, [circle(1), circle(2), circle(3) + 1], sigma, intensity, res, thickness - 1);
    end
    
end