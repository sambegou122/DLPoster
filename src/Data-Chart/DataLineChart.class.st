Class {
	#name : #DataLineChart,
	#superclass : #DataChart,
	#category : #'Data-Chart-Kind'
}

{ #category : #accessing }
DataLineChart class >> kind [
	^ 'line'
]

{ #category : #adding }
DataLineChart >> yourPlot [
	^ RSLinePlot new. 
]
