RATE = 8000;
FPS = 60;
TIMES = 6;
LENGTH = RATE / FPS / TIMES;
x = linspace(-1, 1, LENGTH);
buffer = [];
next = 501;

for t=[0:1000]
  exponent = (t / 100)^2;
  if (t <= 500)
    once = x .^ exponent;
  else
    if (t == next)
      next = t + ceil(exprnd(50));
      once = rand(1, LENGTH) * 2 - 1;
    else
      points = linspace(0, 2*pi * abs((mod(t, 5) - 2)), LENGTH);
      once = sin(points)*0.2;
    end
  end
  buffer = [buffer repmat(once, 1, TIMES)];
end

wavwrite(buffer, RATE, 'output/audio.wav');
