// geting inputs 
getControls();
// x move / direction 
moveDirection = rightKey - leftKey;

// get face/looking direction 

if moveDirection != 0 { face = moveDirection; };


//get x speed
x_speed = moveDirection * moveSpeed;

//x collision 

	var _subPixel = .5;
	if place_meeting(x + x_speed, y, oGround)
	{
		//moving up to the wall 
		var _pixelCheck = _subPixel * sign(x_speed);
		while !place_meeting(x + _pixelCheck, y, oGround)
		{
			x += _pixelCheck;
		}
		
		x_speed = 0;
	 
	}
	
	//moving 
	x += x_speed;
	
	//y move
	
	y_speed += grav;
	
	if y_speed > termVal {y_speed = termVal;};
	
	//reset jump var
	if onGround
	{
		jumpCount = 0;
		jumpHoldTimer = 0;
	}
	
	//jump
	if jumpKeyBuffered && jumpCount < jumpMax
	{
		//reset the buffer
		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		//jump twice
		jumpCount++;
		
		//set jump hold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount -1];	
	}
	// tap jumping /hold
	if !jumpKey
	{
		jumpHoldTimer = 0;
	}
	//hold jump
	if jumpHoldTimer > 0
		{
			
		//const set the y speed to jumping speed 
		y_speed = jump_speed[jumpCount -1];
		
		//count down timer
		jumpHoldTimer--;
		}
	
	// y moveing 
	if place_meeting(x , y + y_speed, oGround)
	{
		//moving up to the wall 
		var _pixelCheck = _subPixel * sign(y_speed);
		while !place_meeting(x, y + _pixelCheck, oGround)
		{
			y+= _pixelCheck;
		}
		
		//when head hits cleling
		if y_speed < 0
		{
			jumpHoldTimer = 0; 
		}
		
		y_speed = 0;
	
	}
	
	if y_speed >= 0 && place_meeting(x, y+1, oGround)
	{
		onGround = true;
	}
	else
	{
		onGround = false;
	}
	
	//moving 
	y += y_speed;


	// capping fall speed
	if y_speed > termVal {y_speed = termVal;};
	
	//attack

	
// sprite control

	//walking
	if abs(x_speed) > 0 {set_state_sprite(run,0)};
	//not moving
	if (x_speed) == 0 {set_state_sprite(idle,0)};
	//jumping
	if !onGround {set_state_sprite(jump,0)};
	//falling
	if (y_speed) > 3 {set_state_sprite(falling,0)};
	//set collegion
	mask_index = idle;
	
	if attackKey {set_state_sprite(attack,0)};



