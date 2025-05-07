# FM-Transmitter-Circuit
A radio transmitter or just transmitter is an electronic device which produces radio waves with an antenna. The transmitter itself generates a radio frequency alternating current, which is applied to the antenna. When excited by this alternating current, the antenna radiates radio waves. These are necessary component parts of all electronic devices that communicate by radio, such as radio and television broadcasting stations etc. A personal FM transmitter is a low-power FM radio transmitter that broadcasts a signal from a portable audio device (such as an MP3 player) to a standard FM radio. Most of these transmitters plug into the device's headphone jack and then broadcast the signal over an FM broadcast band frequency, so that it can be picked up by any nearby radio. This allows portable audio devices to make use of the louder or better sound quality of a home audio system or car stereo without requiring a wired connection.

**1. Introduction**
   The FM transmitter is a single transistor circuit. In the telecommunication, the frequency modulation (FM) transfers the information by varying the frequency of the carrier wave according to the message signal. Generally, the FM transmitter uses VHF radio frequencies of 87.5 to 108.0 MHz to transmit & receive the FM signal. This transmitter accomplishes the most excellent range with less power. The performance and working of the wireless audio transmitter circuit depend on the induction coil & variable capacitor. Application of Fm Transmitter  The FM transmitters are used in the homes like sound systems in halls to fill the sound with the audio source.  These are also used in cars and fitness centers.  The correctional facilities have used in the FM transmitters to reduce the prison noise in common areas.
   
**2. Need Recognition and Problem definition**
   Our objective to design the FM transmitter circuit that can transmit the audio signal over 1km range. For this circuit the required components are resistor, capacitor, inductor, transistors. All these components are easily available in market. In case of Resistor and capacitor we may not get the actual values, we need. As per the availability of standard value of these components we have to modify in the calculation to get the required output with less error. Advantages of the FM Transmitters  The FM transmitters are easy to use and the price is low  The efficiency of the transmitter is very high  It has a large operating range  This transmitter will reject the noise signal from an amplitude variation.

**3. Function Decomposition**
BLOCK DIAGRAM:

