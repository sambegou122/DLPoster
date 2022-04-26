Class {
	#name : #DataLineChart,
	#superclass : #DataChart,
	#category : #'Data-Chart-Kind'
}

{ #category : #adding }
DataLineChart >> yourPlot [
	^ RSLinePlot new. 
]
