Class {
	#name : #DataBarChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #adding }
DataBarChart >> addData: aDictionnary [
	| x y |
	self data: aDictionnary.
	y := self data at: 2 ifAbsent:[ self data at: 1 ].
	x := self data at: 1.
	x = y ifTrue: [ self chart addPlot: (RSBarPlot new y:x) ] 
			ifFalse:[ self chart addPlot: (RSBarPlot new x: x y:y) ] 
]
