Class {
	#name : #DCPiePlot,
	#superclass : #DCCircularPlot,
	#instVars : [
		'colors',
		'explodes',
		'labels',
		'label'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCPiePlot >> build [
	self propagateData.
	self kind sliceShape externalRadius: self size.
	self kind sliceColor: self defaultColors.
	self kind build.
	self changesAfterBuilding

]

{ #category : #building }
DCPiePlot >> buildLegendData [

	self mainShapes with: self labels do: [ :shp :label | 
		self legend text: label withBoxColor: shp computeColor ].
	self legend legendDo: [ :shape | 
		shape
			withBorder;
			padding: 10;
			scaleBy: 0.5 ]
]

{ #category : #building }
DCPiePlot >> changesAfterBuilding [
	self propagateColors.
	self propagateLabels.
	self propagateExplodes
]

{ #category : #accessing }
DCPiePlot >> colors [
	^ colors 
]

{ #category : #accessing }
DCPiePlot >> colors: aCollectionOfColors [
	colors := aCollectionOfColors
]

{ #category : #defaults }
DCPiePlot >> defaultColors [
	^ NSScale category10 
]

{ #category : #defaults }
DCPiePlot >> defaultExternalRadius [
	^ 200


]

{ #category : #defaults }
DCPiePlot >> defaultKind [
	^ RSPie new.
]

{ #category : #defaults }
DCPiePlot >> defaultSize [
	^ 200


]

{ #category : #accessing }
DCPiePlot >> explodes [
	^ explodes 
]

{ #category : #accessing }
DCPiePlot >> explodes: aCollection [ 
	explodes := aCollection
]

{ #category : #initialization }
DCPiePlot >> initialize [ 
	super initialize.
	label := DCPieLabelDecoration new.
]

{ #category : #accessing }
DCPiePlot >> label [
	^ label
]

{ #category : #accessing }
DCPiePlot >> labels [

	^ labels
]

{ #category : #accessing }
DCPiePlot >> labels: aCollection [
	labels := aCollection
]

{ #category : #accessing }
DCPiePlot >> mainShapes [
	^ self kind shapes. 
]

{ #category : #building }
DCPiePlot >> propagateColors [
	self colors ifNil:[ ^ self].
	self colors with: self mainShapes do:[:color : shape| shape color: color]
]

{ #category : #building }
DCPiePlot >> propagateData [
	self kind objects: self data yourself.
]

{ #category : #building }
DCPiePlot >> propagateExplodes [
	self explodes ifNil: [ ^self ].
	self mainShapes with: self explodes do:[ :shp :ex | shp emphasizeWith: ex ]
]

{ #category : #building }
DCPiePlot >> propagateLabels [

	self labels ifNil: [ ^self ].
	self label generateLablesFor: self.
	
]

{ #category : #accessing }
DCPiePlot >> show [
	^ self kind canvas open.
]

{ #category : #public }
DCPiePlot >> useLabelOut [
	self label useLabelOut
]
