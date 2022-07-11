Class {
	#name : #DCPieLabelDecoration,
	#superclass : #RSPieLabeledInteraction,
	#instVars : [
		'totalSum',
		'fontSize',
		'shouldUseLabelOut'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #initialization }
DCPieLabelDecoration >> defaultfontSize [

	^ 13
]

{ #category : #initialization }
DCPieLabelDecoration >> fontSize [

	^ fontSize
]

{ #category : #initialization }
DCPieLabelDecoration >> generateLablesFor: aDCPiePlot [

	| labels shapes |
	aDCPiePlot class = DCPiePlot ifFalse: [ 
		^ self error: ' object must be a DCPieChart' ].
	totalSum := aDCPiePlot kind totalSum.
	shapes := aDCPiePlot mainShapes.
	labels := aDCPiePlot labels.
	self shouldUseLabelOut ifTrue: [ self offset: aDCPiePlot size * 0.7 ].
	self labelShape fontSize: self fontSize.
	self put: labels in: shapes
]

{ #category : #initialization }
DCPieLabelDecoration >> initialize [

	super initialize.
	shouldUseLabelOut := false.
	totalSum := 0.
	fontSize := self defaultfontSize.
]

{ #category : #public }
DCPieLabelDecoration >> noLabelOut [
	shouldUseLabelOut := false
]

{ #category : #initialization }
DCPieLabelDecoration >> put: lb after: shp [

	^ (shp model * 100 / self totalSum) rounded asString , '% ', lb 
]

{ #category : #initialization }
DCPieLabelDecoration >> put: lb before: shp [

	^ lb , ' ' , (shp model * 100 / self totalSum) rounded asString , '%'
]

{ #category : #initialization }
DCPieLabelDecoration >> put: labels in: shapes [

	shapes
		with: labels
		do: [ :shp :lb | shp @ (self labelText: (self put: lb before: shp)) ]
]

{ #category : #testing }
DCPieLabelDecoration >> shouldUseLabelOut [
	^ shouldUseLabelOut
]

{ #category : #initialization }
DCPieLabelDecoration >> totalSum [
	^ totalSum
]

{ #category : #public }
DCPieLabelDecoration >> useLabelOut [
	shouldUseLabelOut := true
]
