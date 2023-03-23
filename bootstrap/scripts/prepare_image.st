"Load the code for the Pharo bootstrap process, together with some packages to do the bootstrap"

Transcript show: '    [+] Loading tonel code to dump files for the Pharo bootstrap process.'.

  Metacello new
	baseline: 'Espell';
	repository: 'github://jecisc/espell:master/src';
	onConflictUseIncoming;
	load
