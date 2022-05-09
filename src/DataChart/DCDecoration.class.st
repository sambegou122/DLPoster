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

{ #category : #accessing }
DCDecoration >> x [
	^ x
]

{ #category : #accessing }
DCDecoration >> y [
	^ y
]
