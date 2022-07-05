Class {
	#name : #DCPieChart,
	#superclass : #Object,
	#instVars : [
		'colors',
		'explodes',
		'legend',
		'data',
		'kind',
		'labels',
		'size'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCPieChart >> build [
	self propagateData.
	self kind sliceShape externalRadius: self size.
	self kind sliceColor: self defaultColors.
	self kind build.
	self changesAfterBuilding

]

{ #category : #accessing }
DCPieChart >> changesAfterBuilding [
	self propagateColors.
	self propagateLabels.
	self propagateExplodes
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

{ #category : #building }
DCPieChart >> defaultExternalRadius [
	^ 200


]

{ #category : #accessing }
DCPieChart >> defaultKind [
	^ RSPie new.
]

{ #category : #accessing }
DCPieChart >> explodes [
	^ explodes 
]

{ #category : #accessing }
DCPieChart >> explodes: aCollection [ 
	explodes := aCollection
]

{ #category : #initialization }
DCPieChart >> initialize [ 
	super initialize.
	legend:= DCLegend new.
	kind := self defaultKind.
]

{ #category : #accessing }
DCPieChart >> kind [
	^ kind.
]

{ #category : #accessing }
DCPieChart >> labels [
	^ labels
]

{ #category : #accessing }
DCPieChart >> labels: aCollection [
	labels := aCollection
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

{ #category : #building }
DCPieChart >> propagateExplodes [
	self explodes ifNil: [ ^self ].
	self mainShapes with: self explodes do:[ :shp :ex | shp emphasizeWith: ex ]
]

{ #category : #building }
DCPieChart >> propagateLabels [
	| pieLabel |
	self labels ifNil: [ ^self ].
	pieLabel:= RSPieLabeledInteraction new.
	pieLabel labelShape fontSize: 13.
	self mainShapes with: self labels do:[ :shp :lb | shp @ (pieLabel labelText: lb) ].
	
]

{ #category : #showing }
DCPieChart >> show [
	^ self kind canvas open.
]

{ #category : #accessing }
DCPieChart >> size [
	size ifNil:[^ self defaultExternalRadius].
	^ size.
]

{ #category : #accessing }
DCPieChart >> size: aNumber [
	size:= aNumber
]
