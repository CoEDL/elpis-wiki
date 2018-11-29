Once you've trained your model (e.g):
```sh
task _run-elan
task _train-test
```

You can put a new audio file in `working_dir/input/infer` and run:
```sh
task transcribe
```

Which will produce a CTM (time aligned file).

or:
```sh
task transcribe-align
```

Which will produce a CTM, Praat (.TextGrid and ELAN) (.eaf) time-aligned files.