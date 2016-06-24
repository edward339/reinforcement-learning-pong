function [ memory ] = updatememory(memory,state,control);

% Add state and control to memory stack
memory = circshift(memory,1,1);
memory (1,:)=[state control 0];

end

