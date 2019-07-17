## Overview 
The speech recognition (also called Speech to Text) process broadly involves steps of:

**Organising data** that will be used to train the system

**Cleaning data** (normalisation)

Making **pronunciation rules**

**Training** acoustic, pronunciation and language models

Then, using these models to get a **new transcription** on un-transcribed data. 


Models are descriptions of the language content that the system can use to interpret audio that it hasn't heard before.

> If you run the Docker version of Elpis, the processing all happens on your local computer, no data is uploaded to cloud servers. It is safe to use where your ethics or permissions prevent sharing or uploading your data. For the workshop, to save time installing Elpis, we have prepared some "cloud servers" with Elpis running. Using one of these is easier to get started, but does require that your data is uploaded to the internet. 

---

## Setup

### 1) Get some training files

Start with downloading some "toy data" to use during the workshop. [Download the Abui toy corpus here.](https://elpis.net.au/abui.zip)

### 2) Run Elpis

2a) If you are following these steps in a workshop, get an address from the workshop facilitator, open a new web browser (Chrome or Firefox), paste the address into the location bar and press Enter/Return to start Elpis. 

OR

2b) If you already have Docker installed and you want to run Elpis on your own computer, download and run the Elpis Docker image by running this command in a terminal, `docker run --rm -p 5000:5000/tcp coedl/elpis:icldc` 
 and when it is running open `http://0.0.0.0:5000` in a browser.

### 3) When Elpis starts it looks like this. 
We'll make it look a bit more welcoming soon!

![Welcome](icldc/10-welcome.png)

---

## Interface tour
Click through to the *New Data Bundle* page.

![New data](icldc/20-new-data.png)

There are three main steps, with sub-steps in each. 

1. Data Bundles
2. Models
3. New transcriptions

**Data bundles** is where we collect and clean the audio and text which we will train the models with. 

**Models** is where “letter to sound” rules are applied to the data files to build a pronunciation dictionary, and then the acoustic and language models are trained. 

**New transcriptions** is the place we go to use an existing model to obtain a first-pass transcription on new audio. 

---

## About the files you need

The system trains with existing audio files and transcription files (also called data). Generally, the more data you can train with, the better the results. However, it’s not simply a matter of throwing everything you have into a bucket. Time spent cleaning and fine-tuning your existing transcriptions will have a good impact on your results. 

You will typically get better results with small data sets by using data from a common recording activity (also known as a domain), e.g. short sentences, or stories, or word-repetition exercises. 

For Elpis, the file format requirements are:

a) WAV audio, preferably 44.1kHz mono but the system can convert stereo files and resample from different sample rates.

b) Orthographic transcription of the audio. For today’s workshop, the interface is limited to using Elan transcriptions. 

> We have other tools that will convert TextGrid and Transcriber data and will integrate this in the near future. Please let us know about your own data formats so we can include them in future versions!

c) Filenames of the transcription must match the audio filename.

> We are working on different ways to deal with this but for now, these are best done manually.

Transcriptions don’t need to be word level. Annotations at an utterance/phrase level are fine. 

Clean your transcriptions by looking through them and checking the following:

- Standardise variation in spelling
* Replace non-lexical number forms, shorthand forms and abbreviations with full lexical forms. For example, replace ‘9’ with ‘nine’.
- For more cleaning tips, see the [Data preparation](https://github.com/CoEDL/elpis/wiki/Data-preparation) wiki page.

**When you are happy with your data,  make a New Data Bundle and then Add data.**

![Add files](icldc/30-add-files.png)

Check how the text has been cleaned on the **Data preparation** page. 

![Prepare data](icldc/40-prepare.png)

---

## Letter to sound preparation

The **letter to sound** file is a text file you create, of rules mapping your orthography into phonemic transcription. It will be used to build a pronunciation lexicon for your data set.

It is formatted in two columns, space separated. Left column is all the characters in your corpus. The right column is a symbol representing the sound. You can use IPA or SAMPA for the right column. Comments can be written in the file with a # starting the comment line. For example,

```
# Abui
j J
f f
s s
h h
m m
n n
ng ŋ
r r
```

**After preparing your letter-to-sound file, make a New Model**

![New model](icldc/50-new-model.png)

**Then upload the Letter to sound file.**

![Letter to sound](icldc/60-l2s.png)

This will build a pronunciation lexicon (also known as a pronunciation dictionary). Look at it on the **Lexicon** step.

![Lexicon](icldc/70-lexicon.png)

The `!SIL` and `<unk>` lines are used to handle silence and unknown words.

Check words that have been transcribed with consecutive matching characters. Do they represent one sound or two? If only one, add a line to your `letter-to-sound.txt` file, mapping the consecutive characters to a single symbol and rebuild the lexicon. 

For example, if `wu̱nne̱` is mapped to `wu̱nne̱ w ɨ n n ɛ` in the lexicon, then add `nn n` to `letter-to-sound.txt`, upload it again and rebuild the lexicon.  The results should be collapsed lexicon entry `wu̱nne̱ w ɨ n ɛ`.

If your language has digraphs, put these earlier in the l2s, above single characters. For example,
```
ng ŋ
n n
```

---

## Training

Now your training data has been uploaded and the lexicon has been built, you are ready to start the training process. 

On the **Settings** step, you can set the n-gram value. A unigram (1) value will train the model on each word. A trigram (3) value with train the model by words with their neighbours. 

![Settings](icldc/80-settings.png)

Got to the **Training** step to kick off the training process. Press Start training to begin. 

![Ready](icldc/90-training.png)

At the moment we don’t have any indication of how the training is progressing.. we are planning on showing this in two ways - one friendly way of the sub-steps in the training being highlighted as it happens, and also showing the output from the Kaldi engine. 

![Training](icldc/100-training.png)

When it has finished, we should see **trained** in the middle of the page.

![Trained](icldc/110-trained.png)

---

## Results


When training is done, go to the Results page to see the stats for this model. These results tell us how the training went, and helps us to understand what happened in the training process. These numbers are **scored** by comparing the words in one of the original transcriptions against the machine's version.

The results are:

- WER - Word Error Rate
- a word count
- INS - words that have been inserted (added)
- DEL - words that were deleted (missed)
- SUB - words that have been substituted (mistaken)

![Results](icldc/120-results.png)

----

## Making a new transcription

Now the model has been trained, on the **New Transcriptions** step, we can **Choose a file**.

![New transcription](icldc/130-transcribe.png)

The transcribing begins when you upload it.  The process can take time, depending on how long your audio is. 

> We are working on being able to handle long audio better. For now, just use a single utterance. Stay tuned for updates on this feature.

Go to the transcription Results page. When transcribing is complete and the Elan file has been generated, the button to **Download an Elan file** will show. Save this into the same folder that the new audio file came from.

![Download](icldc/140-download.png)

> If you are using your own audio, rename the audio to `audio.wav`.


Listen in Elan. 

![Elan](icldc/150-elan.png)

