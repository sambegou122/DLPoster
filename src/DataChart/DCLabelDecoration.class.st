Class {
	#name : #DCLabelDecoration,
	#superclass : #DCDecoration,
	#instVars : [
		'label',
		'posi'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #accessing }
DCLabelDecoration >> changeYourPosition: aDCPlot [

	| position xchart plot dif |
	xchart := aDCPlot chart extent x.
	label := self shape copy.
	plot := self chart plots first.
	position := (plot xScale scale: self x) + label extent x.
	dif := position - xchart.
	position > xchart ifTrue: [ posi := dif @ label extent y.].
	
	
]

{ #category : #accessing }
DCLabelDecoration >> createdShapes [
	^ { label }
]

{ #category : #initialization }
DCLabelDecoration >> defaultShape [ 
	^ RSLabel new color: 'blue'.
]

{ #category : #rendering }
DCLabelDecoration >> renderIn: canvas [
	
	| plot padding point |
	label := self shape copy.	
	plot := self chart plots first.
	self x ifNil: [ self error: ' yous need put a x abxis' ].
	self y ifNil: [ self error: ' yous need put a y abxis' ].
	padding := self chart padding.
	point := plot scalePoint: x @ y.
	posi ifNil: [ posi := point + ( label extent /2)].
	label position: posi.
	canvas add: label.
	
]

{ #category : #accessing }
DCLabelDecoration >> text [
	^ self shape text.
]

{ #category : #accessing }
DCLabelDecoration >> text: aString [ 
	self shape text: aString.
]
