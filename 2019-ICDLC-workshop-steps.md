Workshop steps

## Overview 
The speech recognition process broadly involves steps of:

Organising data that will be used to train the system (training input)

Cleaning data (normalisation)

Developing pronunciation rules

Training acoustic, pronunciation and language models

Then, using these models to get a first-pass transcription on un-transcribed data. 

This is “machine learning” technology, not “artificial intelligence”. The system doesn’t ever “understand” or know your content in the sense of understanding the meaning.

If you run the Docker version of Elpis, the processing all happens on your local computer, no data is uploaded to cloud servers. It is safe to use where  your ethics or permissions prevent sharing or uploading your data. 

---

## Setup
Follow the workshop steps to get some data, download, install and run Docker, and download and run the Elpis image.

## Interface tour
With the image running, take a tour of the interface. 
There are three main steps, with sub-steps in each. 

1. Data Bundles
2. Models
3. New transcriptions

**Data bundles** is where we collect and clean the audio and text which we will train the models with. 

**Models** here, we connect the data with “letter to sound” rules which Elpis will use to build a pronunciation dictionary, and then train the models. 

**New transcriptions** is the place we go to use an existing model to obtain a first-pass transcription on new audio. 

---

## Let’s break them down a little.. 
The system trains with existing audio and transcription files. Generally, the more data you can train with, the better the results, however it’s not simply a matter of throwing everything you have into a bucket.. Time spent cleaning and fine-tuning your existing transcriptions will have impact on your results. 


Select data from a common recording activity (also known as a domain), e.g. short sentences, or stories, or word-repetition exercises. You will typically get better results with small data sets but using data within a domain rather than mixing domains.

Data format requirements are:

a) WAV audio, preferably 44.1kHz mono but the system can convert stereo files and resample from different sample rates.

b) Orthographic transcription of the audio. For today’s workshop, the interface is limited to using Elan transcriptions. 
> We have other tools that will convert TextGrid and Transcriber data and will integrate this in the near future. Please let us know about your own data formats so we can include them in future versions!

c) Filenames of the transcription must match the audio filename.
> We are working on different ways to deal with this but for now these are best done manually.

Transcriptions don’t need to be word level. Annotations at an utterance/phrase level are fine. 

Clean your transcriptions by looking through them and checking the following:
- Standardise variation in spelling
* Replace non-lexical number forms, shorthand forms and abbreviations with full lexical forms. For example, replace ‘9’ with ‘nine’.
- For more cleaning tips, see the [Data preparation](https://github.com/CoEDL/elpis/wiki/Data-preparation) wiki page.


**When you are happy with your data, upload it.**

---

## Letter to sound prep
The letter-to-sound file is a text file you create, of rules mapping your orthography into phonemic transcription. It will be used to build a pronunciation lexicon for your data set.

It is formatted in two columns, space separated. Left column is all the characters in your corpus. The right column is a symbol representing the sound. You can use IPA or SAMPA for the right column.

If your language has diphthongs, put these earlier in the l2s, above single characters
eg 
```
ng ŋ
n n
```

Listen to the audio, are words that have been transcribed with consecutive matching characters representing one phoneme or two? If only one, add a line to your  `letter-to-sound.txt` file, mapping the consecutive characters to a single symbol and rebuild the lexicon. 

For example, if `wu̱nne̱` is mapped to `wu̱nne̱ w ɨ n n ɛ` in the lexicon, then add `nn n` to `letter-to-sound.txt`, upload it again and rebuild the lexicon.  The results should be collapsed lexicon entry `wu̱nne̱ w ɨ n ɛ`.


