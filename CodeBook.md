## Code Book for the avgActivityData tidy dataset
Below is a description of the variables in the dataset created by the run_analysis.R script.

### Variables
* activity_label - the label of the activity which was carried while recording the data. possible values:
	- standing
	- sitting
	- laying
	- walking
	- walking_upstairs
	- walking_downstairs
* subject_num - an inteteger ranging from 1 to 30, indicating the number of the subject the observation belongs to.
The rest of the variables represent the average mean/std of different features measured/calculated for every subject_num + activity_label combination:
* timeDomainBodySignalAccelerometer-mean-XYZ, timeDomainBodySignalAccelerometer-std-XYZ
* timeDomainGravitySignalAccelerometer-mean-XYZ, timeDomainGravitySignalAccelerometer-std-XYZ
* timeDomainBodySignalAccelerometerJerk-mean-XYZ, timeDomainBodySignalAccelerometerJerk-std-XYZ
* timeDomainBodySignalGyroscope-mean-XYZ, timeDomainBodySignalGyroscope-std-XYZ
* timeDomainBodySignalGyroscopeJerk-mean-XYZ, timeDomainBodySignalGyroscopeJerk-std-XYZ
* timeDomainBodySignalAccelerometerMagnitude-mean, timeDomainBodySignalAccelerometerMagnitude-std
* timeDomainGravitySignalAccelerometerMagnitude-mean, timeDomainGravitySignalAccelerometerMagnitude-std
* timeDomainBodySignalAccelerometerJerkMagnitude-mean, timeDomainBodySignalAccelerometerJerkMagnitude-std
* timeDomainBodySignalGyroscopeMagnitude-mean, timeDomainBodySignalGyroscopeMagnitude-std
* timeDomainBodySignalGyroscopeJerkMagnitude-mean, timeDomainBodySignalGyroscopeJerkMagnitude-std
* frequencyDomainBodySignalAccelerometer-mean-XYZ, frequencyDomainBodySignalAccelerometer-std-XYZ
* frequencyDomainBodySignalAccelerometerJerk-mean-XYZ, frequencyDomainBodySignalAccelerometerJerk-std-XYZ
* frequencyDomainBodySignalGyroscope-mean-XYZ, frequencyDomainBodySignalGyroscope-std-XYZ
* frequencyDomainBodySignalAccelerometerMagnitude-mean, frequencyDomainBodySignalAccelerometerMagnitude-std
* frequencyDomainBodySignalAccelerometerJerkMagnitude-mean, frequencyDomainBodySignalAccelerometerJerkMagnitude-std
* frequencyDomainBodySignalGyroscopeMagnitude-mean, frequencyDomainBodySignalGyroscopeMagnitude-std
* frequencyDomainBodySignalGyroscopeJerkMagnitude-mean, frequencyDomainBodySignalGyroscopeJerkMagnitude-std

### Variables name components
* timeDomain/ frequencyDomain - indicates whether the values were taken before/ after a FFT.
* BodySignal/ GravitySignal - the acceleration signal was separated into body and gravity acceleration signals using a low pass filter.
* Accelerometer/ Gyroscope - indicates whether the measurements come from the accelerometer or gyroscope.
* Jerk - signals obtained from the body linear acceleration and angular velocity derived in time.
* Magnitude
* mean/std
* XYZ - the ending 'XYZ' indicates three seperate columns, used to denote 3-axial signals in the X, Y and Z directions.
