Class {
	#name : #FirstLayout,
	#superclass : #DLPoster,
	#instVars : [
		'canvas',
		'interaction'
	],
	#category : #'Data-layout'
}

{ #category : #'as yet unclassified' }
FirstLayout >> addData:aData [
 self data: aData.
]

{ #category : #'as yet unclassified' }
FirstLayout >> addLayoutToShape [
	self layout on: self shape.
		
		
]

{ #category : #'as yet unclassified' }
FirstLayout >> canvas [
^canvas.
]

{ #category : #'as yet unclassified' }
FirstLayout >> canvas: aCanvas [
	canvas := aCanvas.
		
]

{ #category : #'as yet unclassified' }
FirstLayout >> connectShape [
	| lineBuilder |
	lineBuilder := RSLineBuilder line
		shapes: self shape;
		canvas: self canvas;
		connectFrom: [ :n | n // 2 ].
	self lineBuilder: lineBuilder.
		
]

{ #category : #'as yet unclassified' }
FirstLayout >> createShape [
	| shapes |
	shapes :=  self data collect: [ :i |
		RSBox new
			size: 10;
			model: i;
			withBorder;
			color: Color random translucent.].
		self shape:shapes.
		
		
]

{ #category : #'as yet unclassified' }
FirstLayout >> initialize [ 
	super initialize.
	self canvas: RSCanvas new.
]

{ #category : #'as yet unclassified' }
FirstLayout >> interaction [
^interaction
		
]

{ #category : #'as yet unclassified' }
FirstLayout >> interaction: anInteraction [
	interaction  := anInteraction.
		
]

{ #category : #'as yet unclassified' }
FirstLayout >> show [
	| inter |
	self createShape; connectShape.
	inter := RSHighlightable new.
	inter highlightBorder: (RSBorder new width: 2).
	self interaction: inter.
	self canvas addAll: self shape.
	self canvas nodes @ self interaction.
	self layout on: self shape.
	self canvas zoomToFit.
	^ self canvas
]
