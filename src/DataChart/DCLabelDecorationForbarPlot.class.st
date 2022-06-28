Class {
	#name : #DCLabelDecorationForbarPlot,
	#superclass : #RSAbstractChartDecoration,
	#instVars : [
		'labels'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #accessing }
DCLabelDecorationForbarPlot >> addIn: aDCBarPlot [ 
	aDCBarPlot addDecoration: self
]

{ #category : #add }
DCLabelDecorationForbarPlot >> addLabels: aRSBarPlot [ 
	 | myLabels bars location|
	self genarateLabels: aRSBarPlot.
	bars := aRSBarPlot bars.
	location := RSLocation new.
	myLabels := self labels.
	myLabels doWithIndex: [:index :label | | bar |
		bar := bars at: index.
		location outer; top; move: label on: bar.]
]

{ #category : #accessing }
DCLabelDecorationForbarPlot >> createdShapes [
	^ labels.
]

{ #category : #initialization }
DCLabelDecorationForbarPlot >> defaultShape [ 
	^ RSLabel new.
]

{ #category : #building }
DCLabelDecorationForbarPlot >> genarateLabels: aRSBarPlot [ 
	| values |
	values := aRSBarPlot yValues.
	values do: [ :value| self labels add: (self defaultShape text: (value asString)) ]
]

{ #category : #initialization }
DCLabelDecorationForbarPlot >> initialize [ 
	super initialize.
	labels := OrderedCollection new.
]

{ #category : #accessing }
DCLabelDecorationForbarPlot >> labels [
	^ labels
]
