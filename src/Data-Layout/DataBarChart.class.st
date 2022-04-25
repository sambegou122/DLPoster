Class {
	#name : #DataBarChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #adding }
DataBarChart >> yourPlot [
	^ RSBarPlot new.
]
