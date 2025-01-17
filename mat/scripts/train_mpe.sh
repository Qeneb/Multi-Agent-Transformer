#!/bin/sh
env="MPE"
scenario="simple_spread"  # simple_speaker_listener # simple_reference simple_spread
num_landmarks=3
num_agents=3
algo="mat"
exp="single"
seed=1

echo "env is ${env}, scenario is ${scenario}, algo is ${algo}, exp is ${exp}, seed is ${seed}"
CUDA_VISIBLE_DEVICES=3 python train/train_mpe.py --env_name ${env} --algorithm_name ${algo} --experiment_name ${exp} --scenario_name ${scenario} --num_agents ${num_agents} --num_landmarks ${num_landmarks} --seed ${seed} --n_block 1 --n_embd 64 --n_training_threads 16 --n_rollout_threads 128 --num_mini_batch 1 --episode_length 25 --num_env_steps 20000000 --ppo_epoch 10 --clip_param 0.05 --use_ReLU --gain 0.01 --lr 7e-4 --critic_lr 7e-4 --use_eval