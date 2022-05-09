Class {
	#name : #DCLabelDecoration,
	#superclass : #DCDecoration,
	#instVars : [
		'label'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #accessing }
DCLabelDecoration >> createdShapes [
	^ { label }
]

{ #category : #initialization }
DCLabelDecoration >> defaultShape [ 
	^ RSLabel new
]

{ #category : #rendering }
DCLabelDecoration >> renderIn: canvas [
	label := self shape copy.
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

{ #category : #accessing }
DCLabelDecoration >> x: anInteger [ 
	x := anInteger.
]

{ #category : #accessing }
DCLabelDecoration >> y: anInteger [
	y:= anInteger.
]
