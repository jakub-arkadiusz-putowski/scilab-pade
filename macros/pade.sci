function [G_pade] = pade(delay, order)
    // usage:
    // G_pade = pade(delay, order)
    //
    //desc:
    //returns n-th order Pade approximation of a continuous
    //time delay exp(-delay * s) in transfer function form
    //
    //params:
    //delay has to be non negative scalar representing time delay(L or T)
    //order has to be non negative integer representing the approximation order (n)
    
    if delay < 0 | order < 0 then
        error("pade err: both delay and order hast o be non negative");
    end
    
    s = poly(0,'s');
    num_poly = 0;
    den_poly = 0;
    
    //pade table formula:
    //c(k)= ((2n-k)! * n!)/((2n)! * k! * (n-k)!) * delay^k
    for k = 0:order
        //coeff value for current power of s
        coeff = (factorial(2*order-k) * factorial(order))/( factorial(2*order) * factorial(k) * factorial(order-k)) * (delay^k);
        
        //denominator
        den_poly = den_poly + coeff * (s^k);
        
        //numerator
        num_poly = num_poly + ((-1)^k) * coeff * (s^k);
    end
    
    G_pade = syslin('c',num_poly, den_poly);
    
endfunction
