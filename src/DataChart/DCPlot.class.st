"
Main class of my DataChart objects
"
Class {
	#name : #DCPlot,
	#superclass : #Object,
	#instVars : [
		'settings',
		'kind',
		'legend',
		'name'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCPlot >> build [
	" this methode build the plot"
	self subclassResponsibility
]

{ #category : #accessing }
DCPlot >> color [
	^ self settings color.
]

{ #category : #accessing }
DCPlot >> color: aColor [
	self settings color: aColor.
]

{ #category : #accessing }
DCPlot >> computeName [
	^ name ifNil: [ 'serie' ] ifNotNil:[ name ]
]

{ #category : #default }
DCPlot >> defaultKind [
	self subclassResponsibility
]

{ #category : #initialization }
DCPlot >> initialize [
	super initialize.
	settings := DCPlotSettings new.
	kind := self defaultKind.
	legend := DCLegend new.
]

{ #category : #accessing }
DCPlot >> kind [
	^ kind
]

{ #category : #accessing }
DCPlot >> legend [
	^ legend
]

{ #category : #legend }
DCPlot >> legendDo: aBlock [
	self settings withLegend.
	aBlock value: self legend
]

{ #category : #accessing }
DCPlot >> name [
	^name
]

{ #category : #accessing }
DCPlot >> name: aString [
	name:= aString
]

{ #category : #accessing }
DCPlot >> settings [
	^ settings
]

{ #category : #accessing }
DCPlot >> settings: aDCPlotSettings [ 
	settings := aDCPlotSettings
]

{ #category : #showing }
DCPlot >> show [
	"this methode allow to show the plot in the canvas"
	self subclassResponsibility
]

{ #category : #accessing }
DCPlot >> title: aString [
	self settings title: aString.
]
