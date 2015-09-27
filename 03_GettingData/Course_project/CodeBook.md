# run_analysis.R aim
The aim of run_analysis.R is read, merge, and calculate means for particular metrics of dataset
Raw data can be found in "figures/" folder, it broken down by test and train datasets.


#  features
The features selected for this database come from the accelerometer (**\_accelerometer\_**) and gyroscope (**\_gyroscope\_**) 3-axial raw signals (XYZ suffix).
These time domain signals (**\_TDS\_**) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (**\_body\_** and **\_gravity\_**) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.


Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (**\_jerk\_**). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (**\_magnitude\_**). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals (**\_FDS\_**)

suffix **\_mean\_** means mean
suffix **\_std\_** means standart deviation


Data set represents average for each metric for each subject and activity type.
Units for accelerometer measurements is m/s^2 (rate of acceleration).
Units for gyroscope measurements are ω/2π (rate of rotation).