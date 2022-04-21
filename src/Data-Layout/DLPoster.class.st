Class {
	#name : #DLPoster,
	#superclass : #Object,
	#instVars : [
		'data',
		'shape',
		'layout',
		'event',
		'linebuilder'
	],
	#category : #'Data-layout'
}

{ #category : #accessing }
DLPoster >> data [
^data
]

{ #category : #accessing }
DLPoster >> data: aData [
	data:=aData
]

{ #category : #accessing }
DLPoster >> event [
^event
]

{ #category : #accessing }
DLPoster >> event: anEvent [
	event := anEvent.
]

{ #category : #accessing }
DLPoster >> layout [
^layout 
]

{ #category : #accessing }
DLPoster >> layout: aLayout [
	layout := aLayout 
]

{ #category : #accessing }
DLPoster >> lineBuilder [
^linebuilder
]

{ #category : #accessing }
DLPoster >> lineBuilder: aLineBuilder [
	linebuilder:=aLineBuilder
]

{ #category : #accessing }
DLPoster >> shape [
^shape
]

{ #category : #accessing }
DLPoster >> shape: aShape [
	shape := aShape
]
