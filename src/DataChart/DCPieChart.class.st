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
		'size',
		'lb'
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

{ #category : #building }
DCPieChart >> buildLegendData [

	self mainShapes with: self labels do: [ :shp :label | 
		self legend text: label withBoxColor: shp computeColor ].
	self legend legendDo: [ :shape | 
		shape
			withBorder;
			padding: 10;
			scaleBy: 0.5 ]
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
	lb :=  DCPieLabelDecoration new.
	legend := DCLegend new.
]

{ #category : #accessing }
DCPieChart >> kind [
	^ kind.
]

{ #category : #accessing }
DCPieChart >> label [
	^ lb
]

{ #category : #accessing }
DCPieChart >> label: aLabelDecoration [
	lb := aLabelDecoration
]

{ #category : #accessing }
DCPieChart >> labelOut [
	self label out.
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

{ #category : #accessing }
DCPieChart >> parcentagesBeforeLabels [
	self label parcentagesBeforeLabels.
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

	self labels ifNil: [ ^self ].
	self label generateLablesFor: self.
	
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

{ #category : #accessing }
DCPieChart >> useLabelOut [
	self label out.
]
