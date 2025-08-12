FROM vllm/vllm-openai:gptoss

# Install JupyterLab
RUN pip install --no-cache-dir jupyterlab

# Copy our modified API server
COPY api_server.py /usr/local/lib/python3.12/dist-packages/vllm/entrypoints/openai/api_server.py

# Set permissions
RUN chmod +x /usr/local/lib/python3.12/dist-packages/vllm/entrypoints/openai/api_server.py

WORKDIR /workspace