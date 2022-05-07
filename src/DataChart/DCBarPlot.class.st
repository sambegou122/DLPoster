Class {
	#name : #DCBarPlot,
	#superclass : #DCPlot,
	#category : #'DataChart-Core'
}

{ #category : #default }
DCBarPlot >> defaultKind [
	^ RSBarPlot new.
]
