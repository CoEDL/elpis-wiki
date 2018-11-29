Once you've trained your model (e.g):
```sh
task _run-elan
task _train-test
```

You can put a new audio file in `working_dir/input/infer` and run:
```sh
task transcribe
```

**Note: this process currently only supports short audio files (generally a single utterance or ~10s). If you do try with longer files and it doesn't work out, please let us know what went wrong. We intend on increasing supported length and appreciate any and all feedback**

Which will produce a CTM (time aligned file).

or:
```sh
task transcribe-align
```

Which will produce a CTM, Praat (.TextGrid and ELAN) (.eaf) time-aligned files.