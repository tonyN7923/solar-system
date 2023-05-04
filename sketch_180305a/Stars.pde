class Stars
{
    float x, y, z, r;
    color c;
  
    Stars(float x, float y, float z, float r, color c)
    {
        this.x = x;
        this.y = y;
        this.z = z;
        this.r = r;
        this.c = c;
    }
    
    void draw()
    {
        pushMatrix();
        translate(x, y, z);
        fill(c);
        sphere(r);
        popMatrix();
    }
}