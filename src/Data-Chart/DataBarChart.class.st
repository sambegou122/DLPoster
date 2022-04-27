Class {
	#name : #DataBarChart,
	#superclass : #DataChart,
	#category : #'Data-Chart-Kind'
}

{ #category : #accessing }
DataBarChart class >> kind [
	^ 'bar'
]

{ #category : #showing }
DataBarChart >> yourPlot [
	^ RSBarPlot new.
]
