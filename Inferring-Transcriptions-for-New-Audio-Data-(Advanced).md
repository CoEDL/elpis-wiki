_This functionality is included in ELPIS images ≥0.86_

### Optional Step: Add Additional Text Corpora or Word Lists
Do you have an additional word list (dictionary) or text corpora that you would like to include? This data will assist Kaldi in recognising words that don't appear in your transcribed training data and will increase the accuracy of its word-level n-gram prediction.

#### Including additional words
You can include additional words by including a list in plaintext in the file:

`working_dir/input/config/additional_words.txt`

#### Including additional text corpora
You can include additional text corpora by placing plaintext (.txt) files in the following directory:

`working_dir/input/config/text_corpora/`

Any subdirectories included in this directory will also be recursively searched for `.txt` files. The words in these text files that were not already included in the `additional_words.txt` file will be added to the wordlist.


# Process for Inferring Transcriptions for New Audio

Once you've trained your model (e.g):
```sh
task _run-elan
task _train-test
```

You can put a new audio file (named `audio.wav`) in the directory `working_dir/input/infer` and run:
```sh
task transcribe
```

Which will produce a CTM (time aligned file).

or:
```sh
task transcribe-align
```

Which will produce CTM, Praat (.TextGrid) and ELAN (.eaf) time-aligned files.

**Disclaimer: this process currently only supports short audio files (generally a single utterance or ~10s). If you do try with longer files and it doesn't work out, please let us know what went wrong. We intend on increasing supported length and appreciate any and all feedback**