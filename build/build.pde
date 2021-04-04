void setup() {
	size(1024,1024);
	// fullScreen();
	background(#556A62);
	strokeWeight(1);
	stroke(#EF5F56, 50);
	noFill();
	// beginRecord(PDF,"C:/users/escri/Pictures/Processing/CollatzConjeture/collatz.pdf");
	// bezier((width/2)-2, height,  80, 0,  width-80, 0, (width/2)+2, height);
	ellipse(width/2, height, 4, height*1.5);
}

void draw() {
	int cx = width/2;
	int cy = height;

	int r = width/2;
	int nPoints = 180;

	float theta = (PI)/nPoints;

	// float x1 = (cx - 512*cos(PI/4));
	// float y1 = (cy - 512*sin(PI/4));

	// circle (x1,y1,11);

	for (int i =0; i<nPoints; i++) {
		stroke(#EF5F56, 50);
		float x = (cx - 25*cos(i*theta));
		float y = (cy - (512+i*2)*sin(i*theta));
		circle(x,y,11);

		stroke(#F84DD1, 50);
		float xxtr = x - 25*cos (i*theta);
		float yxtr = y - (512+i*2)*sin (i*theta);
		circle (xxtr,yxtr,11);

		bezier(x,y,x,y,xxtr,yxtr,xxtr,yxtr);
	};
	
}
