Class {
	#name : #DCLegend,
	#superclass : #RSLegend,
	#instVars : [
		'shouldTargetAllShapes'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #hooks }
DCLegend >> basicRenderIn: aCanvas [
	| legend target |
	legend := self createLegend.
	target := self shouldTargetAllShapes
		ifTrue: [  aCanvas shapes ]
		ifFalse: [ 
			self flag: 'TODO'.
			aCanvas shapes first "this should be the box, but we are not sure" ].
	location move: legend on: target.
	aCanvas addShape: legend.
]

{ #category : #initialization }
DCLegend >> defaultConfigurationFor: aRSComposite [
	"aRSComposite is the shape created by DCLegend"
	aRSComposite 
		border: (RSBorder new color: 'black'; yourself);
		color: (Color white alpha: 0.85);
		scaleBy: 0.7;
		padding: 5
]

{ #category : #initialization }
DCLegend >> reset [
	super reset.
	self targetAllShapes.
	self legendDo: [ :shape | self defaultConfigurationFor: shape ].
	location := DCLocation new
		legend: self;
		yourself
]

{ #category : #testing }
DCLegend >> shouldTargetAllShapes [
	^ shouldTargetAllShapes
]

{ #category : #public }
DCLegend >> targetAllShapes [
	shouldTargetAllShapes := true.
]

{ #category : #public }
DCLegend >> targetOnlyBox [
	shouldTargetAllShapes := false
]
