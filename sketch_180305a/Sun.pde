class Sun
{
    float x, y, z, r;
    color c;
  
    Sun(float x, float y, float z, float r, color c)
    {
        this.x = x;
        this.y = y;
        this.z = z;
        this.r = r;
        this.c = c;
    }
    
    void draw()
    {
        translate(x, y, z);
        fill(c);
        sphere(r);
    }
}