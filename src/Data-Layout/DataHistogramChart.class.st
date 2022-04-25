Class {
	#name : #DataHistogramChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #adding }
DataHistogramChart >> yourPlot [
	^ RSHistogramPlot new.
]
