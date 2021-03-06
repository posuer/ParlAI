parlai train_model \
    -m transformer/generator \
    --init-model zoo:tutorial_transformer_generator/model \
    --dict-file zoo:tutorial_transformer_generator/model.dict \
    --embedding-size 512 --n-layers 8 --ffn-size 2048 --dropout 0.1 \
    --n-heads 16 --learn-positional-embeddings True --n-positions 512 \
    --variant xlm --activation gelu --skip-generation True --fp16 True \
    --dict-tokenizer bpe \
    --dict-lower True -lr 1e-06 --optimizer adamax \
    --lr-scheduler reduceonplateau --gradient-clip 0.1 -veps 0.25 \
    --betas 0.9,0.999 --update-freq 1 --attention-dropout 0.0 \
    --relu-dropout 0.0 --skip-generation True -vp 15 -stim 60 -vme 20000 \
    -vmt ppl -vmm min --save-after-valid True \
    --model-file tmp/atomic_train_90M \
    --text-truncate 32 --label-truncate 8 -bs 32 \
    -t fromfile:parlaiformat --fromfile_datapath data/atomic/ \
    --fromfile-datatype-extension true
# parlai display_data -t fromfile:parlaiformat --fromfile_datapath data/atomic/ --fromfile-datatype-extension true
#--multitask-weights 1,3,3,3
# -t commonsenseqa \
