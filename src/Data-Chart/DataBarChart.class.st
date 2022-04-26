Class {
	#name : #DataBarChart,
	#superclass : #DataChart,
	#category : #'Data-Chart-Kind'
}

{ #category : #showing }
DataBarChart >> yourPlot [
	^ RSBarPlot new.
]
