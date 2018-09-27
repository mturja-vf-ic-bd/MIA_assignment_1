function [acc, Der] = deriveAccumulator(dx, dy, rad, parzen_w, grad_thres, sigmoid)
    % dx, dy is the derivative along x and y axis(different than image axis)
    % rad is the radius of the circle that we are searching
    % parzen_w is the parzen standard deviation to control accumulation
    % grad_thres is a gradient threshold to select who can vote
    
    Der = normcdf(sqrt(dx .* dx + dy .* dy), sigmoid(1, 1), sigmoid(1, 2));
    [voters, weights] = detectVoters(Der, grad_thres); % Find the reasonable voters with their voting weights
    
    [m, n] = size(Der);
    
    acc = imgaussfilt(accumulate(dx, dy, voters, weights, rad), parzen_w);
end