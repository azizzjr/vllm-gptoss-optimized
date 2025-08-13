# vLLM GPT-OSS Optimized Container

High-performance Docker container for running GPT-OSS-20B with vLLM, optimized for NVIDIA B200 GPUs and sales AI applications.

## Features

- **Sub-150ms Response Times** - Optimized for real-time voice conversations
- **NVIDIA B200 + mxfp4** - Native support for latest Blackwell architecture  
- **GPT-OSS-20B Model** - Advanced reasoning capabilities for complex sales scenarios
- **JupyterLab Included** - Built-in development environment
- **Sales AI Optimized** - Preconfigured for objection handling and negotiations

## Quick Start

### RunPod Deployment

```bash
# Container Image
ghcr.io/azizzjr/vllm-gptoss-optimized:latest

# Start Command (Custom Mode)
python -m vllm.entrypoints.openai.api_server --custom-mode

# Start Command (Production Mode)  
python -m vllm.entrypoints.openai.api_server --model openai/gpt-oss-20b --host 0.0.0.0 --port 8000
```

### Environment Variables

```bash
HF_HOME=/workspace/hf_cache
HUGGINGFACE_HUB_CACHE=/workspace/hf_cache
TRANSFORMERS_CACHE=/workspace/hf_cache
VLLM_USE_FLASHINFER_MXFP4_MOE=1
PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
```

### Required Ports

- `8888/http` - JupyterLab interface
- `8000/http` - vLLM OpenAI-compatible API
- `22/tcp` - SSH access

## Performance

| Metric | Target | Hardware |
|--------|--------|----------|
| Response Time | 50-150ms | NVIDIA B200 |
| Throughput | 300+ tokens/sec | 80GB+ VRAM |
| Memory Usage | ~14GB | mxfp4 quantization |
| Model Size | GPT-OSS-20B | Advanced reasoning |

## Usage Modes

### Custom Mode (Development)
- Container starts with JupyterLab only
- Manual control over model loading
- Perfect for testing and optimization

### Production Mode (Auto-optimized)
- Automatic B200 optimizations applied
- Model loads with best performance settings
- Ready for API requests immediately

## API Endpoints

```bash
# Health Check
curl http://localhost:8000/health

# Chat Completion
curl -X POST "http://localhost:8000/v1/chat/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-oss-20b",
    "messages": [
      {"role": "system", "content": "You are a helpful sales assistant."},
      {"role": "user", "content": "How should I handle a price objection?"}
    ],
    "max_tokens": 150,
    "temperature": 0.1
  }'

# Completion
curl -X POST "http://localhost:8000/v1/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-oss-20b",
    "prompt": "In a sales call, when a customer objects with price concerns, the best response is",
    "max_tokens": 100,
    "temperature": 0.1
  }'
```

## Sales AI Use Cases

- **Real-time Voice Conversations** - Sub-400ms VAPI integration
- **Objection Handling** - Advanced reasoning for complex scenarios
- **Contract Negotiations** - Multi-step decision making
- **Technical Q&A** - Instant product specification matching
- **Lead Qualification** - Intelligent customer segmentation

## Monitoring

```bash
# GPU Usage
nvidia-smi

# API Metrics  
curl http://localhost:8000/metrics

# JupyterLab Access
https://[pod-id]-8888.proxy.runpod.net
```

## Requirements

- **GPU:** NVIDIA B200 (or compatible Blackwell/Hopper)
- **VRAM:** 80GB+ recommended
- **Storage:** 500GB+ for model cache
- **CUDA:** 12.8+ (included in container)

## Built With

- **vLLM 0.10.2+** - High-performance LLM serving
- **GPT-OSS-20B** - OpenAI's reasoning model
- **CUDA 12.8** - Latest GPU acceleration
- **JupyterLab 4.4.5** - Interactive development
- **mxfp4 Quantization** - B200-optimized precision

## Optimization Features

- **CUDA Graphs Enabled** - Reduced kernel launch overhead
- **FlashInfer Kernels** - B200-optimized attention
- **Chunked Prefill** - Better batching efficiency  
- **95% GPU Memory Utilization** - Maximum KV cache
- **Small Batch Optimization** - Prioritizes TTFT over throughput

## Contributing

This container is optimized for sales AI workloads. For general vLLM usage, see the [official vLLM repository](https://github.com/vllm-project/vllm).

## 📄 License

Based on vLLM (Apache 2.0) and GPT-OSS model weights.
