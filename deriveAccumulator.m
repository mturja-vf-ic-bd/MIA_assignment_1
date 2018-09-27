function [acc, Der] = deriveAccumulator(Der, rad, parzen_w, grad_thres)
    % Der is the derivative of the image
    % rad is the radius of the circle that we are searching
    % parzen_w is the parzen standard deviation to control accumulation
    % grad_thres is a gradient threshold to select who can vote
    
    [voters, weights] = detectVoters(Der, grad_thres); % Find the reasonable voters with their voting weights
    
    [m, n] = size(Der);
    I = zeros(m, n);
    
    acc = imgaussfilt(accumulate(I, voters, weights, rad), parzen_w);
end