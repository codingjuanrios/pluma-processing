//Siguiendo a https://github.com/antimatter15/rgb-lab/blob/master/color.js
//Siguiendo a http://www.brucelindbloom.com/index.html?Eqn_Lab_to_XYZ.html
//Siguiendo a http://www.brucelindbloom.com/index.html?Eqn_XYZ_to_RGB.html

class Colorido {

	float k = 903.3;
	float e = 0.008856;
	float l,a,b;
	float r,g;

	Colorido(float _l, float _a, float _b) {
		l = _l;
		a = _a;
		b = _b;
	}

	color lab2rgb (float l, float a, float b) {
		float y = (l + 16) / 116;
		float x = a / 500 + y;
		float z = y - b / 200;

		if ( pow(x,3) > e ) {
			x = pow(x,3) * 0.95047; //X
		} else {
			x = (116*x - 16)/k * 0.95047;
		}

		if ( l > k*e ) {
			y = pow((l + 16)/116,3) * 1.00000; //Y
		} else {
			y = l/k * 1.00000;
		}

		if ( pow(z,3) > e ) {
			z = pow(z,3) * 1.08883; //Z
		} else {
			z = (116*z - 16)/k * 1.08883;
		}

		r = x *  3.2406 + y * -1.5372 + z * -0.4986;
		g = x * -0.9689 + y *  1.8758 + z *  0.0415;
		b = x *  0.0557 + y * -0.2040 + z *  1.0570;

		if ( r > 0.0031308 ) {
			r = 1.055*pow(r, 1/2.4) - 0.055;
		} else {
			r = 12.92*r;
		}

		if ( g > 0.0031308 ) {
			g = 1.055*pow(g, 1/2.4) - 0.055;
		} else {
			g = 12.92*g;
		}

		if ( b > 0.0031308 ) {
			b = 1.055*pow(b, 1/2.4) - 0.055;
		} else {
			b = 12.92*b;
		}

		r = max(0,min(r,1)) * 255;
		b = max(0,min(b,1)) * 255;
		g = max(0,min(g,1)) * 255;

		return color(r,g,b);
	}
}