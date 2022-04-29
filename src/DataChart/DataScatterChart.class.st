Class {
	#name : #DataScatterChart,
	#superclass : #DataChart,
	#category : #'DataChart-Kind'
}

{ #category : #accessing }
DataScatterChart class >> kind [
	^ 'scatter'
]

{ #category : #adding }
DataScatterChart >> beforeShowing [

]

{ #category : #adding }
DataScatterChart >> yourPlot [

	^ RSScatterPlot new.
]
