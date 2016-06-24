% Neural Network Q learner for the game 'Pong'

clear all; close all;
HEIGHT = 21; % Board height
WIDTH = 41; % Board width
PADDLE = 5; % Paddle height
BALL = 1; % Ball
MEM_SIZE = 8000; % Number of stored states
BATCH_SIZE = 2000; % Batch size for NN training (keep large for RProp)
TRAINING_FREQUENCY = 300; % Train neural network every n states
DISPLAY_START = 2000; % Display game after n trains
TRAIN_EPOCHS = 1; % Number of epochs per train
RANDOMNESS = 20; % 1/n paddle moves are probabalistic (not random)
SETUP=[HEIGHT, WIDTH, PADDLE, BALL, MEM_SIZE, BATCH_SIZE, TRAINING_FREQUENCY, DISPLAY_START, TRAIN_EPOCHS, RANDOMNESS];

% state of the game: ball y, ball x, ball y', ball x', paddle y 
state=[randi(HEIGHT-2)+1,2,(randi(2)-1.5)*2,1,randi(HEIGHT)];

% Initialise control: up, stay, down
control=[0 0 0];

% Decay term for future reward
LAMBDA=[0.9*ones(WIDTH-3,1)'].^[1:(WIDTH-3)];

% Initiliase memory stack
memory=zeros(MEM_SIZE,size(state,2)+size(control,2)+1);

% Neural Network Parameters
w1=randn(8, 50); % Weights
w2=randn(50,50);
w3=randn(50,1);
ALPHA=0.001; % Initial alpha for RProp
alpha1=ALPHA*ones(size(w1));
alpha2=ALPHA*ones(size(w2));
alpha3=ALPHA*ones(size(w3));
dw1=randn(size(w1)); % Initial gradients for RProp
dw2=randn(size(w2));
dw3=randn(size(w3));

% Keep track of these
score = 0;
miss = 0;
trains = 0;

% Begin
for j=1:1000000000
[state, control] = updatepaddle(SETUP,state,trains,w1,w2,w3); % Move the paddle
memory = updatememory(memory,state,control); % Add state to stack
[memory,score]=checkhit(SETUP,state,memory,score,LAMBDA); % Check for contact with paddle
[state,miss] = updateball(SETUP,state,miss); % Move the ball
displayboard(SETUP,state,trains) 
%Train neural network with RProp
[ w1,w2,w3,dw1,dw2,dw3,alpha1,alpha2,alpha3,trains ] = nntrain(memory,w1,w2,w3,dw1,dw2,dw3,alpha1,alpha2,alpha3,SETUP,trains,j,miss,score);
end



