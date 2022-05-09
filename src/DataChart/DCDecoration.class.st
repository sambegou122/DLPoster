Class {
	#name : #DCDecoration,
	#superclass : #RSAbstractChartDecoration,
	#instVars : [
		'x',
		'y'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #adding }
DCDecoration >> addIn: aDCCombinePlot [ 
	aDCCombinePlot addDecoration: self
]

{ #category : #accessing }
DCDecoration >> x [
	^ x
]

{ #category : #accessing }
DCDecoration >> y [
	^ y
]
