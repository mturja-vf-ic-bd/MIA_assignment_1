function [voters, weights] = detectVoters(Der, voter_thres)
    
    
    [m, n] = size(Der);
    voters = [];
    weights = [];
    for i=1:m
        for j = 1:n
            if Der(i, j) > voter_thres
                voters = [voters; [i, j]];
                weights = [weights; Der(i, j)];
            end
        end
    end
end