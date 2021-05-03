//VAR TIEMPO
int second = second();  // Values from 0 - 59
int minute = minute();  // Values from 0 - 59
int hour = hour();    // Values from 0 - 23
int day = day();    // Values from 1 - 31
int month = month();  // Values from 1 - 12
int year = year();   // 2003, 2004, 2005, etc.

String timestamp = str(year)+str(month)+str(day)+str(hour)+str(minute)+str(second);
StringList imprimir;

//VARIABLE DE CANTIDAD DE PUNTOS
int nPoints = 18000; //18000
int desplexteriorX = 20;
int desplexteriorY = 20;
int dspl = 0;

//VARIABLES DEL COLOR
Colorido colorcito = new Colorido(0,0,0);
float l = 94; //94
float s = -128; //-128
float b = 0; //0
float step = 0.05; //0.05
color clr;

void setup() {
	step = (900.0/nPoints);
	size(1024,1024);
	int ancho = width/2;
	// float desplazamiento = width/0.2048;
	// fullScreen();
	background(#011C40);
	strokeWeight(.01);
	// stroke(#EF5F56, 50);
	noFill();


	float cx = ancho;
	float cy = height*.75;
	float curva = 0.01;

	float cdx = ancho;

	float cxb = ancho;
	float cyb = height*.75;
	float cybaltura = height*.20;

	// int r = width/2;

	float theta = (PI*1.01)/nPoints;
	float seta = (PI)/nPoints;
	float peta = (-PI)/nPoints;
	float tetha = (2*PI)/nPoints;

	imprimir = new StringList();
	imprimir.append(year+"/"+month+"/"+day+" - "+hour+":"+minute+":"+second);
	imprimir.append("Dimensiones: ("+width+","+height+")");
	imprimir.append("");
	imprimir.append("Puntos&Líneas: "+nPoints);
	imprimir.append("Punto central: ("+cx+","+cy+")");
	imprimir.append("Curva: "+curva);
	imprimir.append("Centro plumon: ("+cxb+","+cyb+")");
	imprimir.append("Desplazamiento X: "+desplexteriorX);
	imprimir.append("Desplazamiento Y: "+desplexteriorY);
	imprimir.append("Ángulo: "+theta);
	imprimir.append("");
	imprimir.append("Paso: "+step);
	imprimir.append("LSB: ("+l+","+s+","+b+") inicial");

	// text(year+"/"+month+"/"+day+" - "+hour+":"+minute+":"+second, 10, height-180);

	// text("Dimensiones: ("+width+","+height+")", 10, height-160);
	// text("Punto central: ("+cx+","+cy+")", 10, height-140);
	// text("Puntos&Líneas: "+nPoints, 10, height-120);
	// text("Desplazamiento: "+desplazamiento, 10, height-100);
	// text("Ángulo: "+theta, 10, height-80);

	// text("Paso: "+step, 10, height-40);
	// text("LSB: ("+l+","+s+","+b+") inicial", 10, height-20);

	// BLANCO IZQUIERDA
	pushMatrix();
	translate(cxb, cyb);
	rotate(PI);

	for (int p=0; p<(nPoints/4); p++) {
		stroke(#ffffff, 50);

		// float xb = (cx - (ancho/512)*cos(i*theta));
		float xb =(ancho/512)*cos(p*peta);
		float yb =(cybaltura/2)*sin(p*peta);

		float xb2 =xb + (ancho/2)*cos(p*peta);
		float yb2 =yb + 20 + (cybaltura/2)*sin(p*peta);

		float xbxtr = xb + (ancho/12)*cos (p*peta);
		float ybxtr = yb + (cybaltura/2)*sin (p*peta);

		float xbxtr2 = xb + (ancho/12)*cos (p*peta);
		float ybxtr2 = yb + (cybaltura/2)*sin (p*peta);

		bezier(xb,yb,xb2,yb2,xbxtr2,ybxtr2,xbxtr,ybxtr);


	}

	popMatrix();

	// BLANCO DERECHA
	pushMatrix();
	translate(cxb, cyb);

	for (int k=0; k<(nPoints/4); k++) {
		stroke(#ffffff, 50);

		// float xb = (cx - (ancho/512)*cos(i*theta));
		float xb =(ancho/512)*cos(k*seta);
		float yb =(cybaltura/2)*sin(k*seta);

		float xb2 = xb + (ancho/2)*cos(k*seta);
		float yb2 = yb + 50 + (cybaltura/2)*sin(k*seta);

		float xbxtr = xb + (ancho/12)*cos (k*seta);
		float ybxtr = yb + (cybaltura/2)*sin (k*seta);

		float xbxtr2 = xb + (ancho/12)*cos (k*seta);
		float ybxtr2 = yb + (cybaltura/2)*sin (k*seta);

		bezier(xb,yb,xb2,yb2,xbxtr2,ybxtr2,xbxtr,ybxtr);


	}

	popMatrix();

	// COLORES
	for (int i =0; i<nPoints; i++) {
		b = map(i,0,height,-128,127); //OJO VIGILAR ESTE DATO
		clr = colorcito.lab2rgb(l,s,b);

		// stroke(#EF5F56, 50);
		float x = (cx - (ancho/512)*cos(i*theta));
		float y = (cy - (cy/2)*sin(i*theta));

		float x2 = (cx - (ancho/512)*cos(i*theta));
		float y2 = (cy + 10 - (cy/2)*sin(i*theta));


		// stroke(#F84DD1, 50);
		float xxtr = x - (ancho/4)*cos (i*theta);
		float yxtr = y - (cy/2)*sin (i*theta);


		if (i<(nPoints/2)) {
			dspl = desplexteriorX * -1;
			cx = cx+curva;
		} else {
			dspl = desplexteriorX;
			cx = cx-curva;
		}

		float xxtr2 = x - (ancho/4)*cos (i*theta)+desplexteriorX;
		float yxtr2 = y - (cy/2)*sin (i*theta)+desplexteriorY;


		stroke(clr, 50);

		// bezier(x,y,1/x,1/y,xxtr*10,yxtr*10,xxtr,yxtr);
		bezier(x,y,x2,y2,xxtr2,yxtr2,xxtr,yxtr);

		s = s + (step);

	};


	// // VAINA
	// for (int t=0; t<nPoints; t++) {
	// 	stroke(#ffffff, 50);

	// 	float x = cdx - cos(t*tetha);
	// 	float y = cy - (cybaltura/2)*sin(t*tetha);

	// 	float x2 = cdx - cos(t*tetha);
	// 	float y2 = cy + 10 - (cybaltura/2)*sin(t*tetha);

	// 	float xxtr = cdx - cos (t*tetha);
	// 	float yxtr = y - (cybaltura/1.2)*sin (t*tetha);

	// 	if (t<(nPoints/2)) {
	// 		dspl = desplexteriorX * -1;
	// 		cdx = cdx+curva;
	// 	} else {
	// 		dspl = desplexteriorX;
	// 		cdx = cdx-curva;
	// 	}

	// 	float xxtr2 = cdx - cos (t*tetha)+desplexteriorX;
	// 	float yxtr2 = y - (cybaltura/1.2)*sin (t*tetha)+desplexteriorY;

	// 	bezier(x,y,x2,y2,xxtr2,yxtr2,xxtr,yxtr);

	// };


	//CURVA
	beginShape(LINES);
	for (int t=0; t<nPoints; t++) {
		stroke(#ffffff, 100);

		float x = cdx - cos(t*tetha);
		float y = cy - (cybaltura*1.5)*sin(t*tetha);

		vertex(x, y);

		if (t<(nPoints/4)) {
			cdx = cdx+curva;
		} else if (t>(nPoints/4) && t<(nPoints*3/4)){
			cdx = cdx-curva;
		} else {
			cdx = cdx+curva;
		}
	};
	endShape();





	imprimir.append("LSB: ("+l+","+s+","+b+") final");
	// text("LSB: ("+l+","+s+","+b+") final", 10, height);

	imprimir.reverse();

	// for (String string : imprimir) {
	for (int j=0; j<imprimir.size(); j++) {
		text(imprimir.get(j),10,height-20*j);
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
