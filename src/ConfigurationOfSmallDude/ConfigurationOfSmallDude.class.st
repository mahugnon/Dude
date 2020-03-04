Class {
	#name : #ConfigurationOfSmallDude,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : #ConfigurationOfSmallDude
}

{ #category : #private }
ConfigurationOfSmallDude class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #private }
ConfigurationOfSmallDude class >> ensureMetacello [
	Smalltalk at: #MetacelloProject ifAbsent: [
		Gofer new
				url: 'http://seaside.gemstone.com/ss/metacello';
				addPackage: 'ConfigurationOfMetacello';
				load.
		(Smalltalk at: #ConfigurationOfMetacello) loadLatestVersion ]
]

{ #category : #'metacello tool support' }
ConfigurationOfSmallDude class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfSmallDude class >> loadDefault [
	(self project version: 'default') load
]

{ #category : #accessing }
ConfigurationOfSmallDude class >> loadDevelopment [
	(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfSmallDude class >> project [

	^self new project
]

{ #category : #baselines }
ConfigurationOfSmallDude >> baseline20beta1: spec [ 
	<version: '2.0-beta.1-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/SmallDude'.
		spec 
			package: 'Moose-Core' with: [spec repository: 'http://www.squeaksource.com/Moose'];
			package: 'Famix-Core' with: [spec repository: 'http://www.squeaksource.com/Moose'];
			package: 'CollectionExtensions' with: [spec repository: 'http://www.squeaksource.com/Moose'];
			package: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: [spec requires: 'SmallDude-Utils'];
			package: 'SmallDude-Moose' with: [spec requires: 'Famix-Core'];
			package: 'SmallDude-Species';
			package: 'SmallDude-TestTextParsing';
			package: 'SmallDude-Tests';
			package: 'SmallDude-TextCleaning'.
		spec group: 'Tests' with: #( 'SmallDude-Tests'	).
	]
]

{ #category : #baselines }
ConfigurationOfSmallDude >> baseline20beta5: spec [
	<version: '2.0-beta.5-baseline'>

	spec for: #common do: [
		spec author: 'simondenier'.
		spec timestamp: '4/6/2010 18:15'.
		spec blessing: #baseline.
		spec description: 'Change CollectionExtensions repository'.
		spec repository: 'http://www.squeaksource.com/SmallDude'.
		spec 
			package: 'Moose-Core' with: [spec repository: 'http://www.squeaksource.com/Moose'];
			package: 'Famix-Core' with: [spec repository: 'http://www.squeaksource.com/Moose'];
			package: 'CollectionExtensions' with: [spec repository: 'http://www.squeaksource.com/CollectionExtensions'];
			package: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: [spec requires: 'SmallDude-Utils'];
			package: 'SmallDude-Moose' with: [spec requires: 'Famix-Core'];
			package: 'SmallDude-Species';
			package: 'SmallDude-TestTextParsing';
			package: 'SmallDude-Tests';
			package: 'SmallDude-TextCleaning'.
		spec group: 'Tests' with: #( 'SmallDude-Tests'	).
	]
]

{ #category : #baselines }
ConfigurationOfSmallDude >> baseline20beta6: spec [
	<version: '2.0-beta.6-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/SmallDude'.
		spec 
			package: 'Moose-Core' with: [spec repository: 'http://www.squeaksource.com/Moose'];
			package: 'Famix-Core' with: [spec repository: 'http://www.squeaksource.com/Moose'];
			package: 'CollectionExtensions' with: [spec repository: 'http://www.squeaksource.com/CollectionExtensions'];
			package: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: [spec requires: 'SmallDude-Utils'];
			package: 'SmallDude-Moose' with: [spec requires: 'Famix-Core'];
			package: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core';
			package: 'SmallDude-Text'.
		spec group: 'Tests' with: #( 'SmallDude-Tests-Core').
	]
]

{ #category : #baselines }
ConfigurationOfSmallDude >> baseline21: spec [
	<version: '2.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'For Mondrian 4.3.2'.
		spec repository: 'http://www.squeaksource.com/SmallDude'.
		spec project: 'MooseAlgos for Moose' with: [
				spec
					className: 'ConfigurationOfMooseAlgos';
					versionString: 'default';
					repository: 'http://www.squeaksource.com/MooseAlgos' ].
		spec 
			package: 'Moose-Core' with: [
				spec repository: 'http://www.squeaksource.com/Moose'. ];
			package: 'Moose-Tests-Core' with: [
				spec repository: 'http://www.squeaksource.com/Moose'. ];
			package: 'Fame' with: [
				spec repository: 'http://www.squeaksource.com/Moose'. ];
			package: 'Famix-File' with: [
				spec repository: 'http://www.squeaksource.com/Moose'. ];
			package: 'Famix-Core' with: [
				spec 
					requires: #('MooseAlgos for Moose' );
					repository: 'http://www.squeaksource.com/Moose'. ];
			package: 'CollectionExtensions' with: [
				spec repository: 'http://www.squeaksource.com/CollectionExtensions'. ];
			package: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: [
				spec requires: #('SmallDude-Utils' ). ];
			package: 'SmallDude-Moose' with: [
				spec requires: #('Famix-Core' ). ];
			package: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core';
			package: 'SmallDude-Text'.
		spec group: 'Tests' with: #('SmallDude-Tests-Core' ). ].

]

{ #category : #baselines }
ConfigurationOfSmallDude >> baseline22: spec [
	<version: '2.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.squeaksource.com/SmallDude'.
		spec project: 'Moose Core' with: [
				spec
					className: 'ConfigurationOfMoose';
					versionString: 'default';
					loads: #('Core' );
					repository: 'http://www.squeaksource.com/Moose' ].
		spec 
			package: 'Moose-Tests-Core' with: [
				spec repository: 'http://www.squeaksource.com/Moose'. ];
			package: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: [
				spec requires: #('Moose Core' 'SmallDude-Utils' ). ];
			package: 'SmallDude-Moose' with: [
				spec requires: #('SmallDude-Core' ). ];
			package: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core' with: [
				spec requires: #('Moose-Tests-Core' ). ];
			package: 'SmallDude-Text' with: [
				spec requires: #('Moose Core' ). ].
		spec group: 'Tests' with: #('SmallDude-Tests-Core' 'SmallDude-Tests-Text' ). ].

]

{ #category : #baselines }
ConfigurationOfSmallDude >> baseline23: spec [
	<version: '2.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.smalltalkhub.com/mc/Moose/SmallDude/main'.
		spec project: 'Moose Core' with: [
				spec
					className: 'ConfigurationOfMoose';
					versionString: #development;
					loads: #('Core' );
					repository: 'http://www.smalltalkhub.com/mc/Moose/Moose/main' ].
		spec 
			package: 'Moose-Tests-Core' with: [
				spec repository: 'http://www.smalltalkhub.com/mc/Moose/Moose/main'. ];
			package: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: [
				spec requires: #('Moose Core' 'SmallDude-Utils' ). ];
			package: 'SmallDude-Moose' with: [
				spec requires: #('SmallDude-Core' ). ];
			package: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core' with: [
				spec requires: #('Moose-Tests-Core' ). ];
			package: 'SmallDude-Text' with: [
				spec requires: #('Moose Core' ). ].
		spec group: 'Tests' with: #('SmallDude-Tests-Core' 'SmallDude-Tests-Text' ). ].

]

{ #category : #baselines }
ConfigurationOfSmallDude >> baseline24: spec [
	<version: '2.4-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.smalltalkhub.com/mc/Moose/SmallDude/main'.
		spec project: 'Famix' with: [
				spec
					className: 'ConfigurationOfFamix';
					versionString: #stable;
					repository: 'http://www.smalltalkhub.com/mc/Moose/Famix/main' ].
		spec 
			package: 'Moose-Tests-Core' with: [
				spec repository: 'http://www.smalltalkhub.com/mc/Moose/Moose/main'. ];
			package: 'SmallDude-Utils' with: [
				spec requires: #('Famix'). ];
			package: 'SmallDude-Core' with: [
				spec requires: #('Famix' 'SmallDude-Utils' ). ];
			package: 'SmallDude-Moose' with: [
				spec requires: #('SmallDude-Core' ). ];
			package: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core' with: [
				spec requires: #('Moose-Tests-Core' ). ];
			package: 'SmallDude-Text' with: [
				spec requires: #('Famix' ). ].
		spec group: 'Core' with: #('SmallDude-Core' 'SmallDude-Species' 'SmallDude-Moose' 'SmallDude-Text').
		spec group: 'Tests' with: #('SmallDude-Tests-Core' 'SmallDude-Tests-Text' ). ].

]

{ #category : #baselines }
ConfigurationOfSmallDude >> baseline25: spec [
	<version: '2.5-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.smalltalkhub.com/mc/Moose/SmallDude/main'.
		spec project: 'Famix' with: [
				spec
					className: 'ConfigurationOfFamix';
					versionString: #development;
					repository: 'http://www.smalltalkhub.com/mc/Moose/Famix/main' ].
		spec 
			package: 'Moose-Tests-Core' with: [
				spec repository: 'http://www.smalltalkhub.com/mc/Moose/Moose/main'. ];
			package: 'SmallDude-Utils' with: [
				spec requires: #('Famix'). ];
			package: 'SmallDude-Core' with: [
				spec requires: #('Famix' 'SmallDude-Utils' ). ];
			package: 'SmallDude-Moose' with: [
				spec requires: #('SmallDude-Core' ). ];
			package: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core' with: [
				spec requires: #('Moose-Tests-Core' ). ];
			package: 'SmallDude-Text' with: [
				spec requires: #('Famix' ). ].
		spec group: 'Core' with: #('SmallDude-Core' 'SmallDude-Species' 'SmallDude-Moose' 'SmallDude-Text').
		spec group: 'Tests' with: #('SmallDude-Tests-Core' 'SmallDude-Tests-Text' ). ].

]

{ #category : #baselines }
ConfigurationOfSmallDude >> default: spec [ 
	<version: 'default'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/SmallDude'.
		spec 
			package: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: [spec requires: #('Moose Core' 'SmallDude-Utils')];
			package: 'SmallDude-Moose' with: [spec requires: #('SmallDude-Core')];
			package: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core' with: [spec requires: 'SmallDude-Core'];
			package: 'SmallDude-Text' with: [spec requires: #('SmallDude-Core')].
		spec group: 'Tests' with: #( 'SmallDude-Tests-Core' 'SmallDude-Tests-Text').
		spec project: 'Moose Core' with: [
				spec
					className: 'ConfigurationOfMoose';
					file: 'ConfigurationOfMoose';
					version: 'coreDefault';
					repository: 'http://www.squeaksource.com/Moose' ].
	]
]

{ #category : #'symbolic versions' }
ConfigurationOfSmallDude >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'pharo4.x' version: '2.4-baseline'.

	spec for: #'pharo5.x' version: #'stable'.

	spec for: #'pharo6.x' version: '2.5-baseline'.
	
	spec for: #'pharo7.x' version: '2.5-baseline'.

]

{ #category : #accessing }
ConfigurationOfSmallDude >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project]
]

{ #category : #'symbolic versions' }
ConfigurationOfSmallDude >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '3.1'.

	spec for: #'pharo3.x' version: '2.4'.

	spec for: #'pharo4.x' version: '2.7'.

	spec for: #'pharo5.x' version: '3.1'.

]

{ #category : #versions }
ConfigurationOfSmallDude >> version20beta1: spec [
	<version: '2.0-beta.1' imports: #('2.0-beta.1-baseline')>

	spec for: #common do: [
		spec blessing: #stable.
		spec author: 'tg'.
		spec timestamp: '11/22/2009 11:17'.
		spec 
			package: 'Moose-Core' with: 'Moose-Core-simon_denier.180';
			package: 'Famix-Core' with: 'Famix-Core-simondenier.98';
			package: 'CollectionExtensions' with: 'CollectionExtensions-tg.18';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-tg.6';
			package: 'SmallDude-Core' with: 'SmallDude-Core-tg.14';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-tg.5';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-TestTextParsing' with: 'SmallDude-TestTextParsing-tg.7';
			package: 'SmallDude-Tests' with: 'SmallDude-Tests-tg.12';
			package: 'SmallDude-TextCleaning' with: 'SmallDude-TextCleaning-tg.3'.].
]

{ #category : #versions }
ConfigurationOfSmallDude >> version20beta2: spec [
	<version: '2.0-beta.2' imports: #('2.0-beta.1-baseline')>

	spec for: #common do: [
		spec blessing: #stable.
		spec author: 'tg'.
		spec timestamp: '12/28/2009 21:31'.
		spec 
			package: 'Moose-Core' with: 'Moose-Core-tg.207';
			package: 'Famix-Core' with: 'Famix-Core-tg.103';
			package: 'CollectionExtensions' with: 'CollectionExtensions-tg.18';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-tg.6';
			package: 'SmallDude-Core' with: 'SmallDude-Core-tg.18';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-tg.9';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-TestTextParsing' with: 'SmallDude-TestTextParsing-tg.7';
			package: 'SmallDude-Tests' with: 'SmallDude-Tests-tg.14';
			package: 'SmallDude-TextCleaning' with: 'SmallDude-TextCleaning-tg.3'.].
]

{ #category : #versions }
ConfigurationOfSmallDude >> version20beta3: spec [
	<version: '2.0-beta.3' imports: #('2.0-beta.1-baseline')>

	spec for: #common do: [
		spec blessing: #beta.
		spec author: 'tg'.
		spec timestamp: '2/16/2010 12:36'.
		spec 
			package: 'Moose-Core' with: 'Moose-Core-cyrille_delaunay.223';
			package: 'Famix-Core' with: 'Famix-Core-simondenier.106';
			package: 'CollectionExtensions' with: 'CollectionExtensions-tg.18';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-tg.6';
			package: 'SmallDude-Core' with: 'SmallDude-Core-tg.18';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-tg.9';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-TestTextParsing' with: 'SmallDude-TestTextParsing-tg.7';
			package: 'SmallDude-Tests' with: 'SmallDude-Tests-tg.16';
			package: 'SmallDude-TextCleaning' with: 'SmallDude-TextCleaning-tg.3'.].
]

{ #category : #versions }
ConfigurationOfSmallDude >> version20beta4: spec [
	<version: '2.0-beta.4' imports: #('2.0-beta.1-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec author: 'simon.denier'.
		spec timestamp: '3/26/2010 19:29'.
		spec 
			package: 'Moose-Core' with: 'Moose-Core-simondenier.229';
			package: 'Famix-Core' with: 'Famix-Core-tg.108';
			package: 'CollectionExtensions' with: 'CollectionExtensions-simon_denier.19';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-tg.7';
			package: 'SmallDude-Core' with: 'SmallDude-Core-tg.19';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-tg.11';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-TestTextParsing' with: 'SmallDude-TestTextParsing-tg.7';
			package: 'SmallDude-Tests' with: 'SmallDude-Tests-tg.17';
			package: 'SmallDude-TextCleaning' with: 'SmallDude-TextCleaning-tg.3'.].
]

{ #category : #versions }
ConfigurationOfSmallDude >> version20beta5: spec [
	<version: '2.0-beta.5' imports: #('2.0-beta.5-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec author: 'simondenier'.
		spec timestamp: '4/6/2010 19:38'.
		spec 
			package: 'Moose-Core' with: 'Moose-Core-simondenier.231';
			package: 'Famix-Core' with: 'Famix-Core-tg.110';
			package: 'CollectionExtensions' with: 'CollectionExtensions-simon_denier.19';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-tg.7';
			package: 'SmallDude-Core' with: 'SmallDude-Core-tg.19';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-tg.11';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-TestTextParsing' with: 'SmallDude-TestTextParsing-tg.7';
			package: 'SmallDude-Tests' with: 'SmallDude-Tests-tg.17';
			package: 'SmallDude-TextCleaning' with: 'SmallDude-TextCleaning-tg.3'.].
]

{ #category : #versions }
ConfigurationOfSmallDude >> version20beta6: spec [
	<version: '2.0-beta.6' imports: #('2.0-beta.5-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec author: 'jannik.laval'.
		spec timestamp: '6/1/2010 22:55'.
		spec 
			package: 'Moose-Core' with: 'Moose-Core-cyrille_delaunay.253';
			package: 'Famix-Core' with: 'Famix-Core-jl.112';
			package: 'CollectionExtensions' with: 'CollectionExtensions-tg.20';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-cyrille_delaunay.8';
			package: 'SmallDude-Core' with: 'SmallDude-Core-cyrille_delaunay.24';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-tg.11';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-TestTextParsing' with: 'SmallDude-TestTextParsing-jannik_laval.8';
			package: 'SmallDude-Tests' with: 'SmallDude-Tests-tg.17';
			package: 'SmallDude-TextCleaning' with: 'SmallDude-TextCleaning-tg.3'.].
]

{ #category : #versions }
ConfigurationOfSmallDude >> version20beta7: spec [
	<version: '2.0-beta.7' imports: #('2.0-beta.6-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec author: 'jl'.
		spec timestamp: '09/13/2010 22:00'.
		spec 
			package: 'Moose-Core' with: 'Moose-Core-tg.280';
			package: 'Famix-Core' with: 'Famix-Core-cyrille_delaunay.123';
			package: 'CollectionExtensions' with: 'CollectionExtensions-jannik_laval.25';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-simon_denier.9';
			package: 'SmallDude-Core' with: 'SmallDude-Core-tg.28';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-tg.12';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text-tg.1';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core-tg.1';
			package: 'SmallDude-Text' with: 'SmallDude-Text-tg.1'.].
]

{ #category : #versions }
ConfigurationOfSmallDude >> version21: spec [
	<version: '2.1' imports: #('2.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'broken'.
		spec description: 'New version'.
		spec author: 'AlexandreBergel'.
		spec timestamp: '2/18/2011 15:39'.
		spec project: 'MooseAlgos for Moose' with: '2.2'.
		spec 
			package: 'Famix-File' with: 'Famix-File-TudorGirba.32';
			package: 'Famix-Extensions' with: 'Famix-Extensions-AndreHora.162';
			package: 'Fame' with: 'Fame-TudorGirba.167';
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core-TudorGirba.17';
			package: 'Moose-Core' with: 'Moose-Core-TudorGirba.312';
			package: 'Famix-Core' with: 'Famix-Core-TudorGirba.140';
			package: 'CollectionExtensions' with: 'CollectionExtensions-simondenier.26';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-simon_denier.10';
			package: 'SmallDude-Core' with: 'SmallDude-Core-cyrille_delaunay.30';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-tg.12';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text-cyrille_delaunay.2';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core-tg.1';
			package: 'SmallDude-Text' with: 'SmallDude-Text-tg.1'. ].

]

{ #category : #versions }
ConfigurationOfSmallDude >> version22: spec [
	<version: '2.2' imports: #('2.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'broken'.
		spec description: 'New version'.
		spec author: 'AlexandreBergel'.
		spec timestamp: '2/19/2011 18:47'.
		spec project: 'MooseAlgos for Moose' with: '2.2'.
		spec 
			package: 'Moose-Core' with: 'Moose-Core';
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core';
			package: 'Fame' with: 'Fame';
			package: 'Famix-File' with: 'Famix-File';
			package: 'Famix-Core' with: 'Famix-Core';
			package: 'CollectionExtensions' with: 'CollectionExtensions-simondenier.26';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: 'SmallDude-Core';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose';
			package: 'SmallDude-Species' with: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core';
			package: 'SmallDude-Text' with: 'SmallDude-Text'. ].

]

{ #category : #versions }
ConfigurationOfSmallDude >> version23: spec [
	<version: '2.3' imports: #('2.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'broken'.
		spec description: 'New version'.
		spec author: 'AlexandreBergel'.
		spec timestamp: '2/20/2011 19:38'.
		spec project: 'Moose Core' with: '4.2'.
		spec 
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: 'SmallDude-Core';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose';
			package: 'SmallDude-Species' with: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core';
			package: 'SmallDude-Text' with: 'SmallDude-Text'. ].

]

{ #category : #versions }
ConfigurationOfSmallDude >> version24: spec [
	<version: '2.4' imports: #('2.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'New version'.
		spec author: 'StephanEggermont'.
		spec timestamp: '12/12/2014 13:51'.
		spec project: 'Moose Core' with: #'stable'.
		spec 
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core-akevalion.107';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils';
			package: 'SmallDude-Core' with: 'SmallDude-Core';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose';
			package: 'SmallDude-Species' with: 'SmallDude-Species';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core';
			package: 'SmallDude-Text' with: 'SmallDude-Text'. ].

]

{ #category : #versions }
ConfigurationOfSmallDude >> version25: spec [
	<version: '2.5' imports: #('2.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'For moose 5.1'.
		spec author: 'AndreiChis'.
		spec timestamp: '5/18/2015 13:46'.
		spec project: 'Moose Core' with: #'stable'.
		spec 
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core-akevalion.107';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-usmanbhatti.13';
			package: 'SmallDude-Core' with: 'SmallDude-Core-NicolasAnquetil.46';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-TudorGirba.23';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text-AndreHora.4';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core-NicolasAnquetil.9';
			package: 'SmallDude-Text' with: 'SmallDude-Text-TudorGirba.3'. ].

]

{ #category : #versions }
ConfigurationOfSmallDude >> version26: spec [
	<version: '2.6' imports: #('2.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'Do not depend on Moose anymore'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '7/7/2016 15:00'.
		spec project: 'Famix' with: #'stable'.
		spec 
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core-akevalion.107';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-usmanbhatti.13';
			package: 'SmallDude-Core' with: 'SmallDude-Core-NicolasAnquetil.46';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-TudorGirba.23';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text-AndreHora.4';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core-NicolasAnquetil.9';
			package: 'SmallDude-Text' with: 'SmallDude-Text-TudorGirba.3'. ].

]

{ #category : #versions }
ConfigurationOfSmallDude >> version27: spec [
	<version: '2.7' imports: #('2.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'Some properties should be derived'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '3/8/2017 16:00'.
		spec project: 'Famix' with: #'stable'.
		spec 
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core-akevalion.107';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-usmanbhatti.13';
			package: 'SmallDude-Core' with: 'SmallDude-Core-NicolasAnquetil.46';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-CyrilFerlicot.25';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text-AndreHora.4';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core-NicolasAnquetil.9';
			package: 'SmallDude-Text' with: 'SmallDude-Text-TudorGirba.3'. ].

]

{ #category : #versions }
ConfigurationOfSmallDude >> version30: spec [
	<version: '3.0' imports: #('2.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'Moose 6.0 release'.
		spec author: 'TudorGirba'.
		spec timestamp: '8/14/2016 20:44'.
		spec project: 'Famix' with: #'stable'.
		spec 
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core-TudorGirba.116';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-usmanbhatti.13';
			package: 'SmallDude-Core' with: 'SmallDude-Core-NicolasAnquetil.46';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-TudorGirba.24';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text-AndreHora.4';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core-NicolasAnquetil.9';
			package: 'SmallDude-Text' with: 'SmallDude-Text-TudorGirba.3'. ].

]

{ #category : #versions }
ConfigurationOfSmallDude >> version31: spec [
	<version: '3.1' imports: #('2.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'Some properties should be derived in files'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '3/8/2017 16:00'.
		spec project: 'Famix' with: #'stable'.
		spec 
			package: 'Moose-Tests-Core' with: 'Moose-Tests-Core-TudorGirba.116';
			package: 'SmallDude-Utils' with: 'SmallDude-Utils-usmanbhatti.13';
			package: 'SmallDude-Core' with: 'SmallDude-Core-NicolasAnquetil.46';
			package: 'SmallDude-Moose' with: 'SmallDude-Moose-CyrilFerlicot.25';
			package: 'SmallDude-Species' with: 'SmallDude-Species-tg.1';
			package: 'SmallDude-Tests-Text' with: 'SmallDude-Tests-Text-AndreHora.4';
			package: 'SmallDude-Tests-Core' with: 'SmallDude-Tests-Core-NicolasAnquetil.9';
			package: 'SmallDude-Text' with: 'SmallDude-Text-TudorGirba.3'. ].

]
