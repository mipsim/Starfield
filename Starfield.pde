Particle [] particles = new Particle[1500];
int x = 400;
int y = 400;


///////////////////////////////////////////////////


void setup()
{
	size(800,800);
	noStroke();
	for (int i = 0; i < particles.length; i++)
	{
		if( i < 1000)
		{
			particles[i] = new NormalParticle();	
		}	
		else if (i < 1490) 
		{
			particles[i] = new OddballParticle();
		}
		else
		{
			particles[i] = new JumboParticle();	
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
		myAngle = (int)(Math.random()*180+1);
		mySpeed = (Math.random()*10+1);
	}

	public void move()
	{
		//	if ( limit < 0 && limit > -100 )
		//{
		//	limit = limit - 1;
		//	myX = myX - Math.cos(myAngle)*mySpeed;
		//	myY = myY - Math.sin(myAngle)*mySpeed;
		//}
		//else if (limit < -100 )
		//{
		//	limit = 0;		
		//}

		if ( limit > -1 && limit < 100 )
		{
			limit = limit + 1;
			myX = myX + Math.cos(myAngle)*mySpeed;
			myY = myY + Math.sin(myAngle)*mySpeed;
		}
		else 
		{
			myX = myX - Math.cos(myAngle)*mySpeed;
			myY = myY - Math.sin(myAngle)*mySpeed;
		}

	
	}

	public void show()
	{
		fill(myColor,myColor2,myColor3);
		ellipse((float)myX, (float)myY, 8, 8);
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
		rect((float)myX, (float)myY, 9, 9);
	}
}


///////////////////////////////////////////////////


class JumboParticle extends NormalParticle
{
	void show()
	{
		{
		fill(myColor,myColor2,myColor3);
		ellipse((float)myX, (float)myY, 30, 30);
		}
	}
}

