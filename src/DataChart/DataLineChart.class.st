Class {
	#name : #DataLineChart,
	#superclass : #DataChart,
	#category : #'DataChart-Kind'
}

{ #category : #accessing }
DataLineChart class >> kind [
	^ 'line'
]

{ #category : #adding }
DataLineChart >> yourPlot [
	^ RSLinePlot new. 
]
