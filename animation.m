set(0, 'defaultfigurevisible', 'off');

x = -1:0.01:1;

for t=[0:1000]
  exponent = (t / 100)^2;
  plot(x, x .^ exponent, 'linewidth', 4, 'color', 'm')
  if (t >= 500)
    ticking = (t - 750) / 10;
    legs = [(0.4 - 0.1*sin(ticking)) 0.4 (0.4 + 0.1*sin(ticking + pi/2))];
    hold on
    plot(legs, [-1 0 -1], 'linewidth', 4, 'color', 'm')
    plot(-legs, [-1 0 -1], 'linewidth', 4, 'color', 'm')
    if (mod(floor(t / 100), 2) == 1)
      text(0.5 + rand()*0.2, 0.5 + rand()*0.2, 'WUF', 'fontsize', 36)
    end
    hold off
  end
  axis([-1 1 -1 1])
  xlabel('x')
  ylabel('y')
  title(sprintf('y = x^%.2f', exponent))
  filename = sprintf('output/%04d.png', t);
  print(filename);
end
