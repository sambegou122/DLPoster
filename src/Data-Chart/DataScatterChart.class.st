Class {
	#name : #DataScatterChart,
	#superclass : #DataChart,
	#category : #'Data-Chart-Kind'
}

{ #category : #accessing }
DataScatterChart class >> kind [
	^ 'scatter'
]

{ #category : #adding }
DataScatterChart >> yourPlot [

	^ RSScatterPlot new.
]