![image](https://github.com/user-attachments/assets/7a2005ef-0144-4984-bc13-083738d3ecf7)

A FM transmitter is a device that uses the principles of frequency modulation to broadcast sound supplied at its input. Typical FM transmitter design is usually following the block diagram above. Let us consider the microphone to understand the sound signals and inside the mic, there is a presence of the capacitive sensor. It produces according to the vibration to the change of air pressure and the AC signal. The signal strength of audio inputs into the transmitter is usually low therefore an amplifier is usually built to bring the signal level up. Based on the desired frequency for transmission (which is usually between the FM frequency band, 88MHz to 108MHz), the carrier frequency is generated using an oscillator circuit and mixed with audio signal to create the modulated signal. The modulated signal is then passed through a power amplifier at the transmission stage to create low impedance which is matched with the antenna. The audio output signal from the microphone is usually small, the first transistor thus performs the job of amplifying that signal to a level good enough for transmission. After amplification as described earlier, the next stage of the FM transmitter is modulation. At this stage the amplified audio signal is then mixed with the carrier frequency at with which the signal is to be transmitted. This carrier frequency can be varied using the 20pF variable capacitor connected with the inductor, and the typical frequency band of this particular design is between the 88MHz to 108MHz and since there is no visual output to recognize the exact frequency at which the transmitter is working, you will need to adjust your FM receiver radio within the range of the frequencies mentioned to get the frequency at which the transmitter is transmitting. After modulating the Audio signal with the carrier frequency, the signal is then sent out through the antenna. The air core inductor is made by winding an 8 to 10 turns of 18 – 22 gauge wire around a ¼ inch former which can be represented by a pencil. The stability of the above circuit could be improved by increasing the number of turns in the antenna.

**4. Concept Generation**
There are different ways to make a FM transmitter circuit:

1) ![image](https://github.com/user-attachments/assets/3c29062e-d45f-4079-bce4-b307b9b93dd8)
2) ![image](https://github.com/user-attachments/assets/9c40b935-6600-47da-afdb-d32f660aa094)
3) ![image](https://github.com/user-attachments/assets/0b8230ec-aa34-4313-9356-ed76b921a2fc)

**5. Concept Selection**
   An FM transmitter circuit is a high frequency wireless device which can transmit voice signals into atmosphere so that it can be received by a corresponding FM receiver circuit for reproducing the voice signals in a loudspeaker.
   We used the 1st concept as it is easier circuit plus it has all the components that are available in the market.
   The air core inductor is made by winding an 8 to 10 turns of 18 – 22 gauge wire around a ¼ inch former which can be represented by a pencil.
   For improved circuit analysis we placed all the component in PCB board and soldered it. The stability of the above circuit could be improved by increasing the number of turns in the antenna.
   
**6. Analysis**
   As FM transmitter wireless device, it requires precision attached to every component so that the audio signal at the output must be clear and loud without any distortion. Soldering of the components must be in proper manner. If any component is not properly joined to the PCB the output of the circuit leads to transmit of audio signal to other frequency. The stability of the above circuit could be improved by increasing the number of turns in the antenna. This enhances the response of the circuits due to a couple of reasons. The antenna gets aloof from the collector of the transistor allowing it to function freely without unnecessary loading, and the slipping of the antenna to the top further allows the relevant side of the coil to get a higher stepped-up voltage induced across itself and the coil generating a higher concentration of transmission power on the antenna. The inductor must be done properly using the copper wire.
   The sent signals can be received over any standard FM radio, tuned accurately to the respective frequency. We started at 80MHz then we tuned FM radio by 0.1 MHz calibrated after that we got to catch the signal at 94.3 MHZ.
   
**7. Testing and Improvement**
   For improving the quality of signal, we adjusted the variable capacitor then and added more turns to the antenna so we got improved and clear audio signal at the FM radio.

MATLAB Code:
      clc;clear all ;close all;
      fc = 10; %carrier frequency
      fm = 1; %message freuqency
      B = 35; %modulation index
      k =0; %used for drawing
      tp = 0:0.005:500; %time
      delay = 0.05; %delay when plotting
      carrier = cos(2*pi*fc*tp); %the carrier
      %% Message
      syms ti;
      M = cos(2*pi*fm*ti); %generic message
      Mi = int(M,ti); % integrated message
      ti = tp; % to substitute
      Mii = eval(Mi); %substitute
      M = eval(M);% message but as array to plot
      FM = cos(2*pi*fc*tp+B.*Mii); % the Fm transmitted message
      FM_noise = awgn(FM,20); %adding additive white gaussian noise
      %% Plotting
      myfigure1 = figure('name','FM transmitter');
      while (1)
      if ~ishghandle(myfigure1)
          break
      end
      subplot(4,1,1)
      plot(tp,M)
      title('Original Signal')
      xlabel('time')
      ylabel('Amplitude')
      xlim([0+k 10+k])
      subplot(4,1,2)
      plot(tp,carrier)
      xlim([0+k 10+k])
      title('Carrier')
      xlabel('time')
      ylabel('Amplitude')
      subplot(4,1,3)
      plot(tp,FM)
      xlim([0+k 10+k])
      xlabel('time')
      ylabel('Amplitude')
      title('FM transmitted signal')
      subplot(4,1,4)
      plot(tp,FM_noise)
      xlim([0+k 10+k])
      ylim([-1 1])
      xlabel('time')
      ylabel('Amplitude')
      title('FM transmitted with noise')
      k = k+1.33;
      drawnow;
      pause(delay) %delay
      end
      
OUTPUT:

![image](https://github.com/user-attachments/assets/64bd2a80-cca4-424e-ab62-1e5f47c26769)

It is continuous. Above picture is just a part of one-time frame.

MULTISIM:

![image](https://github.com/user-attachments/assets/42d9f4b7-e962-4b11-9fa7-81a4b03eb90b)
![image](https://github.com/user-attachments/assets/f5ef8d67-4479-4eb6-bbfd-623c4f91392e)

HARDWARE :

![image](https://github.com/user-attachments/assets/564d9bf6-da99-4f2e-a4cb-2b75f93b3d93)
![image](https://github.com/user-attachments/assets/1d8fa28c-ec70-4436-b11d-64b0ed92f70d)

FM TRANSMITTER CIRCUIT

![image](https://github.com/user-attachments/assets/d9099f03-5fd7-48fc-9353-e730c491121b)

THIS IS THE FREQUENCY AT WHICH WE RECEIVING THE TRANSMITTED SIGNAL

**8. Discussions and Conclusion**
   The objective of the experiment is fulfilled we designed the circuit the according the aim of the experiment and we are concluding that at 94.3MHz we are getting the transmitted signal. While doing this we learned different new concepts like Rf amplifier, about the antenna what its concept and why is used for and most importantly we learned about FM transmitter what its applications, advantages and disadvantages. We learned that it has large operating range, these are easy to use. FM transmitter and receiver tend to be more complex. Due to some interference, there is poor quality in the received signals.
   
**9. References**
https://www.elprocus.com/making-of-fm-transmitter-circuit-working-application/
https://circuitdigest.com/electronic-circuits/how-to-build-fm-transmitter-circuit
http://electronics-diy.com/electronic_schematic.php?id=1034
https://www.homemade-circuits.com/spy-bug-circuits/
