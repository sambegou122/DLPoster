Class {
	#name : #DCVerticalLineDecoration,
	#superclass : #DCDecoration,
	#category : #'DataChart-Decoration'
}

{ #category : #initialization }
DCVerticalLineDecoration >> defaulShape [ 
	^ RSLine new color: 'red'.
]

{ #category : #initialization }
DCVerticalLineDecoration >> initialize [ 
	super initialize.
	self shape 
				startPoint: 0@0; 
				endPoint: 0@100.
	
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
