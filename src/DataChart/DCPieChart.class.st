Class {
	#name : #DCPieChart,
	#superclass : #Object,
	#instVars : [
		'colors',
		'explodes',
		'label',
		'legend',
		'data',
		'kind'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCPieChart >> build [
	self propagateData.
	self kind sliceColor: self defaultColors.
	
	self kind build.
	self propagateColors.
]

{ #category : #accessing }
DCPieChart >> colors [
	^ colors 
]

{ #category : #accessing }
DCPieChart >> colors: aCollectionOfColors [
	colors := aCollectionOfColors
]

{ #category : #accessing }
DCPieChart >> data [
	^ data
]

{ #category : #accessing }
DCPieChart >> data: aCollection [ 
	data := aCollection
]

{ #category : #accessing }
DCPieChart >> defaultColors [
	^ NSScale category10 
]

{ #category : #accessing }
DCPieChart >> defaultKind [
	^ RSPie new.
]

{ #category : #accessing }
DCPieChart >> explodes [
	^ explodes 
]

{ #category : #initialization }
DCPieChart >> initialize [ 
	super initialize.
	label:= RSLabel new.
	legend:= DCLegend new.
	kind := self defaultKind.
]

{ #category : #accessing }
DCPieChart >> kind [
	^ kind.
]

{ #category : #accessing }
DCPieChart >> label [
	^ label
]

{ #category : #accessing }
DCPieChart >> legend [
	^ legend
]

{ #category : #accessing }
DCPieChart >> mainShapes [
	^ self kind shapes. 
]

{ #category : #building }
DCPieChart >> propagateColors [
	self colors ifNil:[ ^ self].
	self colors with: self mainShapes do:[:color : shape| shape color: color]
]

{ #category : #building }
DCPieChart >> propagateData [
	self kind objects: self data yourself.
]

{ #category : #showing }
DCPieChart >> show [
	^ self kind canvas open.
]
