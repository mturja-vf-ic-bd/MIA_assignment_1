function voters = detectVoters(derivative, threshold)
    imgderx = derivative(1);
    imgdery = derivative(2);
    [m, n] = size(imgderx);
    voters = [];
    
    for i = 1:m
        for j = 1:n
            grad = sqrt(imgderx(i, j) ^ 2 + imgdery(i, j) ^ 2);
            if grad >= threshold
                voters.append(py.tuple({i, j}));
            end
        end
    end
end