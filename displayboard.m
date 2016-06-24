function [] = displayboard(SETUP,state,trains)

if trains>=SETUP(8)
    % Make board
    board=zeros(SETUP(1),SETUP(2));
    
    % Add ball
    board(state(1),state(2))=1;
    
    % Add paddle
    board(state(5):state(5)+SETUP(3)-1,end)=ones(SETUP(3),1);
    
    
    imagesc(board);
    axis equal tight
    pause(0.02);
end

end

