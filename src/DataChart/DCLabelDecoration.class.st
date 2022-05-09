Class {
	#name : #DCLabelDecoration,
	#superclass : #DCDecoration,
	#category : #'DataChart-Decoration'
}

{ #category : #accessing }
DCLabelDecoration >> addIn: aDCObjet [
	 aDCObjet addLabel: self.
]

{ #category : #initialization }
DCLabelDecoration >> defaulShape [ 
	^ RSLabel new. 
	
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
