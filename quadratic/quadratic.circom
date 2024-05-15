pragma circom 2.1.8;

template Multiplier2 () {
   signal input a;  
   signal input b;  
   signal output out;
   out <== a * b;  
}

template SolveQuadraticExpression() {
    // a * x ^ 2 + b * x + c == 0
    signal input x;
    signal input coeffs[3]; // [a, b, c]

    component x2 = Multiplier2();
    x2.a <== x;
    x2.b <== x;
    component ax2 = Multiplier2();
    ax2.a <== coeffs[0];
    ax2.b <== x2.out;
    component bx = Multiplier2();
    bx.a <== coeffs[1];
    bx.b <== x;

    var result = ax2.out + bx.out + coeffs[2];
    result === 0;
}

component main {public [coeffs]} = SolveQuadraticExpression();