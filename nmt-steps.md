# Tensorflow NMT tutorial


This is a summary of the commands in the [Tensorflow NMT tutorial](https://github.com/tensorflow/nmt#hands-on--lets-train-an-nmt-model)




`cd ~`

`git clone https://github.com/tensorflow/nmt/`

`cd nmt`

`nmt/scripts/download_iwslt15.sh nmt_data`



Run a docker image to make a container

```
docker run -it --rm -v $PWD:/tmp -w /tmp tensorflow/tensorflow bash
```


Train (this is in the Docker container)

```
python -m nmt.nmt     --src=vi --tgt=en     --vocab_prefix=/tmp/nmt_data/vocab      --train_prefix=/tmp/nmt_data/train     --dev_prefix=/tmp/nmt_data/tst2012      --test_prefix=/tmp/nmt_data/tst2013     --out_dir=/tmp/nmt_model     --num_train_steps=12000     --steps_per_stats=100     --num_layers=2     --num_units=128     --dropout=0.2     --metrics=bleu
```


This will take a while, and suck the life out of your battery if you are on a laptop. 

:japanese_ogre:


Make an infer source file named `my_infer_file.vi` in the nmt directory, with a sentence in the source language.

This should copy a line from nmt_data/tst2013.vi

``` 
sed '1q;d' nmt_data/tst2013.vi >> my_infer_file.vi
```

Result

```
nmt
├── CONTRIBUTING.md
├── LICENSE
├── README.md
├── my_infer_file.vi
├── nmt
├── nmt_data
└── nmt_model

```


Do the inference

```
python -m nmt.nmt \
    --out_dir=/tmp/nmt_model \
    --inference_input_file=/tmp/my_infer_file.vi \
    --inference_output_file=/tmp/nmt_model/output_infer
```

Look at the inference

```
cat /tmp/nmt_model/output_infer
```