x = linspace(-10,10,20);
y1 = x .^2;
y2 = x.^3;
y3 = sin(x);

tiledlayout("flow")

nexttile
plot(x,y1);

nexttile
plot(x,y2);

nexttile
plot(x,y3);