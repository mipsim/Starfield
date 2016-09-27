Particle [] particles = new Particle[300];
int x = 400;
int y = 400;


///////////////////////////////////////////////////


void setup()
{
	size(800,800);
	noStroke();
	for (int i = 0; i < particles.length; i++)
	{
		particles[i] = new NormalParticle();
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
	double myX, myY, myAngle, mySpeed;
	int myColor;
	NormalParticle()
	{
		myX = x;
		myY = y;
		myColor = 255;
		myAngle = (int)(Math.random()*360);
		mySpeed = (int)(Math.random()*360);
	}

	public void move()
	{
		myX = myX + Math.cos(myAngle)*mySpeed;
		myY = myY + Math.sin(myAngle)*mySpeed;
	}

	public void show()
	{
		fill(myColor);
		ellipse((float)myX, (float)myY, 10, 10);
	}
}


///////////////////////////////////////////////////


class OddballParticle implements Particle
{
	double myX, myY, myAngle, mySpeed;
	int myColor;
	OddballParticle()
	{
		myX = x;
		myY = y;
		myColor = 0;
		myAngle = 0;
		mySpeed = 0;
	}

	public void move()
	{
		myX = myX + 1;
		if (myX > 400)
		{
			myX = -5;
		}
	}

	public void show()
	{
		fill(myColor);
		ellipse((float)myX, (float)myY, 10, 10);
	}
}


///////////////////////////////////////////////////


class JumboParticle //uses inheritance
{
	//your code here
}

