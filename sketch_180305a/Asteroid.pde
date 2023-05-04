class Asteroid
{
    float x, y, z, r, startPos, vel;
    color c;
  
    Asteroid(float x, float y, float z, float r, float startPos, float vel, color c)
    {
        this.x = x;
        this.y = y;
        this.z = z;
        this.r = r;
        this.startPos = startPos;
        this.vel = vel;
        this.c = c;
    }
    
    void draw()
    {
        startPos += vel;
        
        pushMatrix();
        rotateY(startPos);
        translate(x, y, z);
        fill(c);
        sphere(r);
        popMatrix();
    }
}