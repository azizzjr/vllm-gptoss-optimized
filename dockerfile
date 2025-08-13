FROM vllm/vllm-openai:gptoss

# Container metadata and description
LABEL org.opencontainers.image.title="vLLM GPT-OSS Optimized"
LABEL org.opencontainers.image.description="High-performance vLLM + GPT-OSS-20B container optimized for NVIDIA B200 GPUs with mxfp4 quantization. Includes JupyterLab and custom API server for sub-400ms response times in sales AI applications."
LABEL org.opencontainers.image.vendor="azizzjr"
LABEL org.opencontainers.image.version="1.0"
LABEL org.opencontainers.image.url="https://github.com/azizzjr"
LABEL org.opencontainers.image.documentation="https://github.com/azizzjr/vllm-gptoss-optimized"
LABEL org.opencontainers.image.source="https://github.com/azizzjr/vllm-gptoss-optimized"

# Sales AI specific labels
LABEL ai.model="openai/gpt-oss-20b"
LABEL ai.optimization="nvidia-b200-mxfp4"
LABEL ai.usecase="sales-voice-ai"
LABEL ai.latency="sub-400ms"

# Technical labels
LABEL vllm.version="0.10.2+"
LABEL cuda.version="12.8"
LABEL gpu.required="nvidia-b200"
LABEL gpu.memory="80gb+"

# Install JupyterLab
RUN pip install --no-cache-dir jupyterlab

# Copy our modified API server
COPY api_server.py /usr/local/lib/python3.12/dist-packages/vllm/entrypoints/openai/api_server.py

# Set permissions
RUN chmod +x /usr/local/lib/python3.12/dist-packages/vllm/entrypoints/openai/api_server.py

WORKDIR /workspace
