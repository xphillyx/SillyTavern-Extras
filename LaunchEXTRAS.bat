@echo off

REM Modules
REM Name         Description
REM caption      Image captioning
REM summarize    Text summarization
REM classify     Text sentiment classification
REM sd           Stable Diffusion image generation (remote A1111 server by default)
REM silero-tts   Silero TTS server
REM chromadb     Vector storage server
REM talkinghead  Talking Head Sprites
REM edge-tts     Microsoft Edge TTS client
REM coqui-tts    Coqui TTS server
REM rvc          Real-time voice cloning
REM websearch    Google search using Selenium headless browser
REM whisper-stt	 Voice recognition Whisper
REM vosk-stt	 Voice recognition Vosk
REM streaming-stt Voice recognition Streaming
REM
REM --stt-whisper-model-path
REM --stt-vosk-model-path
REM --enable-modules    Required option. Provide a list of enabled modules.
REM                     Expects a comma-separated list of module names. See Modules
REM                     Example: --enable-modules=caption,sd
REM --port              Specify the port on which the application is hosted. Default: 5100
REM --listen            Host the app on the local network
REM --share             Share the app on CloudFlare tunnel
REM --secure            Adds API key authentication requirements. Highly recommended when paired with share!
REM --cpu               Run the models on the CPU instead of CUDA. Enabled by default.
REM --mps or --m1       Run the models on Apple Silicon. Only for M1 and M2 processors.
REM --cuda              Uses CUDA (GPU+VRAM) to run modules if it is available. Otherwise, falls back to using CPU.
REM --cuda-device       Specifies a CUDA device to use. Defaults to cuda:0 (first available GPU).
REM --talkinghead-gpu   Uses GPU for talkinghead (10x FPS increase in animation).
REM --coqui-gpu         Uses GPU for coqui TTS (if available).
REM --coqui-model       If provided, downloads and preloads a coqui TTS model. Default: none.
REM                     Example: tts_models/multilingual/multi-dataset/bark
REM --summarization-model   Load a custom summarization model.
REM                         Expects a HuggingFace model ID.
REM                         Default: Qiliang/bart-large-cnn-samsum-ChatGPT_v3
REM --classification-model  Load a custom sentiment classification model.
REM                         Expects a HuggingFace model ID.
REM                         Default (6 emotions): nateraw/bert-base-uncased-emotion
REM                         Other solid option is (28 emotions): joeddav/distilbert-base-uncased-go-emotions-student
REM                         For Chinese language: touch20032003/xuyuan-trial-sentiment-bert-chinese
REM --captioning-model      Load a custom captioning model.
REM                         Expects a HuggingFace model ID.
REM                         Default: Salesforce/blip-image-captioning-large
REM --embedding-model       Load a custom text embedding model.
REM                         Expects a HuggingFace model ID.
REM                         Default: sentence-transformers/all-mpnet-base-v2
REM --chroma-host           Specifies a host IP for a remote ChromaDB server.
REM --chroma-port           Specifies an HTTP port for a remote ChromaDB server.
REM                         Default: 8000
REM --sd-model              Load a custom Stable Diffusion image generation model.
REM                         Expects a HuggingFace model ID.
REM                         Default: ckpt/anything-v4.5-vae-swapped
REM                         Must have VAE pre-baked in PyTorch format or the output will look drab!
REM --sd-cpu                Force the Stable Diffusion generation pipeline to run on the CPU.
REM                         SLOW!
REM --sd-remote             Use a remote SD backend.
REM                         Supported APIs: sd-webui
REM --sd-remote-host        Specify the host of the remote SD backend
REM                         Default: 127.0.0.1
REM --sd-remote-port        Specify the port of the remote SD backend
REM                         Default: 7860
REM --sd-remote-ssl         Use SSL for the remote SD backend
REM                         Default: False
REM --sd-remote-auth        Specify the username:password for the remote SD backend (if required)


cd SillyTavern-extras
call conda activate extras
python server.py --enable-modules=caption,summarize,classify
