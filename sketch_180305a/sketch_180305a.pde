//AET 310 Creative Coding Spring 2018
//Tony Nguyen
//Challenge 6

Sun sun;
Planet mercury, venus, earth, mars, jupiter;
Moon moon;
int numAsteroids = 100;
Asteroid asteroidBelt[] = new Asteroid[numAsteroids];
int numStars = 200;
Stars stars[] = new Stars[numStars];

float pxPerKm = 500.0 / 695700.0; //based off sun radius
float camX, camY, camZ, centerX, centerY, centerZ;
boolean zoomKey, overHeadKey;

void setup()
{
    fullScreen(P3D);
    noStroke();
    perspective(PI/3, (float)width/height, 1, 100000);
    zoomKey = false;
    overHeadKey = false;
    
    sun = new Sun(0, 0, 0, 695700 * pxPerKm, color(255, 255, 255));
    mercury = new Planet(600, 0, 0, 2440 * pxPerKm, 0, 1.3E-2, color(226, 226, 226));
    venus = new Planet(700, 0, 0, 6052 * pxPerKm, 0, 5.2E-3, color(193, 143, 23));
    earth = new Planet(800, 0, 0, 6371 * pxPerKm, 0, 3.2E-3, color(79, 76, 176));
    moon = new Moon(20, 0, 0, 1737 * pxPerKm, 0, 4.2E-2, color(254, 252, 215));
    mars = new Planet(1000, 0, 0, 3390 * pxPerKm, 0, 1.7E-3, color(193, 68, 14));
    
    for(int n = 0; n < asteroidBelt.length; n++)
    {
        asteroidBelt[n] = new Asteroid(random(1200, 1350), 0, 0, 5000 * pxPerKm, random(0, TWO_PI), 5.2E-3, color(118, 118, 118));
    }
    
    jupiter = new Planet(1500, 0, 0, 69911 * pxPerKm, 0, 2.7E-4, color(216, 202, 157));
    
    for(int s = 0; s < stars.length; s++)
    {
        stars[s] = new Stars(random(-10000, 10000), random(-10000, 10000), random(-10000, 10000), 5, color(255, 255, 255));
    }
}

void draw()
{
    background(0);
    camera(0, -1000, 1200, 0, 0, 0, 0, 1, 0);
        
    if(zoomKey)
    {
        switch(keyCode)
        {
            case 48: //0 - Overview
                camX = 0;
                camY = -1000;
                camZ = 1200;
                centerX = 0;
                centerY = 0;
                centerZ = 0;
                break;
            case 49: //1 - Mercury
                focusPlanet(mercury, 50);
                break;
            case 50: //2 - Venus
                focusPlanet(venus, 50);
                break;
            case 51: //3 - Earth
                focusPlanet(earth, 50);
                break;
            case 52: //4 - Mars
                focusPlanet(mars, 50);
                break;
            case 53: //5 - Jupiter
                focusPlanet(jupiter, 200);
                break;
            default:
                break;
        }
        camera(camX, camY, camZ, centerX, centerY, centerZ, 0, 1, 0);
    }
    
    sun.draw();
    pointLight(255, 255, 255, sun.x, sun.y, sun.z);
    
    mercury.draw();
    venus.draw();
    pushMatrix();
    earth.drawWithMoon();
    moon.draw();
    popMatrix();
    mars.draw();
    jupiter.draw();
                        
    for(Asteroid a : asteroidBelt)
    {
        a.draw();
    }

    for(Stars s : stars)
    {
        s.draw();
    }
}

void focusPlanet(Planet planet, float zOffset)
{
    camX = planet.x * cos(planet.startPos);
    camY = -25;
    camZ = -planet.x * sin(planet.startPos) + zOffset;
    centerX = planet.x * cos(planet.startPos);
    centerY = 0;
    centerZ = -planet.x * sin(planet.startPos);
    checkOverHeadKey();
}

boolean checkOverHeadKey()
{
    if(overHeadKey)
    {
        camY = -1000;
        overHeadKey = (frameCount % 120 == 0) ? false : true;
    }
    return overHeadKey;
}

void keyPressed()
{
    zoomKey = true;
}

void mousePressed()
{
    overHeadKey = true;
    frameCount = 0;
}
