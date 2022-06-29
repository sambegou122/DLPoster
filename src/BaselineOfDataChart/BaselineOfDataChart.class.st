"
Baseline for repositoy https://github.com/sambegou122/DLPoster
"
Class {
	#name : #BaselineOfDataChart,
	#superclass : #BaselineOf,
	#category : #'BaselineOfDataChart-Baseline'
}

{ #category : #baselines }
BaselineOfDataChart >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		"https://github.com/sambegou122/DLPoster"
		"Dependencies"
		self dataFrame: spec.

		"Packages"
		spec
			package: 'DataChart';
			package: 'DataChart-DataFrame' with: [ spec requires: #('DataChart' 'DataFrame')]; 
			package: 'DataChart-Examples' with: [ spec requires: #('DataChart') ];
			package: 'DataChart-DataFrame-Tests'  with: [ spec requires: #('DataChart-DataFrame')];
			package: 'DataChart-Tests'  with: [ spec requires: #('DataChart')].
			
		"Groups"
		spec
			group: 'Core' with: #('DataChart');
			group: 'DF' with: #('Core' 'DataChart-DataFrame');
			group: 'Tests' with: #('DataChart-Tests' 'DataChart-DataFrame-Tests');
			group: 'default' with: #('Tests' 'DataChart-Examples') ]
		
	
]

{ #category : #baseline }
BaselineOfDataChart >> dataFrame: spec [
	spec
		baseline: 'DataFrame'
		with: [ spec repository: 'github://PolyMathOrg/DataFrame/src' ]
]
