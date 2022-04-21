"
A DLPosterTest is a test class for testing the behavior of DLPoster
"
Class {
	#name : #DLPosterTest,
	#superclass : #TestCase,
	#category : #'Data-Layout-Tests-Data-layout'
}

{ #category : #tests }
DLPosterTest >> testBasic [
	| data shape |
	data := DLPoster new.
	shape := RSBox new.
	data shape: shape.
	self assert: data shape equals: shape
]
