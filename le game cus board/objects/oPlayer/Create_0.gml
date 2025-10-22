
controlsSetup();

// sprite
falling = playerFalling;
jump = playerJump;
idle = player;
walk = playerWalk;
run = playerRun;
attack = playerAttack;

face = 1;

moveDirection = 0;
moveSpeed = 2;	
x_speed = 0;
y_speed = 0;

grav = .3;
termVal = 5;
jumpMax = 2;
jumpCount = 0;


jumpHoldTimer = 0;
jump_speed[0] = -3;
jumpHoldFrames[0] = 15;
jump_speed[1] = -2;
jumpHoldFrames[1] = 15;
onGround = true; 
