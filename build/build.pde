//VAR TIEMPO
int second = second();  // Values from 0 - 59
int minute = minute();  // Values from 0 - 59
int hour = hour();    // Values from 0 - 23
int day = day();    // Values from 1 - 31
int month = month();  // Values from 1 - 12
int year = year();   // 2003, 2004, 2005, etc.

String timestamp = str(year)+str(month)+str(day)+str(hour)+str(minute)+str(second);

//VARIABLE DE CANTIDAD DE PUNTOS
int nPoints = 1800;
int desplazamiento = 10;
int dspl = 0;

//VARIABLES DEL COLOR
Colorido colorcito = new Colorido(0,0,0);
float l = 94; //94
float s = -128; //-128
float b = 0; //0
float step = 0.05;
color clr;
// int scl = 16;

void setup() {

	println("timestamp: "+timestamp);

	println("step: "+step);
	// step = (256/nPoints);
	size(2048,2048);
	int ancho = width/2;
	// fullScreen();
	background(#011C40);
	strokeWeight(.01);
	// stroke(#EF5F56, 50);
	noFill();
	// beginRecord(PDF,"C:/users/escri/Pictures/Processing/CollatzConjeture/collatz.pdf");
	// bezier((width/2)-2, height,  80, 0,  width-80, 0, (width/2)+2, height);
	// ellipse(width/2, height, 4, height*1.5);


	int cx = ancho;
	int cy = height;

	// int r = width/2;

	float theta = (PI)/nPoints;

	for (int i =0; i<nPoints; i++) {
		b = map(i,0,height,-128,127);
		clr = colorcito.lab2rgb(l,s,b);

		// stroke(#EF5F56, 50);
		float x = (cx - (ancho/512)*cos(i*theta));
		float y = (cy - (height/2)*sin(i*theta));

		float x2 = (cx - (ancho/512)*cos(i*theta));
		float y2 = (cy +10 - (height/2)*sin(i*theta));


		// stroke(#F84DD1, 50);
		float xxtr = x - (ancho/4)*cos (i*theta);
		float yxtr = y - (height/2)*sin (i*theta);


		if (i<(nPoints/2)) {
			dspl = desplazamiento * -1;
		} else {
			dspl = desplazamiento;
		}
		println("dspl: "+dspl);

		float xxtr2 = x - (ancho/4)*cos (i*theta)+200;
		float yxtr2 = y + dspl - (height/2)*sin (i*theta)+200;


		stroke(clr, 50);

		// bezier(x,y,1/x,1/y,xxtr*10,yxtr*10,xxtr,yxtr);
		bezier(x,y,x2,y2,xxtr2,yxtr2,xxtr,yxtr);

		s = s + (step);

	};

	saveFrame("C:/users/escri/Pictures/Processing/Pluma/screenshot/pluma"+timestamp+".tif");
}

void draw() {
	// int cx = width/2;
	// int cy = height;

	// int r = width/2;
	// int nPoints = 180;

	// float theta = (PI)/nPoints;

	// // float x1 = (cx - 512*cos(PI/4));
	// // float y1 = (cy - 512*sin(PI/4));

	// // circle (x1,y1,11);

	// for (int i =0; i<nPoints; i++) {
	// 	stroke(#EF5F56, 50);
	// 	float x = (cx - 25*cos(i*theta));
	// 	float y = (cy - (512+i*2)*sin(i*theta));
	// 	circle(x,y,11);

	// 	stroke(#F84DD1, 50);
	// 	float xxtr = x - 25*cos (i*theta);
	// 	float yxtr = y - (512+i*2)*sin (i*theta);
	// 	circle (xxtr,yxtr,11);

	// 	bezier(x,y,x,y,xxtr,yxtr,xxtr,yxtr);
	// };
	
}
