Class {
	#name : #DCLabelDecoration,
	#superclass : #DCDecoration,
	#instVars : [
		'label',
		'posi',
		'dot',
		'dotShape'
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

{ #category : #rendering }
DCLabelDecoration >> chartBox [
	^ self chart decorations first box
]

{ #category : #rendering }
DCLabelDecoration >> checkValues [
	| aRSChart |
	aRSChart := self chart.
	x ifNil: [ self error: ' yous need put a x abxis' ].
	y ifNil: [ self error: ' yous need put a y abxis' ].
	(x between: aRSChart minValueX and: aRSChart maxValueX)
		ifFalse: [ self error: 'x is out of the chart' ].
	(y between: aRSChart minValueY and: aRSChart maxValueY)
		ifFalse: [ self error: 'y is out of the chart' ].
]

{ #category : #rendering }
DCLabelDecoration >> checkValues: aRSChart [
	x ifNil: [ self error: ' yous need put a x abxis' ].
	y ifNil: [ self error: ' yous need put a y abxis' ].
	(x between: aRSChart minValueX and: aRSChart maxValueX)
		ifFalse: [ self error: 'x is out of the chart' ].
	(y between: aRSChart minValueY and: aRSChart maxValueY)
		ifFalse: [ self error: 'y is out of the chart' ].
]

{ #category : #rendering }
DCLabelDecoration >> correctPosition [
	| box delta |
	box := self chartBox.
	delta := label encompassingRectangle corner x - box encompassingRectangle corner x.
	label translateBy: delta negated @ 0.
]

{ #category : #accessing }
DCLabelDecoration >> createdShapes [
	^ { dot. label }
]

{ #category : #initialization }
DCLabelDecoration >> defaultShape [ 
	^ RSLabel new color: 'blue'.
]

{ #category : #accessing }
DCLabelDecoration >> dot [
	^ dot
]

{ #category : #accessing }
DCLabelDecoration >> dotShape [
	^ dotShape ifNil: [ dotShape := RSEllipse new
		size: 5;
		yourself
		 ]
]

{ #category : #accessing }
DCLabelDecoration >> label [
	^ label
]

{ #category : #rendering }
DCLabelDecoration >> renderIn: canvas [
	| plot padding point box |
	label := self shape copy.
	plot := self chart plots first.
	self checkValues.
	padding := self chart padding.
	point := plot scalePoint: x @ y.
	dot := self dotShape copy
		color: self shape color;
		position: point;
		yourself.
	canvas add: dot.
	posi ifNil: [ posi := point + ( label extent /2) ].
	label position: posi.
	box := self chart decorations first box.
	(box encompassingRectangle containsRect: label encompassingRectangle)
		ifFalse: [ self correctPosition ].
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
