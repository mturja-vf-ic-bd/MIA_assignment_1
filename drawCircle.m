function Inew = drawCircle(I, circle, sigma, intensity, res)
    circlePoints = generateCirclePoints(I, circle, sigma, res);
    Inew = I(:,:);
    for point = circlePoints'
        Inew(point(1), point(2)) = intensity;
    end
end