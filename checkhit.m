function [memory,score]=checkhit(SETUP,state,memory,score,LAMBDA)

if state(2) == SETUP(2)-1 && (state(1)+state(3))>=state(5) && (state(1)+state(3))<=state(5)+SETUP(3)
    score=score+1;
    memory(1:length(LAMBDA),end)=LAMBDA;
end

end

