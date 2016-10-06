Particle [] particles = new Particle[1500];
int x = 375;
int y = 375;


///////////////////////////////////////////////////


void setup()
{
	size(750,750);
	noStroke();
	for (int i = 0; i < particles.length; i++)
	{
		if( i < 400)
		{
			particles[i] = new OddballParticle();	
		}	
		else if (i < 405) 
		{
			particles[i] = new JumboParticle();
		}
		else
		{
			particles[i] = new NormalParticle();	
		}
	}
}

void draw()
{
	background(0);
	for (int i = 0; i < particles.length; i++)
	{
		particles[i].move();
		particles[i].show();		
	}
}


///////////////////////////////////////////////////


interface Particle
{
	public void show();
	public void move();
}


///////////////////////////////////////////////////


class NormalParticle implements Particle
{
	double myX, myY, mySpeed, limit;
	int myAngle, myColor, myColor2, myColor3;
	NormalParticle()
	{
		limit = 0;
		myX = x;
		myY = y;
		myColor = (int)(Math.random()*255);
		myColor2 = (int)(Math.random()*255);
		myColor3 = (int)(Math.random()*255);
		myAngle = (int)(Math.random()*360+1);
		mySpeed = (Math.random()*1+1);
	}

	public void move()
	{
		if (limit == 300)
		{
			limit = -1;
		}
	
		if (limit == -300)
		{
			limit = 0;
		}

		if ( limit > -1 && limit < 300 )
		{
			limit = limit + 1;
			myX = myX + ((Math.random())*(Math.cos(myAngle)*mySpeed))*0.5;
			myY = myY + ((Math.sin(myAngle)*mySpeed))*0.5;
		}

		if ( limit < 0 && limit > -300 )
		{
			limit = limit - 1;
			myX = myX - ((Math.cos(myAngle)*mySpeed))*0.5;
			myY = myY - ((Math.sin(myAngle)*mySpeed))*0.5;
		}
	}

	public void show()
	{
		fill(255);
		ellipse((float)myX, (float)myY, 3, 3);
	}
}


///////////////////////////////////////////////////


class OddballParticle implements Particle
{
	double myX, myY, mySpeed;
	int myAngle, myColor, myColor2, myColor3;
	OddballParticle()
	{
		myX = x;
		myY = y;
		myColor = (int)(Math.random()*255);
		myColor2 = (int)(Math.random()*255);
		myColor3 = (int)(Math.random()*255);
		myAngle = (int)(Math.random()*180+1);
		mySpeed = (Math.random()*10+1);
	}

	public void move()
	{
		myX = myX + (int)(Math.random()*100-50);
		myY = myY + (int)(Math.random()*100-50);
	}

	public void show()
	{
		fill(myColor,myColor2,myColor3);
		rect((float)myX, (float)myY, 5, 5);
	}

	void boundary()
	{
		if (x > 750)
		x = 0;
		else if (y > 750)
		y = 0;
	}
}


///////////////////////////////////////////////////


class JumboParticle extends NormalParticle
{
	void show()
	{
		{
			fill(myColor,myColor2,myColor3);
			ellipse((float)myX, (float)myY, 20, 20);
		}
	}
}

