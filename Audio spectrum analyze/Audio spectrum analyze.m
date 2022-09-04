clear;
[y,Fs] = audioread('hw3-1.wav');%換檔名來執行不同聲音檔
y=y(:,1);
time=(1:length(y))/Fs;
subplot(3,1,1);
plot(time, y);
xlabel('time');
ylabel('Amplitude');
title('Wav Signals');

subplot(3,1,2);
spectrogram(y, 1024, 1000, [], Fs, 'yaxis');
title('Spectral View');

N = length(y);
f = fftshift(fft(y));
w = linspace(-Fs/2, Fs/2, N);
subplot(3,1,3);
plot(w,abs(f));
xlabel('Frequency');
ylabel('Magnitude');
title('Frequency Domain');
