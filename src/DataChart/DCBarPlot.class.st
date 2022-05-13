Class {
	#name : #DCBarPlot,
	#superclass : #DCPlot,
	#category : #'DataChart-Core'
}

{ #category : #default }
DCBarPlot >> defaultKind [
	^ RSBarPlot new.
]

{ #category : #accessing }
DCBarPlot >> y: aCollection [
	
	self x ifNil: [ self x: (1 to: aCollection size) ].
	super y: aCollection
	
]
