function voters = detectVotersHighIntensity(Img, threshold)
    [m, n] = size(Img);
    voters = [];
    
    for i=1:m
        for j=1:n
            if Img(i, j) > threshold
                %disp(Img(i, j));
                voters = [voters; [i j 1]];
            end
        end
    end
end