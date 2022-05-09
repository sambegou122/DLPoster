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
DCDecoration >> x: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
DCDecoration >> y [
	^ y
]
