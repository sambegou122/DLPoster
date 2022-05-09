Class {
	#name : #DCVerticalLineDecoration,
	#superclass : #DCDecoration,
	#instVars : [
		'line'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #accessing }
DCVerticalLineDecoration >> createdShapes [
	^ { line }
]

{ #category : #initialization }
DCVerticalLineDecoration >> defaultShape [ 
	^ RSLine new color: 'red'
]

{ #category : #rendering }
DCVerticalLineDecoration >> renderIn: canvas [
	| p1 p2 plot padding point |
	line := self shape copy.
	plot := self chart plots first.
	padding := self chart padding.
	point := plot scalePoint: x @ 0.
	p1 := point x @ 0.
	p2 := point x @ self chart extent y negated.
	line
		startPoint: p1;
		endPoint: p2.
	canvas add: line
]

{ #category : #accessing }
DCVerticalLineDecoration >> x: anInteger [ 
	| xPoint yPoint point |
	point := anInteger *3.
	xPoint := point@0.
	yPoint := point@(-200).
	self shape 
				startPoint: yPoint;
				endPoint: xPoint .
				
]
