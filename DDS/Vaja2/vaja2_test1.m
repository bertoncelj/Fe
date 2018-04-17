	
t = [0:.1:2*pi];

sig = sin(t);

partition = [-1:.2:1];

codebook = [-1.2:.2:1];

[index,quants] = quantiz(sig,partition,codebook);

plot(t,sig,'r-',t,quants,'b-',t,quants,'bo');

        axis([-.2 7 -1.2 1.2]);

        legend('Original signal','Quantized signal');