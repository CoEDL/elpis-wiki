# Cleaning data for speech recognition

ASR systems train on pre-transcribed speech data, building a statistical model of speech, which can then be applied to untranscribed speech. It is important to recognise that the type of speech that the system trains on will determine the type of speech that the trained model can be used on. For example if you train a system with speech of a person counting numbers, that model will be great for automatically transcribing more speech of that person counting, but wouldn’t be practical for transcribing a different person telling stories.

Select a collection of data for which you have the most orthographically-transcribed, high-quality speech recordings. The system will learn from these to build a model for the language. The more training data and the higher the quality (no background noise, good quality microphones) the better. If you are able to bring at least an hours worth will be good, though more will give the system greater amounts of material from which to learn. If you don’t have data, fear not, we will provide some.


## Preparing your existing transcriptions

Choose a set of data from your corpus. For maximum success in the workshop, use orthographically-transcribed content from a single speaker, preferably with more than an hour of transcription. Select data from a common recording activity, e.g. short sentences, or stories. The scripts we are using are written to work with ELAN (.eaf), Praat (.TextGrid), or Transcriber (.trs) files. Let us know if you have other transcription forms, as we may be able to write an import script for your data.

Duplicate your data set so that you don’t affect your data by preparing for this workshop, as some of these steps are destructive.

## Clean your transcriptions by looking through them and checking the following:

- Reduce inconsistencies or typos in transcriptions.
- Standardise variation in spelling.
- Replace non-lexical number forms, shorthand forms and abbreviations with full lexical forms. For example, replace ‘9’ with ‘nine’.
- Code-switching in a single tier will confuse the system. Although it is possible to train a multi-lingual system, in this workshop we will focus on one language. Separate multiple languages by creating one tier for the language you want to train.
- Out-of-vocabulary words (words that are in the corpus but not in the lexicon) will reduce the accuracy. Ensure that everything in the speech signal is transcribed.
- Remove inline conventions such as speaker or language codes.
- Remove punctuation

## Formats

As well as cleaning the transcription, ensure the audio is in a standard format. Our scripts anticipate 44.1KHz 16bit mono audio. If needed, you can convert audio to this format using Switch (OSX) or Audacity.

Audio filenames should match the transcript filenames, bearing in mind that any commas, spaces, pipes, etc. in the filenames will cause problems. Rename your filenames to only use alphanumeric with underscores or dashes.

Use noise reduction techniques to clean the audio signal.

You should now have a collection of cleaned transcriptions and audio in the right format. 

For examples, refer to the [Abui toy corpus](https://github.com/CoEDL/toy-corpora).




