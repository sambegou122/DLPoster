"
A DLPosterTest is a test class for testing the behavior of DLPoster
"
Class {
	#name : #DLPosterTest,
	#superclass : #TestCase,
	#category : #'Data-Layout-Tests-Data-layout'
}

{ #category : #tests }
DLPosterTest >> testData [
	| dataLayout data  |
	dataLayout := DLPoster new.
	data := { 12. 20. 30}.
	dataLayout data: data.
	self assert: dataLayout data equals: data
	
]

{ #category : #tests }
DLPosterTest >> testEvent [
	| dataLayout event  |
	dataLayout := DLPoster new.
	event := RSMouseClick new.
	dataLayout event: event.
	self assert: dataLayout event equals: event
]

{ #category : #tests }
DLPosterTest >> testLayout [
	| dataLayout layout |
	dataLayout := DLPoster new.
	layout := RSTreeLayout new.
	dataLayout layout: layout.
	self assert: dataLayout layout equals: layout
]

{ #category : #tests }
DLPosterTest >> testLineBuilder [
	| dataLayout lineBuilder |
	dataLayout := DLPoster new.
	lineBuilder := RSLineBuilder line.
	dataLayout lineBuilder: lineBuilder.
	self assert: dataLayout lineBuilder equals: lineBuilder
]

{ #category : #tests }
DLPosterTest >> testShape [
	| dataLayout shape |
	dataLayout := DLPoster new.
	shape := RSBox new.
	dataLayout shape: shape.
	self assert: dataLayout shape equals: shape
]
