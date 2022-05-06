Class {
	#name : #DCDecoration,
	#superclass : #Object,
	#instVars : [
		'shape',
		'x',
		'y'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #adding }
DCDecoration >> addIn: aDCCombinePlot [ 
	aDCCombinePlot addDecoration: self
]

{ #category : #initialization }
DCDecoration >> defaulShape [
 self subclassResponsibility
]

{ #category : #initialization }
DCDecoration >> initialize [ 
	super initialize.
	shape := self defaulShape
]

{ #category : #accessing }
DCDecoration >> shape [
	^ shape
]
