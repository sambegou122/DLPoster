Class {
	#name : #DCLabelDecorationForBarPlot,
	#superclass : #RSAbstractChartDecoration,
	#instVars : [
		'labels',
		'location'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #accessing }
DCLabelDecorationForBarPlot >> addIn: aDCBarPlot [
	aDCBarPlot addDecoration: self
]

{ #category : #building }
DCLabelDecorationForBarPlot >> createLabels: values [
	^ values collect: [ :value | self newLabelFor: value ]
]

{ #category : #accessing }
DCLabelDecorationForBarPlot >> createdShapes [
	^ labels.
]

{ #category : #initialization }
DCLabelDecorationForBarPlot >> defaultLocation [
	^ RSLocation new
		outer;
		center;
		top;
		yourself
]

{ #category : #initialization }
DCLabelDecorationForBarPlot >> defaultShape [ 
	^ RSLabel new 
		fontSize: 5;
		yourself
]

{ #category : #initialization }
DCLabelDecorationForBarPlot >> initialize [
	super initialize.
	location := self defaultLocation
]

{ #category : #accessing }
DCLabelDecorationForBarPlot >> labels [
	^ labels
]

{ #category : #accessing }
DCLabelDecorationForBarPlot >> location [
	^ location
]

{ #category : #hooks }
DCLabelDecorationForBarPlot >> newLabelFor: aNumber [
	^ self defaultShape copy 
		text: aNumber asString;
		yourself
]

{ #category : #rendering }
DCLabelDecorationForBarPlot >> renderIn: canvas [
	| plot bars |
	plot := self chart plots first.
	labels := self createLabels: plot yValues.
	bars := plot bars.
	labels with: bars do: [ :label :bar | location move: label on: bar ].
	canvas addAll: labels
	
]
