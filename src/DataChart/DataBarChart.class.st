Class {
	#name : #DataBarChart,
	#superclass : #DataChart,
	#category : #'DataChart-Kind'
}

{ #category : #accessing }
DataBarChart class >> kind [
	^ 'bar'
]

{ #category : #showing }
DataBarChart >> yourPlot [
	^ RSBarPlot new.
]
