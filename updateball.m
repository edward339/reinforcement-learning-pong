function [state,miss]=updateball(SETUP,state,miss)

% Ball hits top or bottom wall
if state(1) == 1 || state(1) == SETUP(1)
    state(3) =-state(3);
end

% Ball hits left wall
if state(2) == 1
    state(4) = -state(4);
end

% Ball hits left wall (reset ball)
if state(2) == SETUP(2)
    miss=miss+1;
    state(1:4)=[randi(SETUP(1)-2)+1,2,(randi(2)-1.5)*2,1]; % Restart
end

% Ball hits paddle
if state(2) == SETUP(2)-1 && (state(1)+state(3))>=state(5) && (state(1)+state(3))<=state(5)+SETUP(3)
    state(4) = -state(4);
end


% Update ball position
state(1:2)=state(1:2)+state(3:4);

end

